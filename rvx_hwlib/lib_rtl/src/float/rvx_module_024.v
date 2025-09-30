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





module RVX_MODULE_024
(
	rvx_port_05,
  rvx_port_09,
  rvx_port_01,

  rvx_port_07,
  rvx_port_10,
  rvx_port_03,

  rvx_port_12,
  rvx_port_00,
  rvx_port_08,

  rvx_port_02,
  rvx_port_06,
  rvx_port_13,
  rvx_port_11,

	rvx_port_04
);





`include "rvx_include_11.vh"

parameter RVX_GPARA_4 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_0 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_2 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_1 = BW_SIGNIFICAND_EXTENDED+1;
parameter RVX_GPARA_3 = 0;
localparam  RVX_LPARA_0 = 0; 

input wire [BW_FPIR_VALUE-1:0] rvx_port_05;
input wire [BW_FPIR_VALUE-1:0] rvx_port_09;
input wire rvx_port_01;

output wire [RVX_GPARA_4-1:0] rvx_port_07;
output wire [RVX_GPARA_4-1:0] rvx_port_10;
input wire [2*RVX_GPARA_4-1:0] rvx_port_03;

output wire [RVX_GPARA_0-1:0] rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_00;
input wire [RVX_GPARA_2-1:0] rvx_port_08;

output wire [RVX_GPARA_1-1:0] rvx_port_02;
output wire [RVX_GPARA_1-1:0] rvx_port_06;
output wire rvx_port_13;
input wire [RVX_GPARA_1-1:0] rvx_port_11;

output wire [BW_FPIR_VALUE-1:0] rvx_port_04;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_04;
wire rvx_signal_05;

wire rvx_signal_10;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_06;
wire rvx_signal_08;
wire [BW_EXPONENT_EXTENDED-1:0] rvx_signal_07;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_11;
wire rvx_signal_00;
wire [BW_EXPONENT-1:0] rvx_signal_03;
wire [BW_SIGNIFICAND-1:0] rvx_signal_09;
wire [BW_GUARD-1:0] rvx_signal_01;
wire [BW_OVERFLOW-1:0] rvx_signal_02;

assign rvx_port_04 = {rvx_signal_11, rvx_signal_00, rvx_signal_03, rvx_signal_09, rvx_signal_01, rvx_signal_02};

RVX_MODULE_090
#(
  .BW_EXPONENT(BW_EXPONENT),
  .BW_SIGNIFICAND(BW_SIGNIFICAND),
  .BW_GUARD(BW_GUARD),
  .BW_OVERFLOW(BW_OVERFLOW)
)
i_rvx_instance_2
(
	.rvx_port_1(rvx_port_05),
  .rvx_port_0(rvx_port_09),
  .rvx_port_3(rvx_port_01),
  .rvx_port_2(rvx_signal_04)
);

assign rvx_signal_05 = (rvx_signal_04!=`FPIR_TYPE_NORMAL);

RVX_MODULE_002
#(
  .BW_EXPONENT(BW_EXPONENT),
  .BW_SIGNIFICAND(BW_SIGNIFICAND),
  .BW_GUARD(BW_GUARD),
  .BW_OVERFLOW(BW_OVERFLOW),
  .RVX_GPARA_3(RVX_GPARA_4),
  .RVX_GPARA_0(RVX_GPARA_0),
  .RVX_GPARA_1(RVX_GPARA_2),
  .RVX_GPARA_2(RVX_GPARA_3)
)
i_rvx_instance_0
(
	.rvx_port_06(rvx_port_05),
  .rvx_port_04(rvx_port_09),
  .rvx_port_10(rvx_port_01),

  .rvx_port_11(rvx_port_07),
  .rvx_port_02(rvx_port_10),
  .rvx_port_07(rvx_port_03),

  .rvx_port_05(rvx_port_12),
  .rvx_port_08(rvx_port_00),
  .rvx_port_09(rvx_port_08),

  .rvx_port_03(rvx_signal_10),
  .rvx_port_00(rvx_signal_06),
  .rvx_port_01(rvx_signal_08)
);

RVX_MODULE_021
#(
  .BW_EXPONENT(BW_EXPONENT),
  .BW_SIGNIFICAND(BW_SIGNIFICAND),
  .BW_GUARD(BW_GUARD),
  .BW_OVERFLOW(BW_OVERFLOW),
  .RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_1(rvx_port_05),
  .rvx_port_2(rvx_port_09),
  .rvx_port_3(rvx_port_01),
  .rvx_port_0(rvx_signal_08),

  .rvx_port_7(rvx_port_02),
  .rvx_port_4(rvx_port_06),
  .rvx_port_8(rvx_port_13),
  .rvx_port_6(rvx_port_11),

  .rvx_port_5(rvx_signal_07)
);

assign rvx_signal_11 = rvx_signal_04;
assign rvx_signal_00 = rvx_signal_10;
assign {rvx_signal_02,rvx_signal_03} = rvx_signal_07;
assign {rvx_signal_09,rvx_signal_01} = rvx_signal_06;

endmodule
