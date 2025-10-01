`timescale 1ns / 1ps
`include "ervp_global.vh"
`include "platform_info.vh"

module requantizer #(
    parameter BW_DATA        = 32,
    parameter BW_BYTE_WEN    = 4,
    parameter BW_CELL_INDEX  = 14,
    parameter MAX_OC         = 256,
    parameter MAX_IC_KWKH    = 1024
)(
    input  wire                     clk,
    input  wire                     rstnn,

    // read from input_buffer
    output reg  [BW_CELL_INDEX-1:0] ibuff_rindex,
    output reg                      ibuff_renable,
    input  wire [BW_DATA-1:0]       ibuff_rdata,

    // write to output_buffer
    output reg  [BW_CELL_INDEX-1:0] obuff_index,
    output reg                      obuff_enable,
    output reg  [BW_BYTE_WEN-1:0]   obuff_wbe,
    output reg  [BW_DATA-1:0]       obuff_wdata,

    // control & parameter ports
    input  wire [31:0]              input_channel,
    input  wire [31:0]              output_channel,
    input  wire [31:0]              out_h,
    input  wire [31:0]              out_w,
    input  wire [31:0]              kernel_w,
    input  wire [31:0]              kernel_h,
    input  wire signed  [31:0]              input_zeropoint,
    input  wire [31:0]              layer_zeropoint,
    input  wire [31:0]              kernel_zeropoint,
    input  wire signed [31:0]              M0_int32,
    input  wire [31:0]              right_shift,
    input  wire signed [31:0]              biases_int32,
    input  wire [31:0]              channel_idx,    // for ACCUM_WT

    input  wire                     start,
    output reg                      end_flag
);

    localparam 
            IDLE         = 4'd0,
            LOAD_ADDR    = 4'd1,
            DATA_LOADING = 4'd2, 
            LOAD_DATA    = 4'd3,
            ACCUM_IN     = 4'd4,
            ACCUM_WT     = 4'd5,
            CALC         = 4'd6,
            SCALE        = 4'd7,
            SHIFT        = 4'd8,
	        CLAMP        = 4'd9,
   	        PACK         = 4'd10,
            STORE        = 4'd11,
		    CHECK        = 4'd12,
            DONE         = 4'd13;

    // FSM/state registers
    reg [3:0]   state;
    reg [31:0]  rd_cnt;       // word index into input buffer
    reg         done_in, done_wt;

    // pack state
    reg [1:0]   pack_cnt;
    reg [31:0]  pack_data;

    // dynamic sizes
    wire [31:0] kernel_size    = kernel_w * kernel_h;
    wire [31:0] out_size       = out_h * out_w;
    wire [31:0] N              = input_channel * kernel_size;
    wire [31:0] weight_bytes   = input_channel * kernel_size;
    wire [31:0] mm_bytes       = out_size * 4;
    wire [31:0] mm_offset      = (weight_bytes + 3) & ~32'd3;
    wire [31:0] im2col_bytes   = input_channel * kernel_size * output_channel;
    wire [31:0] im2col_offset  = mm_offset + mm_bytes;

    // in words
    wire [31:0] weight_words        = (weight_bytes     + 3) >> 2;
    wire [31:0] mm_offset_words     = mm_offset        >> 2;
    wire [31:0] mm_words            = mm_bytes         >> 2;
    wire [31:0] im2col_offset_words = im2col_offset    >> 2;
    wire [31:0] im2col_words        = (im2col_bytes     + 3) >> 2;

    // on-chip memories (all bounded by MAX_IC_KWKH)
    reg [7:0]    quant_weight  [0:MAX_IC_KWKH-1];
    reg [7:0]    im2col_input  [0:MAX_IC_KWKH-1];
    reg signed  [31:0]   mm_output     [0:MAX_IC_KWKH-1];
    reg [31:0]   input_acc     [0:MAX_IC_KWKH-1];
    reg signed [31:0]   weight_acc;

    // loop counters for ACCUM*, CALC/CLAMP
    reg [31:0]   acc_k, acc_n, acc_m;
    
    // temporary registers
    reg signed [63:0]   temp64;       // intermediate after scaling & rounding
    reg [7:0]    qout;         // final 8-bit quantized output

    integer i;

    wire signed [31:0] term1 = N * input_zeropoint * kernel_zeropoint;
    wire [31:0] im2col_ind = acc_k * out_size + acc_n;

    // 2) 워드 인덱스와 바이트 오프셋 분리
    wire [7:0]  wt_byte     = quant_weight[acc_k * kernel_size + acc_n];


    // main FSM
    always @(posedge clk or negedge rstnn) begin
      if (!rstnn) begin
        // reset all
        state         <= IDLE;
        rd_cnt        <= 0;
        done_in       <= 0;
        done_wt       <= 0;
        acc_k         <= 0;
        acc_n         <= 0;
        acc_m         <= 0;
        pack_cnt      <= 0;
        pack_data     <= 0;
        end_flag      <= 0;
        ibuff_renable <= 0;
        obuff_enable  <= 0;
        ibuff_rindex  <= 0;
        obuff_index   <= 0;
        obuff_wbe     <= 0;
        obuff_wdata   <= 0;
        temp64        <= 0;
        qout          <= 0;
        weight_acc    <= 0;
        // clear accumulators
        for (i = 0; i < MAX_IC_KWKH; i = i + 1) begin
            input_acc[i]    <= 0;
            quant_weight[i] <= 0;
            im2col_input[i] <= 0;
            mm_output[i]    <= 0;
        end
      end else begin
        case (state)
          // ----------------------------------------------------------------
          IDLE: begin // 0
            if (start && !end_flag) begin
              // init all counters
              rd_cnt        <= 0;
              acc_k         <= 0;
              acc_n         <= 0;
              done_in       <= 0;
              done_wt       <= 0;
              pack_cnt      <= 0;
              pack_data     <= 0;
              obuff_enable  <= 0;
              ibuff_renable <= 0;
              end_flag      <= 0;
              qout          <= 0;
              weight_acc    <= 0;
              state         <= LOAD_ADDR;
            end else if (!start && end_flag) begin
              end_flag <= 0;
            end
          end

          // ----------------------------------------------------------------
          LOAD_ADDR: begin // 1
            ibuff_rindex  <= rd_cnt;
            ibuff_renable <= 1;
            state         <= DATA_LOADING;
          end

          DATA_LOADING: begin // 2
            state <= LOAD_DATA;
          end

          LOAD_DATA: begin // 3
            // 1) load quantized weights
            if (rd_cnt < weight_words) begin
              quant_weight[rd_cnt*4    ] <= ibuff_rdata[ 7: 0];
              quant_weight[rd_cnt*4 + 1] <= ibuff_rdata[15: 8];
              quant_weight[rd_cnt*4 + 2] <= ibuff_rdata[23:16];
              quant_weight[rd_cnt*4 + 3] <= ibuff_rdata[31:24];
            end
            // 2) load matrix-mul output
            else if (rd_cnt < mm_offset_words + mm_words) begin
              mm_output[rd_cnt - mm_offset_words] <= ibuff_rdata;
            end
            // 3) load im2col input
            else if (rd_cnt < im2col_offset_words + im2col_words) begin
              im2col_input[(rd_cnt - im2col_offset_words)*4    ] <= ibuff_rdata[ 7: 0];
              im2col_input[(rd_cnt - im2col_offset_words)*4 + 1] <= ibuff_rdata[15: 8];
              im2col_input[(rd_cnt - im2col_offset_words)*4 + 2] <= ibuff_rdata[23:16];
              im2col_input[(rd_cnt - im2col_offset_words)*4 + 3] <= ibuff_rdata[31:24];
            end

            rd_cnt <= rd_cnt + 1;
            if (rd_cnt == im2col_offset_words + im2col_words) begin
              ibuff_renable <= 0;
              state         <= ACCUM_WT;
            end else begin
              state <= LOAD_ADDR;
              ibuff_renable <= 1'b0;
            end
          end

          // ----------------------------------------------------------------
        //   ACCUM_IN: begin // 4
        //     // accumulate im2col inputs
        //     //     wire [31:0] im2col_ind = acc_k * out_size + acc_n;
        //     input_acc[acc_m*out_size + acc_n] <= input_acc[acc_m*out_size + acc_n] + im2col_input[im2col_ind];
        //     if (acc_n == out_size-1) begin
        //         acc_n <= 0;
        //         if (acc_k == N-1) begin
        //             acc_k <= 0;
        //             if(acc_m == output_channel-1) begin
        //                 acc_m <= 0;
        //                 state <= ACCUM_WT;
        //             end else 
        //                 acc_m <= acc_m + 1;
        //         end else begin
        //             acc_k <= acc_k + 1;
        //         end
        //     end else begin
        //         acc_n <= acc_n + 1;
        //     end
        //   end

          // ----------------------------------------------------------------
          ACCUM_WT: begin // 5
            // accumulate weights
            
            weight_acc <= weight_acc + {{24{wt_byte[7]}}, wt_byte};
            if (acc_n == N-1) begin
              acc_n <= 0;
              if (acc_k == input_channel-1) begin
                acc_k <= 0;
                state <= CALC;
              end else begin
                acc_k <= acc_k + 1;
              end
            end else begin
              acc_n <= acc_n + 1;
            end
          end

          // ----------------------------------------------------------------
          CALC: begin // 6

            // wire [31:0] term1 = N * input_zeropoint * kernel_zeropoint;

            if (kernel_zeropoint != 0 || input_zeropoint != 0) begin ////////  조건 이상함 
                // basic bias add
                temp64 <= term1 - input_zeropoint*weight_acc + mm_output[acc_n];
            end else begin
                temp64 <= mm_output[acc_n];
            end
            
            state <= SCALE;
          end
        
          // ----------------------------------------------------------------
          SCALE: begin  // 7
            // scale & round
            temp64 <= (temp64 + biases_int32) * M0_int32;

            // go to clamp state
            state <= SHIFT;
          end
          
          // ----------------------------------------------------------------
          SHIFT: begin // 8
            if (temp64[right_shift-1])
              temp64 <= (temp64 >>> right_shift) + 1;
            else
              temp64 <=  temp64 >>> right_shift;

            state <= CLAMP;
          end

          // ----------------------------------------------------------------
          CLAMP: begin // 9
            // saturate to [0,255] and add layer zero-point
        
            // temp64 ≥ +255 인지(오버플로우 상한)
            if (temp64 >= 64'sd255) begin
                qout <= 8'hFF;
            end
            // temp64 ≤ 0 인지(언더플로우 하한)
            else if (temp64 <= 64'sd0) begin
                qout <= layer_zeropoint[7:0];
            end
            // 중간 값은 하위 8비트 + zero-point
            else begin
                qout <= temp64[7:0] + layer_zeropoint[7:0];
            end

            state <= PACK;
     

          end
      
          // ----------------------------------------------------------------
          PACK: begin // a

            // pack into 32-bit word
            pack_data[pack_cnt*8 +:8] <= qout;

            if(acc_n == out_size-1) begin
                pack_cnt <= 0;
                state <= STORE;
            end
            else begin
                if (pack_cnt == 3) begin
                    pack_cnt    <= 0;
                    acc_n       <= acc_n + 1;                    
                    state       <= STORE;
                end else begin
                    pack_cnt    <= pack_cnt + 1;
                    acc_n       <= acc_n   + 1;
                    state       <= CALC;   
                end
            end
          end

          // ----------------------------------------------------------------
          STORE: begin // b
            obuff_index  <= (acc_n-1) >> 2;
            obuff_wdata  <= pack_data;
            obuff_wbe    <= 4'b1111;
            obuff_enable <= 1;
            state <= CHECK;
          end
          
          // ----------------------------------------------------------------
          CHECK: begin // c
            if (acc_n == out_size-1) begin
                obuff_enable <= 0;
                state        <= DONE;
            end else begin
                obuff_enable <= 0;
                state        <= CALC;
            end
          end

          // ----------------------------------------------------------------
          DONE: begin // d
            end_flag <= 1;
            state    <= IDLE;
          end

          default: state <= IDLE;
        endcase
      end
    end

endmodule
