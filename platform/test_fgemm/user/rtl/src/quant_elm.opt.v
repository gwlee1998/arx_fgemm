module quantize_elem_opt #(
    parameter FP_DATA_W   = 32,
    parameter FP_MANT_W   = 23,
    parameter FP_EXP_W    = 8,
    parameter FP_EXP_BIAS = 127,
    parameter BIT_NUM     = 16,
    parameter DE_MARGIN   = 16
)(
    input  wire [FP_DATA_W-1:0] r_data,
    input  wire [FP_MANT_W-1:0] mantissa_scale,
    input  wire [FP_EXP_W-1:0]  exp_scale,
    output wire [BIT_NUM-1:0]   q_data
);

    localparam signed Q_MAX = (1 << (BIT_NUM-1)) - 1; // e.g. 127
    localparam signed Q_MIN = -(1 << (BIT_NUM-1));    // e.g. -128
    // IEEE754 분해
    wire x_sign = r_data[31];
    wire [7:0] x_expraw = r_data[30:23];
    wire [22:0] x_mant_frac = r_data;  // 16
    wire [22:0] x_mant = {1'b1, x_mant_frac[22 -: 16]}; // 1.xxxx 형태 // 1.xxx x 2048
    
    wire x_is_zero = (x_expraw == 8'd0);
    
    wire [14:0] scale_mant_frac = mantissa_scale[22 -:15];
    
    // 16개 LUT
    wire [3:0] lut_idx = scale_mant_frac[14 -: 4];
    reg [10:0] inv_scale;
    
    always @(*) begin
        case(lut_idx)
            4'd0:  inv_scale = 11'd2047;  // 1/1.0000
            4'd1:  inv_scale = 11'd1927;  // 1/1.0625 2048/1.0625 = 1927.68
            4'd2:  inv_scale = 11'd1820;  // 1/1.1250 2048/1.125 = 1820.44
            4'd3:  inv_scale = 11'd1725;  // 1/1.1875 2048/1.1875 = 1725.33
            4'd4:  inv_scale = 11'd1638;  // 1/1.2500 2048/1.25 = 1638.4
            4'd5:  inv_scale = 11'd1560;  // 1/1.3125 2048/1.3125 = 1560.96
            4'd6:  inv_scale = 11'd1489;  // 1/1.3750 2048/1.375 = 1489.09
            4'd7:  inv_scale = 11'd1425;  // 1/1.4375 2048/1.4375 = 1425.07
            4'd8:  inv_scale = 11'd1365;  // 1/1.5000 2048/1.5 = 1365.33
            4'd9:  inv_scale = 11'd1311;  // 1/1.5625 2048/1.5625 = 1310.72
            4'd10: inv_scale = 11'd1260;  // 1/1.6250 2048/1.625 = 1260.31
            4'd11: inv_scale = 11'd1215;  // 1/1.6875 2048/1.6875 = 1214.29
            4'd12: inv_scale = 11'd1170;  // 1/1.7500 2048/1.75 = 1170.28
            4'd13: inv_scale = 11'd1130;  // 1/1.8125 2048/1.8125 = 1130.22
            4'd14: inv_scale = 11'd1092;  // 1/1.8750 2048/1.875 = 1092.27
            4'd15: inv_scale = 11'd1057;  // 1/1.9375 2048/1.9375 = 1057.07
        endcase
    end
    
    wire [27:0] ratio_temp = x_mant * inv_scale; // x * ((2048-1)/max(A)) :: A = 1.xx , int11/frac17
    wire [16:0] ratio_scaled = (ratio_temp  >> 4'd11); // int11 , frac6
    wire [16:0] ratio_scaled_r = ratio_scaled + 1'b1; // int11 , frac6
    wire [15:0] ratio_round = ratio_scaled_r[16:1];

    wire [8:0] exp_diff = $signed({1'b0, exp_scale}) - $signed({1'b0, x_expraw});
    wire [BIT_NUM+1:0] q_mag = ratio_round >> (exp_diff + 8);

    wire signed [16:0] q_signed = x_sign ? -$signed({1'b0, q_mag}) : $signed({1'b0, q_mag});
    wire signed [15:0] q_final = (q_signed > Q_MAX) ? Q_MAX :
                                (q_signed < Q_MIN) ? Q_MIN :
                                q_signed[15:0];
    
    assign q_data = x_is_zero ? 0 : (q_final);

endmodule