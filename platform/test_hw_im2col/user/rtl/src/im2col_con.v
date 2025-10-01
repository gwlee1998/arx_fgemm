`timescale 1ns / 1ps
`include "ervp_global.vh"
`include "munoc_network_include.vh"
`include "platform_info.vh"

module im2col_con #(
    parameter BW_DATA        = 32,
    parameter BW_BYTE_WEN    = 4,
    parameter BW_CELL_INDEX  = 14
)(
    input  wire                       clk,
    input  wire                       rstnn,
    input  wire                       start,

    // configuration (User-preferred names)
    input  wire [BW_DATA-1:0]         C_in,
    input  wire [BW_DATA-1:0]         H_in,
    input  wire [BW_DATA-1:0]         W_in,
    input  wire [BW_DATA-1:0]         K_h,
    input  wire [BW_DATA-1:0]         K_w,
    input  wire [BW_DATA-1:0]         pad_h,
    input  wire [BW_DATA-1:0]         pad_w,
    input  wire [BW_DATA-1:0]         stride_h,
    input  wire [BW_DATA-1:0]         stride_w,
    input  wire [BW_DATA-1:0]         dilation_h,
    input  wire [BW_DATA-1:0]         dilation_w,
    input  wire [7:0]                 input_zeropoint,

    // input buffer (Port B)
    output reg  [BW_CELL_INDEX-1:0]   ibuff_rindex,
    output reg                        ibuff_renable,
    input  wire [BW_DATA-1:0]         ibuff_rdata,

    // output buffer (Port A)
    output reg  [BW_CELL_INDEX-1:0]   obuff_index,
    output reg                        obuff_enable,
    output reg  [BW_BYTE_WEN-1:0]     obuff_wbe,
    output reg  [BW_DATA-1:0]         obuff_wdata,

    output reg                        end_flag
);

  // FSM states
  localparam IDLE       = 3'd0;
  localparam CAL_ADD    = 3'd1;
  localparam ADDR_SHIFT = 3'd2;
  localparam WAIT_READ  = 3'd3;
  localparam LOAD       = 3'd4;
  localparam STORE      = 3'd5;
  localparam UPDATE     = 3'd6;

  reg [2:0] state, next_state;

  // nested counters
  reg [31:0] cnt_c, cnt_kh, cnt_kw, cnt_oh, cnt_ow;
  // output dims
  reg [31:0] Hout, Wout;
  // input pixel coords
  reg signed [31:0] input_row, input_col;
  // full byte address for read
  reg [31:0] full_addr;
  reg [1:0]  read_byte_off;
  // extracted pixel
  reg [7:0] pixel_byte;
  // output packing indices
  reg [31:0] flat_out_idx;
  reg [31:0] out_word_idx;
  reg [1:0]  out_byte_off;

  // wire calculation
  wire signed [31:0] calc_row  = cnt_kh * dilation_h + cnt_oh * stride_h - pad_h;
  wire signed [31:0] calc_col  = cnt_kw * dilation_w + cnt_ow * stride_w - pad_w;
  wire        [31:0] calc_flat = ((cnt_c * K_h * K_w + cnt_kh * K_w + cnt_kw) * Hout + cnt_oh) * Wout + cnt_ow;
  
  // Flag signal
  wire is_padding = (calc_row < 0 || calc_row >= H_in || calc_col < 0 || calc_col >= W_in);
  wire is_done    = (cnt_c == C_in-1 && cnt_kh == K_h-1 && cnt_kw == K_w-1 && cnt_oh == Hout-1 && cnt_ow == Wout-1);

////////////////
// FSM1: Next-state
////////////////
  always @(*) begin
    next_state = state; // Default: stay in current state
    case (state)
      IDLE:
        if (start && !end_flag) begin
          next_state = CAL_ADD;
        end else if (!start && end_flag) begin
          next_state = IDLE;
        end
      CAL_ADD:
        next_state = ADDR_SHIFT;
      ADDR_SHIFT:
        if (is_padding) begin
          next_state = STORE;
        end else begin
          next_state = WAIT_READ;
        end
      WAIT_READ:
        next_state = LOAD;
      LOAD:
        next_state = STORE;
      STORE:
        next_state = UPDATE;
      UPDATE:
        if (is_done) begin
          next_state = IDLE;
        end else begin
          next_state = CAL_ADD;
        end
      default:
        next_state = IDLE;
    endcase
  end

