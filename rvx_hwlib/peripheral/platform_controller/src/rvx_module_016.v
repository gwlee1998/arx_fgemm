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
`include "ervp_endian.vh"
`include "ervp_platform_controller_memorymap_offset.vh"
`include "ervp_string_util.vh"
`include "platform_info.vh"





module RVX_MODULE_016
(
	rvx_port_15,
	rvx_port_02,

	rvx_port_14,
	rvx_port_11,
	rvx_port_10,
	rvx_port_13,
	rvx_port_03,
	rvx_port_00,
	rvx_port_08,
	rvx_port_12,

	rvx_port_07,
	rvx_port_17,
	rvx_port_05,
	rvx_port_06,
	rvx_port_16,
	rvx_port_09,
	rvx_port_01,
	rvx_port_04
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"
`include "ervp_endian.vf"

localparam  RVX_LPARA_0 = 32;

input wire rvx_port_15, rvx_port_02;

input wire rvx_port_14;
input wire rvx_port_11;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_13;
input wire [RVX_LPARA_0-1:0] rvx_port_03;
output wire [RVX_LPARA_0-1:0] rvx_port_00;
output wire rvx_port_08;
output wire rvx_port_12;

input wire rvx_port_07;
input wire rvx_port_17;
input wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire rvx_port_06;
input wire [RVX_LPARA_0-1:0] rvx_port_16;
output wire [RVX_LPARA_0-1:0] rvx_port_09;
output wire rvx_port_01;
output wire rvx_port_04;

wire [RVX_LPARA_0-1:0] rvx_signal_21;
wire [RVX_LPARA_0-1:0] rvx_signal_13;
wire [RVX_LPARA_0-1:0] rvx_signal_31;
wire [RVX_LPARA_0-1:0] rvx_signal_01;

wire rvx_signal_24;
wire rvx_signal_30;
wire [RVX_GPARA_0-1:0] rvx_signal_18;
wire rvx_signal_26;
wire [RVX_LPARA_0-1:0] rvx_signal_36;
reg [RVX_LPARA_0-1:0] rvx_signal_12;
wire rvx_signal_11;
reg rvx_signal_19;

wire [`BW_MMAP_SUBOFFSET_DESIGN_INFO-1:0] paddr_offset = rvx_signal_18;
wire [`BW_MMAP_SUBOFFSET_DESIGN_INFO-1:0] rvx_signal_33;
wire rvx_signal_05;
wire [(`BW_MMAP_SUBOFFSET_DESIGN_INFO-`BW_UNUSED_DESIGN_INFO)-1:0] rvx_signal_28;
wire [`BW_UNUSED_DESIGN_INFO-1:0] rvx_signal_16;
wire [`BW_UNUSED_DESIGN_INFO-1:0] addr_unused = 0;
wire rvx_signal_10;

localparam  RVX_LPARA_1 = 16;
localparam  RVX_LPARA_2 = (RVX_LPARA_1*`BITS_PER_CHAR);

wire [RVX_LPARA_2-1:0] rvx_signal_03;
wire [RVX_LPARA_0-1:0] rvx_signal_02;
wire [REQUIRED_BITWIDTH_INDEX(RVX_LPARA_2/RVX_LPARA_0)-1:0] rvx_signal_23;

localparam  BW_USERNAME = (16*`BITS_PER_CHAR);
localparam  BW_GIT_NAME = (16*`BITS_PER_CHAR);
localparam  BW_GIT_VERSION = (8*`BITS_PER_CHAR);
localparam  BW_DATE = (20*`BITS_PER_CHAR);

`ifdef SIM_ENV
wire [BW_USERNAME-1:0] username_string = `FORMAT_STRING("N/A");
wire [BW_GIT_NAME-1:0] home_git_name_string = `FORMAT_STRING("N/A");
wire [BW_GIT_VERSION-1:0] home_git_version_string = `FORMAT_STRING("N/A");
wire [BW_GIT_VERSION-1:0] devkit_git_version_string = `FORMAT_STRING("N/A");
wire [BW_DATE-1:0] design_date_string = `FORMAT_STRING("N/A");
`else
	`include "ervp_design_info.vh"
