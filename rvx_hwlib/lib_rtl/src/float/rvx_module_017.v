// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2025-08-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "fpir_define.vh"




module RVX_MODULE_017
(
	rvx_port_6,
	rvx_port_1,
	rvx_port_4,

	rvx_port_2,
	rvx_port_3,
	rvx_port_5,
	rvx_port_0
);




`include "rvx_include_11.vh"
`include "rvx_include_20.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire rvx_port_6;
input wire rvx_port_1;
input wire rvx_port_4;

input wire rvx_port_2;
input wire [BW_FPIR_VALUE-1:0] rvx_port_3;
output wire rvx_port_5;
output wire [BW_IEEE_VALUE-1:0] rvx_port_0;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_09;
wire rvx_signal_24;
wire [BW_EXPONENT-1:0] rvx_signal_05;
wire [BW_SIGNIFICAND-1:0] rvx_signal_20;
wire [BW_GUARD-1:0] rvx_signal_16;
wire [BW_OVERFLOW-1:0] rvx_signal_03;

localparam  RVX_LPARA_0 = `MAX(BW_IEEE_EXPONENT, BW_EXPONENT_EXTENDED);
localparam  RVX_LPARA_2 = BW_SIGNIFICAND_EXTENDED + BW_IEEE_SIGNIFICAND;

wire [RVX_LPARA_0-1:0] rvx_signal_11;
wire [RVX_LPARA_2-1:0] rvx_signal_14;

wire [RVX_LPARA_2-1:0] rvx_signal_02;
wire [RVX_LPARA_2-1:0] rvx_signal_22;
wire rvx_signal_19;

wire [RVX_LPARA_0-1:0] rvx_signal_17;
reg  [BW_IEEE_SIGNIFICAND-1:0] rvx_signal_10;

localparam  RVX_LPARA_1 = RVX_LPARA_2;
localparam  RVX_LPARA_3 = REQUIRED_BITWIDTH_INDEX(BW_IEEE_MANTISSA+1+BW_SIGNIFICAND_EXTENDED);

wire [RVX_LPARA_1-1:0] rvx_signal_04;
wire [RVX_LPARA_3-1:0] rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_01;

wire rvx_signal_12;
wire rvx_signal_18;
wire rvx_signal_00;

wire rvx_signal_23;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_06;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_08;

reg  rvx_signal_13;
reg  [BW_IEEE_EXPONENT-1:0] rvx_signal_21;
reg  [BW_IEEE_MANTISSA-1:0] rvx_signal_15;

assign {rvx_signal_09, rvx_signal_24, rvx_signal_05, rvx_signal_20, rvx_signal_16, rvx_signal_03} = rvx_port_3;

assign rvx_signal_11 = $signed({rvx_signal_03,rvx_signal_05});

RVX_MODULE_115
#(
  .RVX_GPARA_1(BW_SIGNIFICAND_EXTENDED),
  .RVX_GPARA_0(RVX_LPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_0({rvx_signal_20,rvx_signal_16}),
	.rvx_port_1(rvx_signal_14)
);

RVX_MODULE_069
#(
  .RVX_GPARA_1(RVX_LPARA_2),
  .RVX_GPARA_2(BW_SIGNIFICAND_EXTENDED),
  .UNSIGNED(1)
)
i_rvx_instance_1
(
	.rvx_port_2(rvx_signal_02),
	.rvx_port_1(rvx_signal_22),
  .rvx_port_0(rvx_signal_19)
);

assign rvx_signal_02 = rvx_signal_14;

assign rvx_signal_17 = $signed(rvx_signal_11) + IEEE_EXPONENT_BIAS  + $unsigned(rvx_signal_19);
always@(*)
begin
  rvx_signal_10 = 0;
  if(rvx_signal_19)
    rvx_signal_10[BW_IEEE_SIGNIFICAND-1] = 1;
  else
    rvx_signal_10 = rvx_signal_22[RVX_LPARA_2-1-:BW_IEEE_SIGNIFICAND];
end

assign rvx_signal_12 = (rvx_signal_10==0) | ($signed(rvx_signal_17)<(IEEE_EXPONENT_MIN_NORMALIZED-1));
assign rvx_signal_18 = (~rvx_signal_12) & ($signed(rvx_signal_17)<=0);
assign rvx_signal_00 = ($signed(rvx_signal_17)>IEEE_EXPONENT_MAX);

RVX_MODULE_104
#(
  .RVX_GPARA_3(RVX_LPARA_1),
  .RVX_GPARA_0(RVX_LPARA_3)
)
i_rvx_instance_2
(
	.rvx_port_0(rvx_signal_04),
	.rvx_port_2(rvx_signal_07),
	.rvx_port_1(rvx_signal_01)
);

assign rvx_signal_04 = rvx_signal_14;
assign rvx_signal_07 = (~rvx_signal_17) + 1'b 1 + 1'b 1 + BW_SIGNIFICAND_EXTENDED;

assign rvx_signal_23 = rvx_signal_24;
always@(*)
begin
  rvx_signal_06 = 0;
  rvx_signal_08 = 0;
  if(rvx_signal_12)
  begin
    rvx_signal_06 = 0;
    rvx_signal_08 = 0;
  end
  else if(rvx_signal_18)
  begin
    rvx_signal_06 = 0;
    rvx_signal_08 = rvx_signal_01;
  end
  else if(rvx_signal_00)
  begin
    rvx_signal_06 = IEEE_INF_EXPONENT;
    rvx_signal_08 = IEEE_INF_MANTISSA;
  end
  else
  begin
    rvx_signal_06 = rvx_signal_17;
    rvx_signal_08 = rvx_signal_10;
  end
end

always@(*)
begin
	rvx_signal_13 = 1'b1;
	rvx_signal_21 = IEEE_NAN_EXPONENT;
	rvx_signal_15 = IEEE_NAN_MANTISSA;
	case(rvx_signal_09)
		`FPIR_TYPE_NAN:
		begin
			rvx_signal_13= 1'b1;
			rvx_signal_21 = IEEE_NAN_EXPONENT;
			rvx_signal_15 = IEEE_NAN_MANTISSA;
		end
		`FPIR_TYPE_MINF:
		begin
			rvx_signal_13= 1'b1;
			rvx_signal_21 = IEEE_INF_EXPONENT;
			rvx_signal_15 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_PINF:
		begin
			rvx_signal_13= 1'b 0;
			rvx_signal_21 = IEEE_INF_EXPONENT;
			rvx_signal_15 = IEEE_INF_MANTISSA;
		end
		`FPIR_TYPE_MZERO:
		begin
			rvx_signal_13= 1'b1;
			rvx_signal_21 = 0;
			rvx_signal_15 = 0;
		end
		`FPIR_TYPE_PZERO:
		begin
			rvx_signal_13= 1'b 0;
			rvx_signal_21 = 0;
			rvx_signal_15 = 0;
		end
		default:
		begin
			rvx_signal_13= rvx_signal_23;
			rvx_signal_21 = rvx_signal_06;
			rvx_signal_15 = rvx_signal_08;
		end
	endcase
end

assign rvx_port_5 = rvx_port_2;
assign rvx_port_0 = {rvx_signal_13,rvx_signal_21,rvx_signal_15};

endmodule