////////////////
// FSM2: Operation
////////////////
  always @(posedge clk or negedge rstnn) begin
    if (!rstnn) begin
      state         <= IDLE;
      cnt_c         <= 0; 		cnt_kh <= 0; 		cnt_kw <= 0;
      cnt_oh        <= 0; 		cnt_ow <= 0;
      Hout          <= 0; 		Wout   <= 0;	  
      full_addr     <= 0;
      read_byte_off <= 0;
      pixel_byte    <= 0;
      flat_out_idx  <= 0;
      out_word_idx  <= 0;
      out_byte_off  <= 0;
	  
	  ibuff_renable <= 1'b0;
	  ibuff_rindex  <= 0;
	  
      obuff_enable  <= 1'b0;
	  obuff_index   <= 0;
      obuff_wbe     <= 0;
      obuff_wdata   <= 0;
	  
	  end_flag      <= 1'b0;
    end else begin
	  // state logic
      state <= next_state;
      // Default
      ibuff_renable <= 1'b0;
      obuff_enable  <= 1'b0;
      end_flag      <= 1'b0;
	  
      case (state)
        IDLE: begin
          if (start && !end_flag) begin
            Hout <= (H_in + 2*pad_h - ((K_h-1)*dilation_h + 1)) / stride_h + 1;
            Wout <= (W_in + 2*pad_w - ((K_w-1)*dilation_w + 1)) / stride_w + 1;

			cnt_c         <= 0; 		cnt_kh <= 0; 		cnt_kw <= 0;
			cnt_oh        <= 0; 		cnt_ow <= 0; 
			full_addr     <= 0;
			read_byte_off <= 0;
			pixel_byte    <= 0;
			flat_out_idx  <= 0;
			out_word_idx  <= 0;
			out_byte_off  <= 0;
			
			ibuff_rindex  <= 0;
			obuff_index   <= 0;
			obuff_wbe     <= 0;
			obuff_wdata   <= 0;
          end
        end

        CAL_ADD: begin
          full_addr    <= cnt_c*H_in*W_in + calc_row*W_in + calc_col;
          flat_out_idx <= calc_flat;
        end

        ADDR_SHIFT: begin
          out_word_idx <= flat_out_idx >> 2;
          out_byte_off <= flat_out_idx[1:0];

          if (is_padding) begin
            pixel_byte <= input_zeropoint;
          end else begin
            ibuff_rindex  <= full_addr >> 2;    // Address for input buffer
            read_byte_off <= full_addr[1:0];    // For masking except 8-bits
            ibuff_renable <= 1'b1;              // Input buffer read enable signal
          end
        end

        WAIT_READ: begin
          // No operation
        end

        LOAD: begin
          // Extract 8-bits from read data
          case (read_byte_off)
            2'd0: pixel_byte <= ibuff_rdata[7:0];
            2'd1: pixel_byte <= ibuff_rdata[15:8];
            2'd2: pixel_byte <= ibuff_rdata[23:16];
            2'd3: pixel_byte <= ibuff_rdata[31:24];
          endcase
        end

        STORE: begin
          obuff_index  <= out_word_idx;
          obuff_enable <= 1'b1;
          case (out_byte_off)
            2'd0: begin obuff_wbe <= 4'b0001; obuff_wdata <= {24'h0, pixel_byte}; end
            2'd1: begin obuff_wbe <= 4'b0010; obuff_wdata <= {16'h0, pixel_byte, 8'h0}; end
            2'd2: begin obuff_wbe <= 4'b0100; obuff_wdata <= {8'h0, pixel_byte, 16'h0}; end
            2'd3: begin obuff_wbe <= 4'b1000; obuff_wdata <= {pixel_byte, 24'h0}; end
          endcase
        end

        UPDATE: begin
          if (is_done) begin
            end_flag <= 1'b1;
          end else begin
            if (cnt_ow < Wout-1) cnt_ow <= cnt_ow+1;
            else begin
              cnt_ow <= 0;
              if (cnt_oh < Hout-1) cnt_oh <= cnt_oh+1;
              else begin
                cnt_oh <= 0;
                if (cnt_kw < K_w-1) cnt_kw <= cnt_kw+1;
                else begin
                  cnt_kw <= 0;
                  if (cnt_kh < K_h-1) cnt_kh <= cnt_kh+1;
                  else begin 
                    cnt_kh <= 0; 
                    if (cnt_c < C_in-1) begin
						cnt_c <= cnt_c+1; 
					end
                  end
                end
              end
            end
          end
        end
      endcase
    end
  end

endmodule