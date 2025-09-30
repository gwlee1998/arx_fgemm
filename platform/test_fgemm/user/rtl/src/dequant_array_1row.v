//output :: float
//input :: quantized int8, scale row

module dequant_array_1row(
    clk,
    rstnn,
    
    start_i,
    busy_o,

    quant_1row_valid_i,
    quant_1row_ready_o,
    quant_1row_data_i,
    quant_row_index_i,

    exp_scale_1row_i,
    mantissa_scale_1row_i,
    scale_valid_i,
    scale_ready_o,

    float_1row_valid_o, 
    float_1row_ready_i,
    float_1row_data_o
);
    `include "dca_matrix_qgemm_defines.vh"

    parameter BIT_NUM           = 8;
    parameter FP_DATA_W         = 32;
    parameter FP_EXP_W          = 8;
    parameter FP_MANT_W         = 23;
    parameter FP_EXP_BIAS       = 127;
    parameter VTA_DATA_WIDTH    = 32;

    parameter MATRIX_NUM_COL    = `DCA_MATRIX_QDQ_NUM_COL;
    parameter MATRIX_NUM_ROW    = `DCA_MATRIX_QDQ_NUM_ROW;
    
    localparam LOG_MATRIX_NUM_ROW = $clog2(MATRIX_NUM_ROW);

    input  wire                                         clk;
    input  wire                                         rstnn;
    input  wire                                         start_i;
    output wire                                         busy_o;
    input  wire                                         quant_1row_valid_i;
    output wire                                         quant_1row_ready_o;
    input  wire [MATRIX_NUM_COL*VTA_DATA_WIDTH-1:0]     quant_1row_data_i;
    input  wire [LOG_MATRIX_NUM_ROW-1:0]                quant_row_index_i;
    input  wire [MATRIX_NUM_COL*FP_EXP_W-1:0]           exp_scale_1row_i;
    input  wire [MATRIX_NUM_COL*FP_MANT_W-1:0]          mantissa_scale_1row_i;
    input  wire                                         scale_valid_i;
    output wire                                         scale_ready_o;
    output wire                                         float_1row_valid_o;
    input  wire                                         float_1row_ready_i;
    output wire [MATRIX_NUM_COL*FP_DATA_W-1:0]          float_1row_data_o;

    reg [LOG_MATRIX_NUM_ROW-1:0] float_row_num;
    reg dequant_req_valid, dequant_result_valid;
    
    reg [MATRIX_NUM_COL*VTA_DATA_WIDTH-1:0]     quant_row_data_q;
    reg [MATRIX_NUM_COL*FP_EXP_W-1:0]           exp_scale_row_q;
    reg [MATRIX_NUM_COL*FP_MANT_W-1:0]          mant_scale_row_q;
    reg [LOG_MATRIX_NUM_ROW-1:0]                input_row_index_q;

    wire [MATRIX_NUM_COL*FP_DATA_W-1:0]    dequant_row_data_d;
    reg  [MATRIX_NUM_COL*FP_DATA_W-1:0]    dequant_row_data_q;

    reg DQUANT_STATUS;
    localparam S_IDLE = 1'b0, S_BUSY = 1'b1;

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            DQUANT_STATUS <= S_IDLE;
        end
        else begin
            case(DQUANT_STATUS)
                S_IDLE: begin
                    if(start_i) begin
                        DQUANT_STATUS <= S_BUSY;
                    end
                end
                S_BUSY: begin
                    if(float_1row_valid_o && float_1row_ready_i && (float_row_num == MATRIX_NUM_ROW-1)) begin
                        DQUANT_STATUS <= S_IDLE;
                    end
                end
            endcase
        end
    end

    assign busy_o = (DQUANT_STATUS == S_BUSY);
    
    assign quant_1row_ready_o = (DQUANT_STATUS == S_BUSY) && float_1row_ready_i & scale_valid_i;
    assign scale_ready_o      = (DQUANT_STATUS == S_BUSY) && float_1row_ready_i & scale_valid_i;

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            dequant_req_valid       <= 1'b0;
            dequant_result_valid    <= 1'b0;
        end
        else begin
            dequant_req_valid       <= quant_1row_valid_i && scale_valid_i && quant_1row_ready_o;
            dequant_result_valid    <= dequant_req_valid;
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            quant_row_data_q  <= 0;
            exp_scale_row_q   <= 0;
            mant_scale_row_q  <= 0;
            input_row_index_q <= 0;
        end
        else if (quant_1row_valid_i && scale_valid_i && quant_1row_ready_o) begin
            quant_row_data_q  <= quant_1row_data_i;
            exp_scale_row_q   <= exp_scale_1row_i;
            mant_scale_row_q  <= mantissa_scale_1row_i;
            input_row_index_q <= quant_row_index_i;
        end
    end

    dequantize_vector #(
        .FP_DATA_W   (FP_DATA_W),
        .FP_MANT_W   (FP_MANT_W),
        .FP_EXP_W    (FP_EXP_W),
        .FP_EXP_BIAS (FP_EXP_BIAS),
        .BIT_NUM     (BIT_NUM),
        .LANES_NUM   (MATRIX_NUM_COL)
    ) u_dequantize_vector (
        .acc_vec_i            (quant_row_data_q),
        .mantissa_scale_vec_i (mant_scale_row_q),
        .exp_scale_vec_i      (exp_scale_row_q),
        .r_vec_o              (dequant_row_data_d)
    );

    // Row index aligned to output valid (pass-through with 1-cycle delay)
    reg [LOG_MATRIX_NUM_ROW-1:0] row_index_out_q;

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            dequant_row_data_q <= 0;
        end
        else if(dequant_req_valid) begin
            dequant_row_data_q <= dequant_row_data_d;
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            float_row_num <= 0;
        end
        else if(dequant_req_valid)begin
            float_row_num <= input_row_index_q;
        end
    end

    assign float_1row_valid_o = dequant_result_valid;
    assign float_1row_data_o = dequant_row_data_q;

endmodule