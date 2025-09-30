module scale_calculator_1row(
    qx_scl_exp_1elm_i,
    qx_scl_man_1elm_i,
    qw_scl_exp_list_i,
    qw_scl_man_list_i,
    qo_scl_exp_1row_data_o,
    qo_scl_man_1row_data_o
);
    `include "dca_matrix_qgemm_defines.vh"

    parameter FP_DATA_W = 32;
    parameter FP_EXP_W  = 8;
    parameter FP_MANT_W = 23;
    parameter FP_EXP_BIAS = 127;

    parameter MATRIX_NUM_COL    = `DCA_MATRIX_QDQ_NUM_COL;
    parameter MATRIX_NUM_ROW    = `DCA_MATRIX_QDQ_NUM_ROW;

    localparam MANT_VEC_WIDTH = FP_MANT_W * MATRIX_NUM_COL;
    localparam EXP_VEC_WIDTH  = FP_EXP_W * MATRIX_NUM_COL;
    localparam EXP_MAX = (1<<FP_EXP_W) - 2;  // 254 for FP32

    input  wire [FP_EXP_W -1:0]             qx_scl_exp_1elm_i;
    input  wire [FP_MANT_W-1:0]             qx_scl_man_1elm_i;
    input  wire [EXP_VEC_WIDTH -1:0]        qw_scl_exp_list_i;
    input  wire [MANT_VEC_WIDTH-1:0]        qw_scl_man_list_i;
    output wire [EXP_VEC_WIDTH -1:0]        qo_scl_exp_1row_data_o;
    output wire [MANT_VEC_WIDTH-1:0]        qo_scl_man_1row_data_o;

    genvar i;

    generate
        if(`QUANT_USING_EXP_AND_MANTISSA) begin: gen_scl_including_bump
            for (i = 0; i < MATRIX_NUM_COL; i = i + 1) begin
                wire [FP_EXP_W -1:0] exp_scale_qx_raw;
                wire [FP_EXP_W -1:0] exp_scale_qw_raw;
                wire signed [FP_EXP_W +1:0] exp_scale_sum;
                wire [FP_EXP_W-1:0] exp_scale_out;
                wire [FP_MANT_W:0] mant_scale_qx;
                wire [FP_MANT_W:0] mant_scale_qw;
                wire [2*FP_MANT_W+1:0] mant_scale_prod;
                wire [FP_MANT_W:0] mant_scale_norm;
                wire [FP_MANT_W-1:0] mant_scale_out;
                wire bump;
                assign mant_scale_qx = {1'b1,qx_scl_man_1elm_i};
                assign mant_scale_qw = {1'b1,qw_scl_man_list_i[(i+1)*FP_MANT_W-1 -: FP_MANT_W]};

                assign mant_scale_prod = mant_scale_qx * mant_scale_qw; // 2*(FP_MANT_W+1) bits
                // normalization
                assign bump = mant_scale_prod[2*FP_MANT_W+1];
                assign mant_scale_norm = (bump)?    mant_scale_prod[2*FP_MANT_W+1:FP_MANT_W+1]
                                                :   mant_scale_prod[2*FP_MANT_W:FP_MANT_W]; // flooring
                
                assign mant_scale_out = mant_scale_norm[FP_MANT_W-1:0];

                assign exp_scale_qx_raw = qx_scl_exp_1elm_i;
                assign exp_scale_qw_raw = qw_scl_exp_list_i[(i+1)*FP_EXP_W-1 -: FP_EXP_W];
                // e_out_raw = e1_raw + e2_raw - FP_EXP_BIAS + bump (RAW 규칙)
                assign exp_scale_sum =  $signed({2'b00, exp_scale_qx_raw})
                                        + $signed({2'b00, exp_scale_qw_raw})
                                        + $signed({{(FP_EXP_W){1'b0}}, bump})
                                        - $signed(FP_EXP_BIAS);
                // saturation to [0 .. RAW_MAX_
                assign exp_scale_out =  (exp_scale_sum <= 0)                ? 0 :
                                        (exp_scale_sum > EXP_MAX)      ? EXP_MAX :
                                                                        exp_scale_sum[FP_EXP_W-1:0];
                assign qo_scl_exp_1row_data_o[(i+1)*FP_EXP_W-1 -: FP_EXP_W] = exp_scale_out;
                assign qo_scl_man_1row_data_o[(i+1)*FP_MANT_W-1 -: FP_MANT_W] = mant_scale_out;
            end
        end
        else begin : gen_only_exp
            for (i = 0; i < MATRIX_NUM_COL; i = i + 1) begin
                wire [FP_EXP_W -1:0] exp_scale_qx_raw;
                wire [FP_EXP_W -1:0] exp_scale_qw_raw;
                wire signed [FP_EXP_W +1:0] exp_scale_sum;
                wire [FP_EXP_W-1:0] exp_scale_out;
                assign exp_scale_qx_raw = qx_scl_exp_1elm_i;
                assign exp_scale_qw_raw = qw_scl_exp_list_i[(i+1)*FP_EXP_W-1 -: FP_EXP_W];
                // e_out_raw = e1_raw + e2_raw - FP_EXP_BIAS + bump (RAW 규칙)
                assign exp_scale_sum =  $signed({2'b00, exp_scale_qx_raw})
                                        + $signed({2'b00, exp_scale_qw_raw})
                                        - $signed(FP_EXP_BIAS);
                // saturation to [0 .. RAW_MAX_
                assign exp_scale_out =
                    (exp_scale_sum <= 0)                ? 0 :
                    (exp_scale_sum > EXP_MAX)      ? EXP_MAX :
                                                        exp_scale_sum[FP_EXP_W-1:0];
                assign qo_scl_exp_1row_data_o[(i+1)*FP_EXP_W-1 -: FP_EXP_W] = exp_scale_out;
            end
        
            assign qo_scl_man_1row_data_o = 0;
        end
    endgenerate

endmodule