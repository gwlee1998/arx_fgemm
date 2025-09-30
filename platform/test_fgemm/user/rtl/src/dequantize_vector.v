module dequantize_vector #(
    parameter FP_DATA_W   = 32,
    parameter FP_MANT_W   = 23,
    parameter FP_EXP_W    = 8,
    parameter FP_EXP_BIAS = 127,
    parameter BIT_NUM     = 8,
    parameter LANES_NUM   = 4
)(
    // 각 lane의 정수 accumulator (packed)
    input  wire signed [LANES_NUM*FP_DATA_W-1:0] acc_vec_i,

    // 각 lane의 스케일 (packed)
    input  wire [LANES_NUM*FP_MANT_W-1:0] mantissa_scale_vec_i,
    input  wire [LANES_NUM*FP_EXP_W -1:0] exp_scale_vec_i,

    // 각 lane의 float32 결과 (packed)
    output wire [LANES_NUM*FP_DATA_W-1:0] r_vec_o
);
    `include "dca_matrix_qgemm_defines.vh"
    genvar i;
    generate
        for (i = 0; i < LANES_NUM; i = i + 1) begin : g_deq
            // lane별 슬라이스
            wire signed [FP_DATA_W-1:0] acc_i_lane;
            wire [FP_MANT_W-1:0]        mant_lane;
            wire [FP_EXP_W-1:0]         exp_lane;
            wire [FP_DATA_W-1:0]        r_o_lane;

            assign acc_i_lane = acc_vec_i[(i+1)*FP_DATA_W-1 -: FP_DATA_W];
            assign mant_lane  = mantissa_scale_vec_i[(i+1)*FP_MANT_W-1 -: FP_MANT_W];
            assign exp_lane   = exp_scale_vec_i[(i+1)*FP_EXP_W -1 -: FP_EXP_W];
            if(`USE_OPT_QUANT) begin
                dequantize_elem_opt #(.FP_DATA_W  (FP_DATA_W),
                    .FP_MANT_W  (FP_MANT_W),
                    .FP_EXP_W   (FP_EXP_W),
                    .FP_EXP_BIAS(FP_EXP_BIAS),
                    .BIT_NUM    (BIT_NUM)
                ) u_deq_lane (
                    .acc_i           (acc_i_lane),
                    .mantissa_scale_i(mant_lane),
                    .exp_scale_i     (exp_lane),
                    .r_data_o        (r_o_lane)
                );
            end
            else begin
                dequantize_elem #(
                    .FP_DATA_W  (FP_DATA_W),
                    .FP_MANT_W  (FP_MANT_W),
                    .FP_EXP_W   (FP_EXP_W),
                    .FP_EXP_BIAS(FP_EXP_BIAS),
                    .BIT_NUM    (BIT_NUM)
                ) u_deq_lane (
                    .acc_i           (acc_i_lane),
                    .mantissa_scale_i(mant_lane),
                    .exp_scale_i     (exp_lane),
                    .r_data_o        (r_o_lane)
                );
            end

            assign r_vec_o[(i+1)*FP_DATA_W-1 -: FP_DATA_W] = r_o_lane;
        end
    endgenerate


endmodule
