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
`include "ervp_axi_define.vh"





module RVX_MODULE_101
(
	rvx_port_03,
	rvx_port_16,
  rvx_port_00,
  rvx_port_20,

  rvx_port_22,
  rvx_port_24,
  rvx_port_07,
  rvx_port_05,
  rvx_port_09,
  rvx_port_14,

  rvx_port_01,
  rvx_port_06,
  rvx_port_21,
  rvx_port_19,
  rvx_port_11,

  rvx_port_13,
	rvx_port_10,
	rvx_port_17,
	rvx_port_08,
	rvx_port_15,
	rvx_port_04,
	rvx_port_18,
	rvx_port_23,
	rvx_port_02,
  rvx_port_12
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter BW_LPI_BURDEN = 1;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_5 = 0;

parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_3 = RVX_GPARA_1;
parameter RVX_GPARA_2 = 1;

localparam  RVX_LPARA_0 = `NUM_BYTE(RVX_GPARA_3);

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = RVX_GPARA_0;
localparam  BW_LPIXS_DATA = RVX_GPARA_1;

`include "lpixs_lpara.vb"

input wire rvx_port_03;
input wire rvx_port_16;
input wire rvx_port_00;
input wire rvx_port_20;

output wire [2-1:0] rvx_port_22;
input wire rvx_port_24;
input wire rvx_port_07;
input wire rvx_port_05;
input wire rvx_port_09;
input wire [BW_LPI_QDATA-1:0] rvx_port_14;

input wire [2-1:0] rvx_port_01;
output wire rvx_port_06;
output wire rvx_port_21;
output wire rvx_port_19;
output wire [BW_LPI_YDATA-1:0] rvx_port_11;

output wire [RVX_GPARA_2-1:0] rvx_port_13;
output wire [RVX_GPARA_4*RVX_GPARA_2-1:0] rvx_port_10;
output wire [RVX_GPARA_2-1:0] rvx_port_17;
output wire [RVX_GPARA_2-1:0] rvx_port_08;
output wire [RVX_LPARA_0*RVX_GPARA_2-1:0] rvx_port_15;
output wire [RVX_GPARA_3*RVX_GPARA_2-1:0] rvx_port_04;
output wire [RVX_GPARA_3*RVX_GPARA_2-1:0] rvx_port_18;
output wire [RVX_GPARA_2-1:0] rvx_port_23;
input wire [RVX_GPARA_3*RVX_GPARA_2-1:0] rvx_port_02;
input wire [RVX_GPARA_2-1:0] rvx_port_12;

wire [2-1:0] rvx_signal_01;
wire rvx_signal_09;
wire rvx_signal_00;
wire rvx_signal_10;
wire rvx_signal_03;
wire [BW_LPI_QDATA-1:0] rvx_signal_08;

wire [2-1:0] rvx_signal_02;
wire rvx_signal_04;
wire rvx_signal_06;
wire rvx_signal_07;
wire [BW_LPI_YDATA-1:0] rvx_signal_05;

RVX_MODULE_026
#(
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .BW_LPI_QPARCEL(BW_LPI_QPARCEL),
  .BW_LPI_YPARCEL(BW_LPI_YPARCEL)
)
i_rvx_instance_1
(
  .rvx_port_21(rvx_port_03),
  .rvx_port_02(rvx_port_16),
  .rvx_port_11(rvx_port_00),
  .rvx_port_04(rvx_port_20),
  
  .rvx_port_08(rvx_port_22),
  .rvx_port_16(rvx_port_24),
  .rvx_port_13(rvx_port_07),
  .rvx_port_18(rvx_port_05),
  .rvx_port_14(rvx_port_09),
  .rvx_port_01(rvx_port_14),

  .rvx_port_12(rvx_port_01),
  .rvx_port_10(rvx_port_06),
  .rvx_port_17(rvx_port_21),
  .rvx_port_07(rvx_port_19),
  .rvx_port_09(rvx_port_11),

  .rvx_port_05(rvx_signal_01),
  .rvx_port_25(rvx_signal_09),
  .rvx_port_19(rvx_signal_00),
  .rvx_port_06(rvx_signal_10),
  .rvx_port_15(rvx_signal_03),
  .rvx_port_22(rvx_signal_08),

  .rvx_port_24(rvx_signal_02),
  .rvx_port_20(rvx_signal_04),
  .rvx_port_00(rvx_signal_06),
  .rvx_port_23(rvx_signal_07),
  .rvx_port_03(rvx_signal_05)
);

RVX_MODULE_031
#(
  .RVX_GPARA_5(RVX_GPARA_0),
  .RVX_GPARA_4(RVX_GPARA_1),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .RVX_GPARA_0(RVX_GPARA_5),
  .RVX_GPARA_2(RVX_GPARA_4),
  .RVX_GPARA_1(RVX_GPARA_3),
  .RVX_GPARA_3(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_03(rvx_port_03),
	.rvx_port_14(rvx_port_16),
  .rvx_port_13(rvx_port_00),
  .rvx_port_02(rvx_port_20),

  .rvx_port_12(rvx_signal_01),
  .rvx_port_07(rvx_signal_09),
  .rvx_port_24(rvx_signal_00),
  .rvx_port_11(rvx_signal_10),
  .rvx_port_23(rvx_signal_03),
  .rvx_port_21(rvx_signal_08),

  .rvx_port_17(rvx_signal_02),
  .rvx_port_06(rvx_signal_04),
  .rvx_port_22(rvx_signal_06),
  .rvx_port_16(rvx_signal_07),
  .rvx_port_18(rvx_signal_05),

  .rvx_port_15(rvx_port_13),
	.rvx_port_08(rvx_port_10),
	.rvx_port_19(rvx_port_17),
	.rvx_port_05(rvx_port_08),
	.rvx_port_09(rvx_port_15),
	.rvx_port_01(rvx_port_04),
	.rvx_port_04(rvx_port_18),
	.rvx_port_10(rvx_port_23),
	.rvx_port_20(rvx_port_02),
  .rvx_port_00(rvx_port_12)
);

endmodule
