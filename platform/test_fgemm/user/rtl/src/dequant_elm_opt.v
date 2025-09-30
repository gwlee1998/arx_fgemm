module dequantize_elem_opt #(
    parameter FP_DATA_W   = 32,
    parameter FP_MANT_W   = 23,
    parameter FP_EXP_W    = 8,
    parameter FP_EXP_BIAS = 127,
    parameter BIT_NUM     = 16
)(
    input  wire signed [FP_DATA_W-1:0] acc_i,
    input  wire [FP_MANT_W-1:0]        mantissa_scale_i,  // 이미 결합된 scale
    input  wire [FP_EXP_W-1:0]          exp_scale_i,       // 이미 결합된 exp
    output wire [FP_DATA_W-1:0]        r_data_o
);

    localparam QMAX = (1 << (BIT_NUM-1)) - 1;  // 127
    localparam QSQ = QMAX * QMAX;              // 16129
    
    wire acc_sign = acc_i[31];
    wire [31:0] acc_abs = acc_sign ? (-acc_i) : acc_i;
    wire acc_is_zero = (acc_abs == 32'd0);
    
    wire [16:0] scale_mant = {1'b1, mantissa_scale_i[22 -: 15]};  // 1.xxx (2048~4095)
    
    // Step 1: acc * scale_mant
    wire [47:0] prod = acc_abs * scale_mant ;  // 32 + 16
    wire [63:0] prod_cor = (prod * 16'd60773);
    wire [30:0] scaled = prod_cor >> 33;
    
    reg [4:0] msb_pos;
    always @(*) begin
        casez(scaled[30:15])
            16'b1???????????????: msb_pos = 5'd30;
            16'b01??????????????: msb_pos = 5'd29;
            16'b001?????????????: msb_pos = 5'd28;
            16'b0001????????????: msb_pos = 5'd27;
            16'b00001???????????: msb_pos = 5'd26;
            16'b000001??????????: msb_pos = 5'd25;
            16'b0000001?????????: msb_pos = 5'd24;
            16'b00000001????????: msb_pos = 5'd23;
            16'b000000001???????: msb_pos = 5'd22;
            16'b0000000001??????: msb_pos = 5'd21;
            16'b00000000001?????: msb_pos = 5'd20;
            16'b000000000001????: msb_pos = 5'd19;
            16'b0000000000001???: msb_pos = 5'd18;
            16'b00000000000001??: msb_pos = 5'd17;
            16'b000000000000001?: msb_pos = 5'd16;
            16'b0000000000000001: msb_pos = 5'd15;
            default: begin
                casez(scaled[14:0])
                    15'b1??????????????: msb_pos = 5'd14;
                    15'b01?????????????: msb_pos = 5'd13;
                    15'b001????????????: msb_pos = 5'd12;
                    15'b0001???????????: msb_pos = 5'd11;
                    15'b00001??????????: msb_pos = 5'd10;
                    15'b000001?????????: msb_pos = 5'd9;
                    15'b0000001????????: msb_pos = 5'd8;
                    15'b00000001???????: msb_pos = 5'd7;
                    15'b000000001??????: msb_pos = 5'd6;
                    15'b0000000001?????: msb_pos = 5'd5;
                    15'b00000000001????: msb_pos = 5'd4;
                    15'b000000000001???: msb_pos = 5'd3;
                    15'b0000000000001??: msb_pos = 5'd2;
                    15'b00000000000001?: msb_pos = 5'd1;
                    15'b000000000000001: msb_pos = 5'd0;
                    default: msb_pos = 5'd0;
                endcase
            end
        endcase
    end
    
    reg [23:0] mantissa_norm;
    always @(*) begin
        if (msb_pos >= 23) begin
            mantissa_norm = scaled >> (msb_pos - 23);
        end else begin
            mantissa_norm = scaled << (23 - msb_pos);
        end
    end
    
    // wire [24:0] mant_adj = mantissa_norm + (mantissa_norm >> 7) + (1 << 15);
    // wire adj_carry = mant_adj[23];
    // wire [22:0] mantissa_final = adj_carry ? mant_adj[22:1] : mant_adj[22:0];
    wire [22:0] mantissa_final = mantissa_norm[22:0];

    wire [8:0] exp_temp = exp_scale_i + (msb_pos) - 5'd12;

    wire [7:0] exp_final = acc_is_zero ? 8'd0 :
                        (exp_temp[8]) ? 8'd0 :        // underflow
                        (exp_temp > 254) ? 8'd254 :   // overflow  
                        exp_temp[7:0];
    
    // IEEE754 조합
    assign r_data_o = acc_is_zero ? 32'd0 : {acc_sign, exp_final, mantissa_final};

endmodule