`endif

wire [RVX_LPARA_0-1:0] rvx_signal_20;
wire [REQUIRED_BITWIDTH_INDEX(BW_USERNAME/RVX_LPARA_0)-1:0] rvx_signal_29;

wire [RVX_LPARA_0-1:0] rvx_signal_27;
wire [REQUIRED_BITWIDTH_INDEX(BW_GIT_NAME/RVX_LPARA_0)-1:0] rvx_signal_34;

wire [RVX_LPARA_0-1:0] rvx_signal_06;
wire [REQUIRED_BITWIDTH_INDEX(BW_GIT_VERSION/RVX_LPARA_0)-1:0] rvx_signal_22;

wire [RVX_LPARA_0-1:0] rvx_signal_07;
wire [REQUIRED_BITWIDTH_INDEX(BW_GIT_VERSION/RVX_LPARA_0)-1:0] rvx_signal_35;

wire [RVX_LPARA_0-1:0] rvx_signal_00;
wire [REQUIRED_BITWIDTH_INDEX(BW_DATE/RVX_LPARA_0)-1:0] rvx_signal_25;

assign rvx_signal_21 = CHANGE_ENDIAN_BUS2MAN(RVX_LPARA_0,RVX_GPARA_2,rvx_port_03);
assign rvx_port_00 = CHANGE_ENDIAN_MAN2BUS(RVX_LPARA_0,RVX_GPARA_2,rvx_signal_13);
assign rvx_signal_31 = CHANGE_ENDIAN_BUS2MAN(RVX_LPARA_0,RVX_GPARA_1,rvx_port_16);
assign rvx_port_09 = CHANGE_ENDIAN_MAN2BUS(RVX_LPARA_0,RVX_GPARA_1,rvx_signal_01);

RVX_MODULE_019
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_3(RVX_GPARA_0),
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(1)
)
i_rvx_instance_4
(
	.rvx_port_19(rvx_port_15),
	.rvx_port_12(rvx_port_02),

	.rvx_port_01({rvx_port_14,rvx_port_07}),
	.rvx_port_02({rvx_port_11,rvx_port_17}),
	.rvx_port_14({rvx_port_10,rvx_port_05}),
	.rvx_port_11({rvx_port_13,rvx_port_06}),
	.rvx_port_10({rvx_signal_21,rvx_signal_31}),
	.rvx_port_18(2'b 0),
	.rvx_port_17({rvx_signal_13,rvx_signal_01}),
	.rvx_port_13({rvx_port_08,rvx_port_01}),
	.rvx_port_16({rvx_port_12,rvx_port_04}),

	.rvx_port_15(rvx_signal_24),
	.rvx_port_07(rvx_signal_30),
	.rvx_port_06(rvx_signal_18),
	.rvx_port_04(rvx_signal_26),
	.rvx_port_08(rvx_signal_36),
	.rvx_port_05(),
	.rvx_port_03(rvx_signal_12),
	.rvx_port_09(rvx_signal_11),
	.rvx_port_00(rvx_signal_19)
);

ERVP_MUX
#(
	.BW_DATA(RVX_LPARA_0),
	.NUM_DATA(RVX_LPARA_2/RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_rvx_instance_6
(
	.data_input_list(rvx_signal_03),
	.select(rvx_signal_23),
	.data_output(rvx_signal_02)
);

`ifdef FAKE_PLATFORM_NAME
assign rvx_signal_03 = `FORMAT_STRING(`FAKE_PLATFORM_NAME);
`else
assign rvx_signal_03 = `FORMAT_STRING(`PLATFORM_NAME);
`endif
assign rvx_signal_23 = $unsigned(rvx_signal_28);

ERVP_MUX
#(
	.BW_DATA(RVX_LPARA_0),
	.NUM_DATA(BW_USERNAME/RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_rvx_instance_5
(
	.data_input_list(username_string),
	.select(rvx_signal_29),
	.data_output(rvx_signal_20)
);

assign rvx_signal_29 = $unsigned(rvx_signal_28);

ERVP_MUX
#(
	.BW_DATA(RVX_LPARA_0),
	.NUM_DATA(BW_GIT_NAME/RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_rvx_instance_1
(
	.data_input_list(home_git_name_string),
	.select(rvx_signal_34),
	.data_output(rvx_signal_27)
);

assign rvx_signal_34 = $unsigned(rvx_signal_28);

ERVP_MUX
#(
	.BW_DATA(RVX_LPARA_0),
	.NUM_DATA(BW_GIT_VERSION/RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_rvx_instance_3
(
	.data_input_list(home_git_version_string),
	.select(rvx_signal_22),
	.data_output(rvx_signal_06)
);

assign rvx_signal_22 = $unsigned(rvx_signal_28);

ERVP_MUX
#(
	.BW_DATA(RVX_LPARA_0),
	.NUM_DATA(BW_GIT_VERSION/RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_rvx_instance_0
(
	.data_input_list(devkit_git_version_string),
	.select(rvx_signal_35),
	.data_output(rvx_signal_07)
);

assign rvx_signal_35 = $unsigned(rvx_signal_28);

ERVP_MUX
#(
	.BW_DATA(RVX_LPARA_0),
	.NUM_DATA(BW_DATE/RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_rvx_instance_2
(
	.data_input_list(design_date_string),
	.select(rvx_signal_25),
	.data_output(rvx_signal_00)
);

assign rvx_signal_25 = $unsigned(rvx_signal_28);

assign {rvx_signal_28,rvx_signal_16} = paddr_offset;
assign rvx_signal_33 = {rvx_signal_28,addr_unused};
assign rvx_signal_05 = (rvx_signal_16==0);
assign rvx_signal_10 = rvx_signal_24 & rvx_signal_30 & rvx_signal_05 & rvx_signal_26;

always@(*)
begin
	rvx_signal_19 = rvx_signal_10;
	rvx_signal_12 = 0;
	case(rvx_signal_33)
		`MMAP_SUBOFFSET_DESIGN_INFO_PLATFORM_NAME00,
		`MMAP_SUBOFFSET_DESIGN_INFO_PLATFORM_NAME01,
		`MMAP_SUBOFFSET_DESIGN_INFO_PLATFORM_NAME02,
		`MMAP_SUBOFFSET_DESIGN_INFO_PLATFORM_NAME03:
			rvx_signal_12 = `CHANGE_ENDIAN32(rvx_signal_02);
    `MMAP_SUBOFFSET_DESIGN_INFO_USERNAME00,
    `MMAP_SUBOFFSET_DESIGN_INFO_USERNAME01,
    `MMAP_SUBOFFSET_DESIGN_INFO_USERNAME02,
    `MMAP_SUBOFFSET_DESIGN_INFO_USERNAME03:
      rvx_signal_12 = `CHANGE_ENDIAN32(rvx_signal_20);
		`MMAP_SUBOFFSET_DESIGN_INFO_DATE00,
		`MMAP_SUBOFFSET_DESIGN_INFO_DATE01,
		`MMAP_SUBOFFSET_DESIGN_INFO_DATE02,
		`MMAP_SUBOFFSET_DESIGN_INFO_DATE03,
		`MMAP_SUBOFFSET_DESIGN_INFO_DATE04,
		`MMAP_SUBOFFSET_DESIGN_INFO_DATE05:
			rvx_signal_12 = `CHANGE_ENDIAN32(rvx_signal_00);
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_VERSION00,
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_VERSION01,
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_VERSION02,
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_VERSION03:
			rvx_signal_12 = `CHANGE_ENDIAN32(rvx_signal_06);
    `MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_NAME00,
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_NAME01,
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_NAME02,
		`MMAP_SUBOFFSET_DESIGN_INFO_HOME_GIT_NAME03:
			rvx_signal_12 = `CHANGE_ENDIAN32(rvx_signal_27);
		`MMAP_SUBOFFSET_DESIGN_INFO_DEVKIT_GIT_VERSION00,
		`MMAP_SUBOFFSET_DESIGN_INFO_DEVKIT_GIT_VERSION01,
		`MMAP_SUBOFFSET_DESIGN_INFO_DEVKIT_GIT_VERSION02,
		`MMAP_SUBOFFSET_DESIGN_INFO_DEVKIT_GIT_VERSION03:
			rvx_signal_12 = `CHANGE_ENDIAN32(rvx_signal_07);
		default:
			 rvx_signal_19 = 1;
	endcase
end

assign rvx_signal_11 = 1;

endmodule
