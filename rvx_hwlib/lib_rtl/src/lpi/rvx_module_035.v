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




module RVX_MODULE_035
(
	rvx_port_03,
	rvx_port_60,
  rvx_port_32,
  rvx_port_15,

  rvx_port_54,
	rvx_port_42,
	rvx_port_62,
	rvx_port_41,
	rvx_port_48,
	rvx_port_63,
	rvx_port_21,

	rvx_port_53,
	rvx_port_08,
	rvx_port_26,
	rvx_port_55,
	rvx_port_10,
	rvx_port_36,

	rvx_port_19,
  rvx_port_14,
  rvx_port_40,
  rvx_port_49,
  rvx_port_24,
  rvx_port_05,
  rvx_port_64,

  rvx_port_37,
  rvx_port_58,
  rvx_port_04,
  rvx_port_06,
  rvx_port_65,
  rvx_port_34,

  rvx_port_09,
  rvx_port_12,
  rvx_port_47,
  rvx_port_51,

  rvx_port_39,
	rvx_port_02,
  rvx_port_57,
	rvx_port_31,
  rvx_port_11,
  rvx_port_30,
	rvx_port_33,
	rvx_port_45,

	rvx_port_35,
  rvx_port_29,
	rvx_port_07,
	rvx_port_38,
	rvx_port_18,
	rvx_port_50, 

	rvx_port_00,
	rvx_port_61,
	rvx_port_13,
	rvx_port_28,

	rvx_port_23,
	rvx_port_44,
  rvx_port_01,
	rvx_port_16,
  rvx_port_22,
  rvx_port_43,
	rvx_port_46,
	rvx_port_27,

	rvx_port_59,
	rvx_port_56,
	rvx_port_25,
	rvx_port_17,
	rvx_port_20,
	rvx_port_52
);




parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 4;
parameter MEMORY_OPERATION_TYPE = 3;

input wire rvx_port_03;
input wire rvx_port_60;
input wire rvx_port_32;
input wire rvx_port_15;

input wire [RVX_GPARA_2-1:0] rvx_port_54;
input wire [RVX_GPARA_0-1:0] rvx_port_42;
input wire [`BW_AXI_ALEN-1:0] rvx_port_62;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_41;
input wire [`BW_AXI_ABURST-1:0] rvx_port_48;
input wire rvx_port_63;
output wire rvx_port_21;

output wire [RVX_GPARA_2-1:0] rvx_port_53;
output wire [RVX_GPARA_1-1:0] rvx_port_08;
output wire [`BW_AXI_RRESP-1:0] rvx_port_26;
output wire rvx_port_55;
output wire rvx_port_10;
input wire rvx_port_36;

input wire [RVX_GPARA_2-1:0] rvx_port_19;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire [`BW_AXI_ALEN-1:0] rvx_port_40;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_49;
input wire [`BW_AXI_ABURST-1:0] rvx_port_24;
input wire rvx_port_05;
output wire rvx_port_64;

input wire [RVX_GPARA_2-1:0] rvx_port_37;
input wire [RVX_GPARA_1-1:0] rvx_port_58;
input wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_04;
input wire rvx_port_06;
input wire rvx_port_65;
output wire rvx_port_34;

output wire [RVX_GPARA_2-1:0] rvx_port_09;
output wire [`BW_AXI_BRESP-1:0] rvx_port_12;
output wire rvx_port_47;
input wire rvx_port_51;

output wire [RVX_GPARA_2-1:0] rvx_port_39;
output wire [RVX_GPARA_0-1:0] rvx_port_02;
output wire [`BW_AXI_ALEN-1:0] rvx_port_57;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_31;
output wire [`BW_AXI_ABURST-1:0] rvx_port_11;
output wire rvx_port_30;
output wire rvx_port_33;
input wire rvx_port_45;

output wire [RVX_GPARA_2-1:0] rvx_port_35;
output wire [RVX_GPARA_1-1:0] rvx_port_29;
output wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_07;
output wire rvx_port_38;
output wire rvx_port_18;
input wire rvx_port_50;

