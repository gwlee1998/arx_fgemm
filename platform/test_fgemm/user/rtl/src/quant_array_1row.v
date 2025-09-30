module quant_array_1row(
    clk,
    rstnn,
    
    start_i,
    busy_o,

    float_1row_valid_i,
    float_1row_ready_o,
    float_1row_data_i,

    quant_1row_valid_o,
    quant_1row_ready_i,
    quant_1row_data_o,
    quant_row_index_o,
    
    exp_scale_1elm_o,
    mantissa_scale_1elm_o,
    scale_valid_o,
    scale_ready_i
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

    input  wire                                 clk;
    input  wire                                 rstnn;
    input  wire                                 start_i;
    output wire                                 busy_o;
    input  wire                                 float_1row_valid_i;
    output wire                                 float_1row_ready_o;
    input  wire [MATRIX_NUM_COL*FP_DATA_W-1:0]  float_1row_data_i; 
    output wire                                 quant_1row_valid_o;
    input  wire                                 quant_1row_ready_i;
    output wire [MATRIX_NUM_COL*BIT_NUM-1:0]    quant_1row_data_o;
    output reg  [LOG_MATRIX_NUM_ROW-1:0]        quant_row_index_o;
    output wire [FP_EXP_W-1:0]                  exp_scale_1elm_o;
    output wire [FP_MANT_W-1:0]                 mantissa_scale_1elm_o;
    output wire                                 scale_valid_o;
    input  wire                                 scale_ready_i;

    genvar i;

    wire [FP_EXP_W-1:0]              exp_scale_1elm_d;
    wire [FP_MANT_W-1:0]             mantissa_scale_1elm_d;

    reg [MATRIX_NUM_COL*FP_DATA_W-1:0]   float_1row_data_q;
    reg [FP_EXP_W-1:0]              exp_scale_1elm_q;
    reg [FP_MANT_W-1:0]             mantissa_scale_1elm_q;
    
    reg [FP_EXP_W-1:0]              exp_scale_1elm_q_q;
    reg [FP_MANT_W-1:0]             mantissa_scale_1elm_q_q;

    reg float_q_data_valid;
    reg quant_1row_valid;

    wire input_accepted;
    wire output_accepted;
    wire pipeline_advance;

    reg QUANT_STATUS;
    localparam S_IDLE = 1'b0, S_BUSY = 1'b1;

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            QUANT_STATUS <= S_IDLE;
        end
        else begin
            case(QUANT_STATUS)
                S_IDLE: begin
                    if (start_i) begin
                        QUANT_STATUS <= S_BUSY;
                    end
                end
                S_BUSY: begin
                    if (output_accepted && (quant_row_index_o == MATRIX_NUM_ROW-1)) begin
                        QUANT_STATUS <= S_IDLE;
                    end
                end
            endcase
        end
    end

    assign input_accepted  = float_1row_valid_i && float_1row_ready_o;
    assign output_accepted = quant_1row_valid_o && quant_1row_ready_i && scale_ready_i;
    assign pipeline_advance = output_accepted || !quant_1row_valid;
    assign busy_o = (QUANT_STATUS == S_BUSY);
    assign float_1row_ready_o = (QUANT_STATUS == S_BUSY) && (pipeline_advance) && (quant_row_index_o < (MATRIX_NUM_ROW - 2));
    assign quant_1row_valid_o = quant_1row_valid;
    assign scale_valid_o = quant_1row_valid;
    assign exp_scale_1elm_o = exp_scale_1elm_q;
    assign mantissa_scale_1elm_o = mantissa_scale_1elm_q;

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            float_1row_data_q <= 0;
        end
        else if (input_accepted) begin
            float_1row_data_q <= float_1row_data_i;
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            float_q_data_valid <= 0;
            quant_1row_valid <= 0;
        end
        else if (pipeline_advance) begin
            float_q_data_valid <= input_accepted;
            quant_1row_valid <= float_q_data_valid;
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            exp_scale_1elm_q <= 0;
            mantissa_scale_1elm_q <= 0;
        end
        else if (input_accepted) begin
            exp_scale_1elm_q <= exp_scale_1elm_d;
            mantissa_scale_1elm_q <= mantissa_scale_1elm_d;
        end
    end

    //find_max 16x1
    max_finder #(
        .MAT_SIZE   (MATRIX_NUM_COL),
        .FP_DATA_W  (FP_DATA_W),
        .FP_EXP_W   (FP_EXP_W),
        .FP_MANT_W  (FP_MANT_W)
    ) i_scaler (
        .data_i         (float_1row_data_i),
        .max_exp_o      (exp_scale_1elm_d),  // RAW exponent
        .max_mantissa_o (mantissa_scale_1elm_d)
    );

    //quant_elm 16x1
    // localparam SIGN_BIT_WIDTH = VTA_DATA_WIDTH - BIT_NUM;
    generate
        for (i = 0; i < MATRIX_NUM_COL; i = i + 1) begin : gen_quant_array_1row
            wire [FP_DATA_W-1:0]        float_elm_data;
            wire [BIT_NUM-1:0]          quant_elm_data;
            reg  [BIT_NUM-1:0]          quant_elm_data_q;

            assign float_elm_data = float_1row_data_q[(i+1)*FP_DATA_W-1 -: FP_DATA_W];

            if(`USE_OPT_QUANT) begin
                quantize_elem_opt #(
                    .FP_DATA_W  (FP_DATA_W),
                    .FP_MANT_W  (FP_MANT_W),
                    .FP_EXP_W   (FP_EXP_W),
                    .FP_EXP_BIAS(FP_EXP_BIAS),
                    .BIT_NUM    (BIT_NUM)
                ) i_quantizer (
                    .r_data        (float_elm_data),
                    .mantissa_scale(mantissa_scale_1elm_q),
                    .exp_scale     (exp_scale_1elm_q),
                    .q_data        (quant_elm_data)
                );
            end
            else begin
                quantize_elem #(
                    .FP_DATA_W  (FP_DATA_W),
                    .FP_MANT_W  (FP_MANT_W),
                    .FP_EXP_W   (FP_EXP_W),
                    .FP_EXP_BIAS(FP_EXP_BIAS),
                    .BIT_NUM    (BIT_NUM)
                ) i_quantizer (
                    .r_data        (float_elm_data),
                    .mantissa_scale(mantissa_scale_1elm_q),
                    .exp_scale     (exp_scale_1elm_q),
                    .q_data        (quant_elm_data)
                );
            end
            always @(posedge clk, negedge rstnn) begin
                if (!rstnn) begin
                    quant_elm_data_q <= 0;
                end
                else if (float_q_data_valid && pipeline_advance) begin 
                    quant_elm_data_q <= quant_elm_data;
                end
            end
            always @(posedge clk, negedge rstnn) begin
                if (!rstnn) begin
                    exp_scale_1elm_q_q <= 0;
                    mantissa_scale_1elm_q_q <= 0;
                end
                else if (float_q_data_valid && pipeline_advance) begin
                    exp_scale_1elm_q_q <= exp_scale_1elm_q;
                    mantissa_scale_1elm_q_q <= mantissa_scale_1elm_q;
                end
            end
            // assign quant_1row_data_o[(i+1)*VTA_DATA_WIDTH-1 -: VTA_DATA_WIDTH] = {{SIGN_BIT_WIDTH{quant_elm_data_q[BIT_NUM-1]}},quant_elm_data_q};
            assign quant_1row_data_o[(i+1)*BIT_NUM-1 -: BIT_NUM] = quant_elm_data_q;
        end
    endgenerate

    // reg [LOG_MATRIX_NUM_ROW:0] inp_row_cnt, inp_row_cnt_q;
    // always @(posedge clk, negedge rstnn) begin
    //     if (!rstnn) begin
    //         inp_row_cnt <= 0;
    //     end
    //     else if (start_i) begin
    //         inp_row_cnt <= 0;
    //     end
    //     else if(float_1row_valid_i && float_1row_ready_o) begin
    //         if(inp_row_cnt == MATRIX_NUM_ROW-1)
    //             inp_row_cnt <= 0;
    //         else
    //             inp_row_cnt <= inp_row_cnt + 1;
    //     end
    // end

    // always @(posedge clk, negedge rstnn) begin
    //     if (!rstnn) begin
    //         inp_row_cnt_q <= 0;
    //     end
    //     else if (float_q_data_valid) begin
    //         inp_row_cnt_q <= inp_row_cnt;
    //     end
    // end

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            quant_row_index_o <= 0;
        end
        else begin
            if (QUANT_STATUS == S_IDLE) begin
                quant_row_index_o <= 0;
            end
            else if (output_accepted) begin
                if(quant_row_index_o < MATRIX_NUM_ROW-1)
                    quant_row_index_o <= quant_row_index_o + 1;
            end
        end
    end

endmodule