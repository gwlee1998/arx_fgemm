module quantize_elem #(
    parameter FP_DATA_W   = 32,
    parameter FP_MANT_W   = 23,
    parameter FP_EXP_W    = 8,
    parameter FP_EXP_BIAS = 127,
    parameter BIT_NUM     = 8,
    parameter DE_MARGIN   = 16
)(
    input  wire [FP_DATA_W-1:0] r_data,
    input  wire [FP_MANT_W-1:0] mantissa_scale,
    input  wire [FP_EXP_W-1:0]  exp_scale,
    output wire [BIT_NUM-1:0] q_data
);

    // localparam PREC     = FP_MANT_W; 
    localparam MANT_W   = FP_MANT_W + 1;
    localparam PREC_MAX = (1<<FP_MANT_W) - 1;
    // 중간폭: (Mx × Q) → MANT_W + BIT_NUM, <<PREC, + DE_MARGIN 여유
    localparam WIDE     = MANT_W + BIT_NUM + FP_MANT_W + DE_MARGIN;

    wire signed [BIT_NUM-1:0] QMAX_S = {1'b0, {(BIT_NUM-1){1'b1}}};
    wire signed [BIT_NUM-1:0] QMIN_S = {1'b1, {(BIT_NUM-1){1'b0}}};

    localparam [BIT_NUM-1:0] QMAX_U = {1'b0, {(BIT_NUM-1){1'b1}}};

    // ------------------------------------------------------------
    // [1] 입력 분해 (IEEE754 → 부호/지수/맨티사)
    wire                    x_sign   = r_data[FP_DATA_W-1];
    wire [FP_EXP_W-1:0]       x_expraw = r_data[FP_MANT_W+FP_EXP_W-1 : FP_MANT_W];
    wire signed [FP_EXP_W:0]  x_exp    = $signed({1'b0, x_expraw}) - FP_EXP_BIAS;
    wire [FP_MANT_W-1:0]  x_frac   = r_data[FP_MANT_W-1:0];
    wire [MANT_W-1:0]      x_mant   = {1'b1, x_frac}; // UQ1.(FP_MANT_W)

    // x==0이면 바로 0 출력
    wire x_is_zero = (r_data[FP_DATA_W-2:0] == {(FP_DATA_W-1){1'b0}});

    wire x_is_denorm = (x_expraw == 0) && (x_frac != 0);


    wire [2*MANT_W-1:0] PREC_AMNT_DIV_VAL;

    // ------------------------------------------------------------
    // [2] absmax A 분해
    wire [MANT_W-1:0]       A_mant   = {1'b1, mantissa_scale};           // UQ1.(FP_MANT_W)
    wire signed [FP_EXP_W:0]  A_exp    = $signed({1'b0, exp_scale}) - FP_EXP_BIAS;
    localparam [2*MANT_W-1:0] DIVIDEND = PREC_MAX << MANT_W;
    assign PREC_AMNT_DIV_VAL = (DIVIDEND/A_mant);
    // 스케일이 0인 경우 방어(이론상 불가능하지만)
    wire A_is_zero = (A_mant == {MANT_W{1'b0}});


    localparam mul_mxQ_W = MANT_W + BIT_NUM + 1; // 31 for 16-bit
    // [3] ratio = round( (Mx * Q * 2^PREC) / MA ) //PREC = MANT_W
    wire [mul_mxQ_W-1:0] mul_mxQ     = x_mant * QMAX_U; //BITNUM + MANT_W = 31
    
    localparam RATIO_WIDTH = mul_mxQ_W + (2*FP_MANT_W); // 31 + 23 + 1 = 55 // 2*FP_MANT_W + BIT_NUM + 2
    // (N + D/2) / D  → 정수 반올림 나눗셈 // no rounding
    // wire [RATIO_WIDTH-1:0] ratio_round = (mul_mxQ * PREC_AMNT_DIV_VAL); // ≈ Q_MAX * (mx/mA) << MANT_W
    wire [RATIO_WIDTH-1:0] ratio_round = (mul_mxQ * PREC_AMNT_DIV_VAL);

    // ------------------------------------------------------------
    // [4] 지수차 반영 (de <= 0이 보장됨)
    wire signed [FP_EXP_W:0] de_s = x_exp - A_exp;
    wire [FP_EXP_W:0] de_abs = (de_s[FP_EXP_W]) ? (~de_s + 1'b1) : de_s;

    reg [BIT_NUM+FP_MANT_W:0] val_after_de;  // 필요한 만큼만 (32비트 정도)
    reg [BIT_NUM+1:0] q_mag_scaled;
    
    reg [RATIO_WIDTH-1:0] temp;
// always 블록 수정

    wire [RATIO_WIDTH-1:0] temp_shift = ratio_round >> MANT_W;
always @(*) begin
    // 모든 경우에 동일한 시프트 적용
    
    if (de_s == 0) begin
        val_after_de = temp_shift[BIT_NUM+FP_MANT_W:0];
    end
    else if (de_s[FP_EXP_W]) begin
        if (de_abs >= 32) begin
            val_after_de = 0;
        end
        else begin
            val_after_de = (temp_shift >> de_abs);
        end
    end
    
    q_mag_scaled = (val_after_de + (1 << (FP_MANT_W-1))) >> FP_MANT_W;
end

    // ------------------------------------------------------------
    // [5] 부호 적용
    wire signed [BIT_NUM:0] q_signed = (x_sign)? 
        -$signed({1'b0, q_mag_scaled}) : 
         $signed({1'b0, q_mag_scaled});
    
    wire signed [BIT_NUM-1:0] q_sat = 
            (q_signed > QMAX_S) ? QMAX_S :
            (q_signed < QMIN_S) ? QMIN_S :
                               q_signed;

    // ------------------------------------------------------------
    // [6] 출력
    assign q_data = (x_is_zero || A_is_zero || x_is_denorm) ? {BIT_NUM{1'b0}} : q_sat;
    // // ------------------------------------------------------------
    // // [5] 크기 포화(|q| > QMAX → QMAX), 부호 적용
    // wire [WIDE-1:0] QMAX_WIDE     = {{(WIDE-BIT_NUM){1'b0}}, QMAX_U};
    // wire [WIDE-1:0] q_mag_clamped = (q_mag_scaled > QMAX_WIDE) ? QMAX_WIDE : q_mag_scaled;

    // wire signed [WIDE:0] q_signed_full = x_sign
    //     ? -$signed({1'b0, q_mag_clamped})
    //     :  $signed({1'b0, q_mag_clamped});

    // wire signed [BIT_NUM-1:0] q_raw = q_signed_full[BIT_NUM-1:0];
    // wire signed [BIT_NUM-1:0] q_sat =
    //     (q_raw > QMAX_S) ? QMAX_S :
    //     (q_raw < QMIN_S) ? QMIN_S :
    //                        q_raw;

    // // ------------------------------------------------------------
    // // [6] 출력
    // assign q_data = (x_is_zero || A_is_zero) ? {BIT_NUM{1'b0}} : q_sat;

endmodule