input wire [RVX_GPARA_2-1:0] rvx_port_00;
input wire [`BW_AXI_BRESP-1:0] rvx_port_61;
input wire rvx_port_13;
output wire rvx_port_28;

output wire [RVX_GPARA_2-1:0] rvx_port_23;
output wire [RVX_GPARA_0-1:0] rvx_port_44;
output wire [`BW_AXI_ALEN-1:0] rvx_port_01;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_16;
output wire [`BW_AXI_ABURST-1:0] rvx_port_22;
output wire rvx_port_43;
output wire rvx_port_46;
input wire rvx_port_27;

input wire [RVX_GPARA_2-1:0] rvx_port_59;
input wire [RVX_GPARA_1-1:0] rvx_port_56;
input wire [`BW_AXI_RRESP-1:0] rvx_port_25;
input wire rvx_port_17;
input wire rvx_port_20;
output wire rvx_port_52;

`include "motype_lpara.vb"

RVX_MODULE_047
#(
  .RVX_GPARA_1(RVX_GPARA_0),
  .RVX_GPARA_0(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.rvx_port_00(rvx_port_03),
	.rvx_port_12(rvx_port_60),
  .rvx_port_03(rvx_port_32),
  .rvx_port_07(rvx_port_15 & READ_SUPPORTED),

  .rvx_port_14(rvx_port_54),
	.rvx_port_04(rvx_port_42),
	.rvx_port_13(rvx_port_62),
	.rvx_port_11(rvx_port_41),
	.rvx_port_18(rvx_port_48),
	.rvx_port_15(rvx_port_63),
	.rvx_port_01(rvx_port_21),

	.rvx_port_09(rvx_port_23),
	.rvx_port_10(rvx_port_44),
  .rvx_port_02(rvx_port_01),
	.rvx_port_08(rvx_port_16),
  .rvx_port_05(rvx_port_22),
  .rvx_port_16(rvx_port_43),
	.rvx_port_06(rvx_port_46),
	.rvx_port_17(rvx_port_27)
);

assign rvx_port_53 = rvx_port_59;
assign rvx_port_08 = rvx_port_56;
assign rvx_port_26 = rvx_port_25;
assign rvx_port_55 = rvx_port_17;
assign rvx_port_10 = rvx_port_20;
assign rvx_port_52 = rvx_port_36;

RVX_MODULE_047
#(
  .RVX_GPARA_1(RVX_GPARA_0),
  .RVX_GPARA_0(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_00(rvx_port_03),
	.rvx_port_12(rvx_port_60),
  .rvx_port_03(rvx_port_32),
  .rvx_port_07(rvx_port_15 & WRITE_SUPPORTED),

  .rvx_port_14(rvx_port_19),
	.rvx_port_04(rvx_port_14),
	.rvx_port_13(rvx_port_40),
	.rvx_port_11(rvx_port_49),
	.rvx_port_18(rvx_port_24),
	.rvx_port_15(rvx_port_05),
	.rvx_port_01(rvx_port_64),

	.rvx_port_09(rvx_port_39),
	.rvx_port_10(rvx_port_02),
	.rvx_port_02(rvx_port_57),
	.rvx_port_08(rvx_port_31),
	.rvx_port_05(rvx_port_11),
  .rvx_port_16(rvx_port_30),
	.rvx_port_06(rvx_port_33),
	.rvx_port_17(rvx_port_45)
);

assign rvx_port_35 = rvx_port_37;
assign rvx_port_29 = rvx_port_58;
assign rvx_port_07 = rvx_port_04;
assign rvx_port_38 = rvx_port_06;
assign rvx_port_18 = rvx_port_65;
assign rvx_port_34 = rvx_port_50;

assign rvx_port_09 = rvx_port_00;
assign rvx_port_12 = rvx_port_61;
assign rvx_port_47 = rvx_port_13;
assign rvx_port_28 = rvx_port_51;

endmodule
