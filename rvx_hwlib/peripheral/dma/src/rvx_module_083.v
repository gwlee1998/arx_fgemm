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
`include "rvx_include_08.vh"





module RVX_MODULE_083
(
	rvx_port_21,
	rvx_port_17,

	rvx_port_27,
	rvx_port_05,
	rvx_port_43,
	rvx_port_36,
	rvx_port_41,
	rvx_port_04,
	rvx_port_53,
	rvx_port_35,

	rvx_port_18,
	rvx_port_06,
	rvx_port_40,
	rvx_port_25,
	rvx_port_02,
	rvx_port_09,
	rvx_port_50,
	rvx_port_46,
	rvx_port_13,
	rvx_port_14,
	rvx_port_08,
	rvx_port_30,
	rvx_port_16,
	rvx_port_07,
	rvx_port_26,
	rvx_port_54,
	rvx_port_33,
	rvx_port_42,
	rvx_port_39,
	rvx_port_00,
	rvx_port_11,
	rvx_port_47,
	rvx_port_34,
	rvx_port_48,
	rvx_port_51,
	rvx_port_23,
	rvx_port_44,
	rvx_port_49,
	rvx_port_29,
	rvx_port_15,
	rvx_port_10,
	rvx_port_37,
	rvx_port_03,
	rvx_port_12,
	rvx_port_45,
	rvx_port_28,
	rvx_port_19,
	rvx_port_01,
	rvx_port_20,
	rvx_port_31,
	rvx_port_38,
	rvx_port_24,
	rvx_port_22,
	rvx_port_32,
	rvx_port_52
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_21, rvx_port_17;
input wire rvx_port_27;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_43;
input wire rvx_port_36;
input wire [RVX_GPARA_1-1:0] rvx_port_41;
output wire [RVX_GPARA_1-1:0] rvx_port_04;
output reg rvx_port_53;
output reg rvx_port_35;

input wire rvx_port_18;

output wire rvx_port_06;
input wire [3-1:0] rvx_port_40;

output wire rvx_port_25;

output wire [32-1:0] rvx_port_02;

output wire rvx_port_08;
output wire rvx_port_30;
output wire [RVX_GPARA_1-1:0] rvx_port_16;
output wire rvx_port_09;
output wire rvx_port_50;
output wire [RVX_GPARA_1-1:0] rvx_port_46;
input wire rvx_port_13;
output wire [32-1:0] rvx_port_14;

output wire rvx_port_39;
output wire rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
output wire rvx_port_07;
output wire rvx_port_26;
output wire [RVX_GPARA_1-1:0] rvx_port_54;
input wire rvx_port_33;
output wire [32-1:0] rvx_port_42;

output wire rvx_port_44;
output wire rvx_port_49;
output wire [RVX_GPARA_1-1:0] rvx_port_29;
output wire rvx_port_47;
output wire rvx_port_34;
output wire [RVX_GPARA_1-1:0] rvx_port_48;
input wire rvx_port_51;
output wire [32-1:0] rvx_port_23;

output wire rvx_port_45;
output wire rvx_port_28;
output wire [RVX_GPARA_1-1:0] rvx_port_19;
output wire rvx_port_15;
output wire rvx_port_10;
output wire [RVX_GPARA_1-1:0] rvx_port_37;
input wire rvx_port_03;
output wire [32-1:0] rvx_port_12;

output wire rvx_port_22;
output wire rvx_port_32;
output wire [RVX_GPARA_1-1:0] rvx_port_52;
output wire rvx_port_01;
output wire rvx_port_20;
output wire [RVX_GPARA_1-1:0] rvx_port_31;
input wire rvx_port_38;
output wire [32-1:0] rvx_port_24;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_015;
reg [RVX_GPARA_1-1:0] rvx_signal_055;
wire rvx_signal_017;
wire rvx_signal_002;
wire rvx_signal_027;

wire [`RVX_GDEF_152-1:0] paddr_offset = rvx_port_43;
wire [`RVX_GDEF_152-1:0] rvx_signal_011;
wire [RVX_GPARA_0-1:0] rvx_signal_099;
wire [`RVX_GDEF_427-1:0] rvx_signal_001;
wire [`RVX_GDEF_427-1:0] addr_unused = 0;
reg rvx_signal_062;
wire [3-1:0] rvx_signal_047;
reg rvx_signal_061;
wire [3-1:0] rvx_signal_029;
wire rvx_signal_066;
reg rvx_signal_095;
wire [1-1:0] rvx_signal_021;
reg rvx_signal_007;
wire [1-1:0] rvx_signal_043;
wire rvx_signal_092;
reg rvx_signal_069;
wire [32-1:0] rvx_signal_073;
reg rvx_signal_012;
wire [32-1:0] rvx_signal_039;
wire rvx_signal_078;
reg [32-1:0] rvx_signal_050;
reg rvx_signal_096;
wire [32-1:0] rvx_signal_057;
reg rvx_signal_083;
wire [32-1:0] rvx_signal_038;
wire rvx_signal_044;
wire rvx_signal_064;
wire rvx_signal_051;
wire rvx_signal_079;
wire [32-1:0] rvx_signal_048;
wire [RVX_GPARA_1-1:0] rvx_signal_081;
wire rvx_signal_025;
wire rvx_signal_074;
wire rvx_signal_052;
wire [32-1:0] rvx_signal_009;
wire [RVX_GPARA_1-1:0] rvx_signal_036;
reg rvx_signal_071;
wire [32-1:0] rvx_signal_056;
reg rvx_signal_070;
wire [32-1:0] rvx_signal_024;
wire rvx_signal_041;
wire rvx_signal_075;
wire rvx_signal_097;
wire rvx_signal_004;
wire [32-1:0] rvx_signal_072;
wire [RVX_GPARA_1-1:0] rvx_signal_094;
wire rvx_signal_060;
wire rvx_signal_080;
wire rvx_signal_013;
wire [32-1:0] rvx_signal_086;
wire [RVX_GPARA_1-1:0] rvx_signal_030;
reg rvx_signal_054;
wire [32-1:0] rvx_signal_067;
reg rvx_signal_076;
wire [32-1:0] rvx_signal_035;
wire rvx_signal_006;
wire rvx_signal_049;
wire rvx_signal_077;
wire rvx_signal_003;
wire [32-1:0] rvx_signal_005;
wire [RVX_GPARA_1-1:0] rvx_signal_068;
wire rvx_signal_014;
wire rvx_signal_031;
wire rvx_signal_100;
wire [32-1:0] rvx_signal_053;
wire [RVX_GPARA_1-1:0] rvx_signal_098;
reg rvx_signal_090;
wire [32-1:0] rvx_signal_028;
reg rvx_signal_018;
wire [32-1:0] rvx_signal_089;
wire rvx_signal_023;
wire rvx_signal_019;
wire rvx_signal_040;
wire rvx_signal_032;
wire [32-1:0] rvx_signal_085;
wire [RVX_GPARA_1-1:0] rvx_signal_037;
wire rvx_signal_087;
wire rvx_signal_026;
wire rvx_signal_059;
wire [32-1:0] rvx_signal_008;
wire [RVX_GPARA_1-1:0] rvx_signal_045;
reg rvx_signal_000;
wire [32-1:0] rvx_signal_091;
reg rvx_signal_034;
wire [32-1:0] rvx_signal_088;
wire rvx_signal_082;
wire rvx_signal_063;
wire rvx_signal_022;
wire rvx_signal_042;
wire [32-1:0] rvx_signal_093;
wire [RVX_GPARA_1-1:0] rvx_signal_065;
wire rvx_signal_033;
wire rvx_signal_010;
wire rvx_signal_058;
wire [32-1:0] rvx_signal_084;
wire [RVX_GPARA_1-1:0] rvx_signal_046;

assign rvx_signal_015 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_41);
assign rvx_port_04 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_055);
assign {rvx_signal_099,rvx_signal_001} = paddr_offset;
assign rvx_signal_011 = {rvx_signal_099,addr_unused};
assign rvx_signal_027 = (rvx_signal_001==0);
assign rvx_signal_017 = rvx_port_27 & rvx_port_05 & rvx_signal_027 & (~rvx_port_36);
assign rvx_signal_002 = rvx_port_27 & rvx_port_05 & rvx_signal_027 & rvx_port_36;

assign rvx_signal_029 = $unsigned(rvx_port_41);
assign rvx_signal_043 = $unsigned(rvx_port_41);
assign rvx_signal_039 = $unsigned(rvx_port_41);
assign rvx_signal_038 = $unsigned(rvx_port_41);
assign rvx_signal_024 = $unsigned(rvx_port_41);
assign rvx_signal_035 = $unsigned(rvx_port_41);
assign rvx_signal_089 = $unsigned(rvx_port_41);
assign rvx_signal_088 = $unsigned(rvx_port_41);

always@(*)
begin
	rvx_port_35 = 0;
	rvx_signal_055 = 0;
	rvx_port_53 = 1;

	rvx_signal_062 = 0;
	rvx_signal_061 = 0;

	rvx_signal_095 = 0;
	rvx_signal_007 = 0;

	rvx_signal_069 = 0;
	rvx_signal_012 = 0;

	rvx_signal_096 = 0;
	rvx_signal_083 = 0;

	rvx_signal_071 = 0;
	rvx_signal_070 = 0;

	rvx_signal_054 = 0;
	rvx_signal_076 = 0;

	rvx_signal_090 = 0;
	rvx_signal_018 = 0;

	rvx_signal_000 = 0;
	rvx_signal_034 = 0;

	if(rvx_port_27==1'b 1)
	begin
		case(rvx_signal_011)
			`RVX_GDEF_406:
			begin
				rvx_signal_062 = rvx_signal_017;
				rvx_signal_061 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_047);
				rvx_port_53 = rvx_signal_066;
			end
			`RVX_GDEF_277:
			begin
				rvx_signal_095 = rvx_signal_017;
				rvx_signal_007 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_021);
				rvx_port_53 = rvx_signal_092;
			end
			`RVX_GDEF_399:
			begin
				rvx_signal_069 = rvx_signal_017;
				rvx_signal_012 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_073);
				rvx_port_53 = rvx_signal_078;
			end
			`RVX_GDEF_162:
			begin
				rvx_signal_096 = rvx_signal_017;
				rvx_signal_083 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_057);
				rvx_port_53 = rvx_signal_044;
			end
			`RVX_GDEF_279:
			begin
				rvx_signal_071 = rvx_signal_017;
				rvx_signal_070 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_056);
				rvx_port_53 = rvx_signal_041;
			end
			`RVX_GDEF_221:
			begin
				rvx_signal_054 = rvx_signal_017;
				rvx_signal_076 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_067);
				rvx_port_53 = rvx_signal_006;
			end
			`RVX_GDEF_134:
			begin
				rvx_signal_090 = rvx_signal_017;
				rvx_signal_018 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_028);
				rvx_port_53 = rvx_signal_023;
			end
			`RVX_GDEF_434:
			begin
				rvx_signal_000 = rvx_signal_017;
				rvx_signal_034 = rvx_signal_002;
				rvx_signal_055 = $unsigned(rvx_signal_091);
				rvx_port_53 = rvx_signal_082;
			end
			default:
				rvx_port_35 = 1;
		endcase
	end
end

always@(posedge rvx_port_21, negedge rvx_port_17)
begin
	if(rvx_port_17==0)
		rvx_signal_050 <= `RVX_GDEF_140;
	else if (rvx_signal_012==1'b 1)
		rvx_signal_050 <= rvx_signal_039;
end
assign rvx_signal_073 = rvx_signal_050;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_4
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_064),
	.wfull(rvx_signal_051),
	.wrequest(rvx_signal_079),
	.wdata(rvx_signal_048),
	.wnum(rvx_signal_081),
	.rready(rvx_signal_025),
	.rempty(rvx_signal_074),
	.rrequest(rvx_signal_052),
	.rdata(rvx_signal_009),
	.rnum(rvx_signal_036)
);
assign rvx_port_08 = rvx_signal_064;
assign rvx_port_30 = rvx_signal_051;
assign rvx_port_16 = rvx_signal_081;
assign rvx_port_09 = rvx_signal_025;
assign rvx_port_50 = rvx_signal_074;
assign rvx_port_46 = rvx_signal_036;
assign rvx_signal_079 = rvx_signal_083;
assign rvx_signal_048 = rvx_signal_038;
assign rvx_signal_057 = rvx_signal_081;
assign rvx_signal_052 = rvx_port_13;
assign rvx_port_14 = rvx_signal_009;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_075),
	.wfull(rvx_signal_097),
	.wrequest(rvx_signal_004),
	.wdata(rvx_signal_072),
	.wnum(rvx_signal_094),
	.rready(rvx_signal_060),
	.rempty(rvx_signal_080),
	.rrequest(rvx_signal_013),
	.rdata(rvx_signal_086),
	.rnum(rvx_signal_030)
);
assign rvx_port_39 = rvx_signal_075;
assign rvx_port_00 = rvx_signal_097;
assign rvx_port_11 = rvx_signal_094;
assign rvx_port_07 = rvx_signal_060;
assign rvx_port_26 = rvx_signal_080;
assign rvx_port_54 = rvx_signal_030;
assign rvx_signal_004 = rvx_signal_070;
assign rvx_signal_072 = rvx_signal_024;
assign rvx_signal_056 = rvx_signal_094;
assign rvx_signal_013 = rvx_port_33;
assign rvx_port_42 = rvx_signal_086;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_2
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_049),
	.wfull(rvx_signal_077),
	.wrequest(rvx_signal_003),
	.wdata(rvx_signal_005),
	.wnum(rvx_signal_068),
	.rready(rvx_signal_014),
	.rempty(rvx_signal_031),
	.rrequest(rvx_signal_100),
	.rdata(rvx_signal_053),
	.rnum(rvx_signal_098)
);
assign rvx_port_44 = rvx_signal_049;
assign rvx_port_49 = rvx_signal_077;
assign rvx_port_29 = rvx_signal_068;
assign rvx_port_47 = rvx_signal_014;
assign rvx_port_34 = rvx_signal_031;
assign rvx_port_48 = rvx_signal_098;
assign rvx_signal_003 = rvx_signal_076;
assign rvx_signal_005 = rvx_signal_035;
assign rvx_signal_067 = rvx_signal_068;
assign rvx_signal_100 = rvx_port_51;
assign rvx_port_23 = rvx_signal_053;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_019),
	.wfull(rvx_signal_040),
	.wrequest(rvx_signal_032),
	.wdata(rvx_signal_085),
	.wnum(rvx_signal_037),
	.rready(rvx_signal_087),
	.rempty(rvx_signal_026),
	.rrequest(rvx_signal_059),
	.rdata(rvx_signal_008),
	.rnum(rvx_signal_045)
);
assign rvx_port_45 = rvx_signal_019;
assign rvx_port_28 = rvx_signal_040;
assign rvx_port_19 = rvx_signal_037;
assign rvx_port_15 = rvx_signal_087;
assign rvx_port_10 = rvx_signal_026;
assign rvx_port_37 = rvx_signal_045;
assign rvx_signal_032 = rvx_signal_018;
assign rvx_signal_085 = rvx_signal_089;
assign rvx_signal_028 = rvx_signal_037;
assign rvx_signal_059 = rvx_port_03;
assign rvx_port_12 = rvx_signal_008;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(8),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_3
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_063),
	.wfull(rvx_signal_022),
	.wrequest(rvx_signal_042),
	.wdata(rvx_signal_093),
	.wnum(rvx_signal_065),
	.rready(rvx_signal_033),
	.rempty(rvx_signal_010),
	.rrequest(rvx_signal_058),
	.rdata(rvx_signal_084),
	.rnum(rvx_signal_046)
);
assign rvx_port_22 = rvx_signal_063;
assign rvx_port_32 = rvx_signal_022;
assign rvx_port_52 = rvx_signal_065;
assign rvx_port_01 = rvx_signal_033;
assign rvx_port_20 = rvx_signal_010;
assign rvx_port_31 = rvx_signal_046;
assign rvx_signal_042 = rvx_signal_034;
assign rvx_signal_093 = rvx_signal_088;
assign rvx_signal_091 = rvx_signal_065;
assign rvx_signal_058 = rvx_port_38;
assign rvx_port_24 = rvx_signal_084;
assign rvx_port_06 = rvx_signal_062;
assign rvx_signal_047 = rvx_port_40;
assign rvx_signal_066 = 1;
assign rvx_port_25 = rvx_signal_007;
assign rvx_signal_021 = 0;
assign rvx_signal_092 = 1;
assign rvx_port_02 = rvx_signal_050;
assign rvx_signal_078 = 1;
assign rvx_signal_044 = 1;
assign rvx_signal_041 = 1;
assign rvx_signal_006 = 1;
assign rvx_signal_023 = 1;
assign rvx_signal_082 = 1;

endmodule
