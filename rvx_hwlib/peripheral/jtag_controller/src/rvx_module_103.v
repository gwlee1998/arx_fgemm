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
`include "ervp_ahb_define.vh"
`include "ervp_endian.vh"
`include "ervp_jtag_memorymap_offset.vh"





module RVX_MODULE_103
(
	rvx_port_10,

	rvx_port_26,
	rvx_port_08,
	rvx_port_16,
	rvx_port_04,
	rvx_port_09,
	rvx_port_02,

	rvx_port_25,

	rvx_port_15,
	rvx_port_17,
	rvx_port_07,
	rvx_port_23,
	rvx_port_24,
	rvx_port_14,
	rvx_port_19,
	rvx_port_21,
	rvx_port_12,
	rvx_port_11,
	rvx_port_03,

	rvx_port_01,
	rvx_port_00,
	rvx_port_13,
	rvx_port_20,
	rvx_port_18,
	rvx_port_06,
	rvx_port_22,
	rvx_port_05
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

localparam  RVX_LPARA_2 = 8;
localparam  RVX_LPARA_1 = 32;
localparam  RVX_LPARA_0 = 1;

input wire rvx_port_10;

input wire rvx_port_26;
input wire rvx_port_08;
input wire rvx_port_16;
input wire rvx_port_04;
output wire rvx_port_09;
output wire rvx_port_02;

input wire rvx_port_25;

output wire [RVX_GPARA_0-1:0] rvx_port_15;
output wire [`BW_AHB_BURST-1:0] rvx_port_17;
output wire rvx_port_07;
output wire [`BW_AHB_PROT-1:0] rvx_port_23;
output wire [`BW_AHB_SIZE-1:0] rvx_port_24;
output wire [`BW_AHB_TRANS-1:0] rvx_port_14;
output wire [RVX_GPARA_2-1:0] rvx_port_19;
output wire rvx_port_21;

input wire [RVX_GPARA_2-1:0] rvx_port_12;
input wire rvx_port_11;
input wire rvx_port_03;

output wire rvx_port_01;
output wire rvx_port_00;
output wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire rvx_port_20;
output wire [RVX_GPARA_2-1:0] rvx_port_18;
input wire [RVX_GPARA_2-1:0] rvx_port_06;
input wire rvx_port_22;
input wire rvx_port_05;

wire rvx_signal_09;

wire [RVX_LPARA_2-1:0] rvx_signal_22;
wire rvx_signal_10;
wire [RVX_LPARA_2-1:0] rvx_signal_12;
wire rvx_signal_21;

wire [RVX_LPARA_1-1:0] rvx_signal_05;
wire rvx_signal_04;
wire [RVX_LPARA_1-1:0] rvx_signal_02;
wire rvx_signal_19;

wire [RVX_LPARA_1-1:0] rvx_signal_18;
wire rvx_signal_14;
wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire rvx_signal_16;

wire [RVX_LPARA_1-1:0] rvx_signal_01;
wire rvx_signal_15;
wire [RVX_LPARA_1-1:0] rvx_signal_03;
wire rvx_signal_08;

wire rvx_signal_11;
wire [RVX_GPARA_2-1:0] rvx_signal_00;
wire rvx_signal_13;

wire rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire rvx_signal_20;

assign rvx_signal_09 = rvx_port_08 & rvx_port_10;

RVX_MODULE_072
#(
	.RVX_GPARA_1(RVX_LPARA_2),
	.RVX_GPARA_0(RVX_LPARA_1),
	.RVX_GPARA_2(RVX_LPARA_0)
)
i_rvx_instance_1
(
	.rvx_port_05(rvx_port_26),
	.rvx_port_07(rvx_port_08),
	.rvx_port_04(rvx_port_16),
	.rvx_port_13(rvx_port_04),
	.rvx_port_11(rvx_port_09),
	.rvx_port_10(rvx_port_02),

	.rvx_port_00(rvx_signal_22),
	.rvx_port_02(rvx_signal_10),
	.rvx_port_09(rvx_signal_12),
	.rvx_port_12(rvx_signal_21),

	.rvx_port_01(rvx_signal_05),
	.rvx_port_06(rvx_signal_04),
	.rvx_port_08(rvx_signal_02),
	.rvx_port_03(rvx_signal_19)
);

RVX_MODULE_089
#(
	.RVX_GPARA_1(RVX_LPARA_2),
	.RVX_GPARA_0(RVX_LPARA_1)
)
i_rvx_instance_3
(
	.rvx_port_04(rvx_port_26),
	.rvx_port_11(rvx_signal_09),

	.rvx_port_16(rvx_signal_22),
	.rvx_port_09(rvx_signal_10),
	.rvx_port_15(rvx_signal_12),
	.rvx_port_05(rvx_signal_21),

	.rvx_port_07(rvx_signal_05),
	.rvx_port_06(rvx_signal_04),
	.rvx_port_02(rvx_signal_02),
	.rvx_port_13(rvx_signal_19),

	.rvx_port_08(rvx_signal_18),
	.rvx_port_01(rvx_signal_14),
	.rvx_port_00(rvx_signal_07),
	.rvx_port_14(rvx_signal_16),

	.rvx_port_03(rvx_signal_01),
	.rvx_port_12(rvx_signal_15),
	.rvx_port_10(rvx_signal_03),
	.rvx_port_17(rvx_signal_08)
);

RVX_MODULE_079
#(
	.RVX_GPARA_1(RVX_LPARA_1),
	.RVX_GPARA_0(RVX_GPARA_2)
)
i_rvx_instance_2
(
	.rvx_port_14(rvx_signal_18),
	.rvx_port_08(rvx_signal_14),
	.rvx_port_05(rvx_signal_07),
	.rvx_port_11(rvx_signal_16),

	.rvx_port_03(rvx_signal_01),
	.rvx_port_15(rvx_signal_15),
	.rvx_port_07(rvx_signal_03),
	.rvx_port_06(rvx_signal_08),

	.rvx_port_00(rvx_port_25),
	.rvx_port_13(rvx_signal_09),

	.rvx_port_02(rvx_signal_11),
	.rvx_port_10(rvx_signal_00),
	.rvx_port_01(rvx_signal_13),

	.rvx_port_04(rvx_signal_17),
	.rvx_port_12(rvx_signal_06),
	.rvx_port_09(rvx_signal_20)
);

RVX_MODULE_058
#(
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_0(RVX_GPARA_2),
	.RVX_GPARA_2(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_22(rvx_port_25),
	.rvx_port_00(rvx_signal_09),

	.rvx_port_26(rvx_signal_11),
	.rvx_port_19(rvx_signal_00),
	.rvx_port_20(rvx_signal_13),

	.rvx_port_04(rvx_signal_17),
	.rvx_port_12(rvx_signal_06),
	.rvx_port_14(rvx_signal_20),

	.rvx_port_10(rvx_port_15),
	.rvx_port_07(rvx_port_17),
	.rvx_port_11(rvx_port_07),
	.rvx_port_16(rvx_port_23),
	.rvx_port_17(rvx_port_24),
	.rvx_port_13(rvx_port_14),
	.rvx_port_09(rvx_port_19),
	.rvx_port_06(rvx_port_21),
	.rvx_port_21(rvx_port_12),
	.rvx_port_15(rvx_port_11),
	.rvx_port_23(rvx_port_03),

	.rvx_port_18(rvx_port_01),
	.rvx_port_01(rvx_port_00),
	.rvx_port_03(rvx_port_13),
	.rvx_port_02(rvx_port_20),
	.rvx_port_08(rvx_port_18),
	.rvx_port_05(rvx_port_06),
	.rvx_port_24(rvx_port_22),
	.rvx_port_25(rvx_port_05)
);

endmodule
