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
`include "rvx_include_07.vh"




module RVX_MODULE_055
(
	rvx_port_02,
	rvx_port_07,

	rvx_port_11,
	rvx_port_08,
	rvx_port_14,
	rvx_port_09,
	rvx_port_00,
	rvx_port_12,
	rvx_port_10,
	rvx_port_04,

	rvx_port_03,
	rvx_port_01,
	rvx_port_13,
	rvx_port_05,
	rvx_port_06
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_02, rvx_port_07;
input wire rvx_port_11;
input wire rvx_port_08;
input wire [RVX_GPARA_1-1:0] rvx_port_14;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_00;
output wire [RVX_GPARA_0-1:0] rvx_port_12;
output reg rvx_port_10;
output reg rvx_port_04;

input wire rvx_port_03;

output wire [8-1:0] rvx_port_01;

output wire [(32)*(8)-1:0] rvx_port_13;

output wire [(32)*(8)-1:0] rvx_port_05;

output wire [(32)*(8)-1:0] rvx_port_06;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_048;
reg [RVX_GPARA_0-1:0] rvx_signal_055;
wire rvx_signal_007;
wire rvx_signal_019;
wire rvx_signal_037;

wire [`RVX_GDEF_281-1:0] paddr_offset = rvx_port_14;
wire [`RVX_GDEF_281-1:0] rvx_signal_057;
wire [RVX_GPARA_1-1:0] rvx_signal_101;
wire [`RVX_GDEF_285-1:0] rvx_signal_054;
wire [`RVX_GDEF_285-1:0] addr_unused = 0;
reg rvx_signal_049;
wire [8-1:0] rvx_signal_128;
reg rvx_signal_156;
wire [8-1:0] rvx_signal_045;
wire rvx_signal_087;
reg [8-1:0] rvx_signal_036;
reg rvx_signal_151;
wire [32-1:0] rvx_signal_150;
reg rvx_signal_126;
wire [32-1:0] rvx_signal_155;
wire rvx_signal_110;
reg [32-1:0] rvx_signal_111;
reg rvx_signal_027;
wire [32-1:0] rvx_signal_058;
reg rvx_signal_003;
wire [32-1:0] rvx_signal_118;
wire rvx_signal_142;
reg [32-1:0] rvx_signal_076;
reg rvx_signal_094;
wire [32-1:0] rvx_signal_040;
reg rvx_signal_093;
wire [32-1:0] rvx_signal_023;
wire rvx_signal_024;
reg [32-1:0] rvx_signal_152;
reg rvx_signal_074;
wire [32-1:0] rvx_signal_133;
reg rvx_signal_120;
wire [32-1:0] rvx_signal_159;
wire rvx_signal_143;
reg [32-1:0] rvx_signal_137;
reg rvx_signal_020;
wire [32-1:0] rvx_signal_123;
reg rvx_signal_008;
wire [32-1:0] rvx_signal_132;
wire rvx_signal_012;
reg [32-1:0] rvx_signal_071;
reg rvx_signal_053;
wire [32-1:0] rvx_signal_104;
reg rvx_signal_100;
wire [32-1:0] rvx_signal_092;
wire rvx_signal_066;
reg [32-1:0] rvx_signal_011;
reg rvx_signal_157;
wire [32-1:0] rvx_signal_047;
reg rvx_signal_108;
wire [32-1:0] rvx_signal_141;
wire rvx_signal_044;
reg [32-1:0] rvx_signal_083;
reg rvx_signal_084;
wire [32-1:0] rvx_signal_029;
reg rvx_signal_102;
wire [32-1:0] rvx_signal_041;
wire rvx_signal_115;
reg [32-1:0] rvx_signal_099;
reg rvx_signal_077;
wire [32-1:0] rvx_signal_032;
reg rvx_signal_109;
wire [32-1:0] rvx_signal_005;
wire rvx_signal_116;
reg [32-1:0] rvx_signal_062;
reg rvx_signal_060;
wire [32-1:0] rvx_signal_078;
reg rvx_signal_068;
wire [32-1:0] rvx_signal_081;
wire rvx_signal_134;
reg [32-1:0] rvx_signal_067;
reg rvx_signal_089;
wire [32-1:0] rvx_signal_153;
reg rvx_signal_013;
wire [32-1:0] rvx_signal_107;
wire rvx_signal_098;
reg [32-1:0] rvx_signal_158;
reg rvx_signal_085;
wire [32-1:0] rvx_signal_038;
reg rvx_signal_075;
wire [32-1:0] rvx_signal_042;
wire rvx_signal_010;
reg [32-1:0] rvx_signal_050;
reg rvx_signal_121;
wire [32-1:0] rvx_signal_131;
reg rvx_signal_082;
wire [32-1:0] rvx_signal_119;
wire rvx_signal_070;
reg [32-1:0] rvx_signal_127;
reg rvx_signal_018;
wire [32-1:0] rvx_signal_138;
reg rvx_signal_145;
wire [32-1:0] rvx_signal_033;
wire rvx_signal_090;
reg [32-1:0] rvx_signal_122;
reg rvx_signal_112;
wire [32-1:0] rvx_signal_061;
reg rvx_signal_006;
wire [32-1:0] rvx_signal_129;
wire rvx_signal_114;
reg [32-1:0] rvx_signal_069;
reg rvx_signal_105;
wire [32-1:0] rvx_signal_052;
reg rvx_signal_072;
wire [32-1:0] rvx_signal_022;
wire rvx_signal_117;
reg [32-1:0] rvx_signal_030;
reg rvx_signal_017;
wire [32-1:0] rvx_signal_073;
reg rvx_signal_015;
wire [32-1:0] rvx_signal_140;
wire rvx_signal_136;
reg [32-1:0] rvx_signal_063;
reg rvx_signal_149;
wire [32-1:0] rvx_signal_043;
reg rvx_signal_028;
wire [32-1:0] rvx_signal_002;
wire rvx_signal_095;
reg [32-1:0] rvx_signal_025;
reg rvx_signal_046;
wire [32-1:0] rvx_signal_154;
reg rvx_signal_097;
wire [32-1:0] rvx_signal_125;
wire rvx_signal_064;
reg [32-1:0] rvx_signal_086;
reg rvx_signal_103;
wire [32-1:0] rvx_signal_026;
reg rvx_signal_001;
wire [32-1:0] rvx_signal_088;
wire rvx_signal_079;
reg [32-1:0] rvx_signal_056;
reg rvx_signal_148;
wire [32-1:0] rvx_signal_139;
reg rvx_signal_065;
wire [32-1:0] rvx_signal_016;
wire rvx_signal_146;
reg [32-1:0] rvx_signal_106;
reg rvx_signal_091;
wire [32-1:0] rvx_signal_130;
reg rvx_signal_034;
wire [32-1:0] rvx_signal_035;
wire rvx_signal_039;
reg [32-1:0] rvx_signal_000;
reg rvx_signal_031;
wire [32-1:0] rvx_signal_051;
reg rvx_signal_080;
wire [32-1:0] rvx_signal_059;
wire rvx_signal_135;
reg [32-1:0] rvx_signal_113;
reg rvx_signal_144;
wire [32-1:0] rvx_signal_014;
reg rvx_signal_147;
wire [32-1:0] rvx_signal_009;
wire rvx_signal_096;
reg [32-1:0] rvx_signal_004;

assign rvx_signal_048 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_00);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_055);
assign {rvx_signal_101,rvx_signal_054} = paddr_offset;
assign rvx_signal_057 = {rvx_signal_101,addr_unused};
assign rvx_signal_037 = (rvx_signal_054==0);
assign rvx_signal_007 = rvx_port_11 & rvx_port_08 & rvx_signal_037 & (~rvx_port_09);
assign rvx_signal_019 = rvx_port_11 & rvx_port_08 & rvx_signal_037 & rvx_port_09;

assign rvx_signal_045 = $unsigned(rvx_port_00);
assign rvx_signal_155 = $unsigned(rvx_port_00);
assign rvx_signal_118 = $unsigned(rvx_port_00);
assign rvx_signal_023 = $unsigned(rvx_port_00);
assign rvx_signal_159 = $unsigned(rvx_port_00);
assign rvx_signal_132 = $unsigned(rvx_port_00);
assign rvx_signal_092 = $unsigned(rvx_port_00);
assign rvx_signal_141 = $unsigned(rvx_port_00);
assign rvx_signal_041 = $unsigned(rvx_port_00);
assign rvx_signal_005 = $unsigned(rvx_port_00);
assign rvx_signal_081 = $unsigned(rvx_port_00);
assign rvx_signal_107 = $unsigned(rvx_port_00);
assign rvx_signal_042 = $unsigned(rvx_port_00);
assign rvx_signal_119 = $unsigned(rvx_port_00);
assign rvx_signal_033 = $unsigned(rvx_port_00);
assign rvx_signal_129 = $unsigned(rvx_port_00);
assign rvx_signal_022 = $unsigned(rvx_port_00);
assign rvx_signal_140 = $unsigned(rvx_port_00);
assign rvx_signal_002 = $unsigned(rvx_port_00);
assign rvx_signal_125 = $unsigned(rvx_port_00);
assign rvx_signal_088 = $unsigned(rvx_port_00);
assign rvx_signal_016 = $unsigned(rvx_port_00);
assign rvx_signal_035 = $unsigned(rvx_port_00);
assign rvx_signal_059 = $unsigned(rvx_port_00);
assign rvx_signal_009 = $unsigned(rvx_port_00);

always@(*)
begin
	rvx_port_04 = 0;
	rvx_signal_055 = 0;
	rvx_port_10 = 1;

	rvx_signal_049 = 0;
	rvx_signal_156 = 0;

	rvx_signal_151 = 0;
	rvx_signal_126 = 0;

	rvx_signal_027 = 0;
	rvx_signal_003 = 0;

	rvx_signal_094 = 0;
	rvx_signal_093 = 0;

	rvx_signal_074 = 0;
	rvx_signal_120 = 0;

	rvx_signal_020 = 0;
	rvx_signal_008 = 0;

	rvx_signal_053 = 0;
	rvx_signal_100 = 0;

	rvx_signal_157 = 0;
	rvx_signal_108 = 0;

	rvx_signal_084 = 0;
	rvx_signal_102 = 0;

	rvx_signal_077 = 0;
	rvx_signal_109 = 0;

	rvx_signal_060 = 0;
	rvx_signal_068 = 0;

	rvx_signal_089 = 0;
	rvx_signal_013 = 0;

	rvx_signal_085 = 0;
	rvx_signal_075 = 0;

	rvx_signal_121 = 0;
	rvx_signal_082 = 0;

	rvx_signal_018 = 0;
	rvx_signal_145 = 0;

	rvx_signal_112 = 0;
	rvx_signal_006 = 0;

	rvx_signal_105 = 0;
	rvx_signal_072 = 0;

	rvx_signal_017 = 0;
	rvx_signal_015 = 0;

	rvx_signal_149 = 0;
	rvx_signal_028 = 0;

	rvx_signal_046 = 0;
	rvx_signal_097 = 0;

	rvx_signal_103 = 0;
	rvx_signal_001 = 0;

	rvx_signal_148 = 0;
	rvx_signal_065 = 0;

	rvx_signal_091 = 0;
	rvx_signal_034 = 0;

	rvx_signal_031 = 0;
	rvx_signal_080 = 0;

	rvx_signal_144 = 0;
	rvx_signal_147 = 0;

	if(rvx_port_11==1'b 1)
	begin
		case(rvx_signal_057)
			`RVX_GDEF_316:
			begin
				rvx_signal_049 = rvx_signal_007;
				rvx_signal_156 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_128);
				rvx_port_10 = rvx_signal_087;
			end
			`RVX_GDEF_166:
			begin
				rvx_signal_151 = rvx_signal_007;
				rvx_signal_126 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_150);
				rvx_port_10 = rvx_signal_110;
			end
			`RVX_GDEF_192:
			begin
				rvx_signal_027 = rvx_signal_007;
				rvx_signal_003 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_058);
				rvx_port_10 = rvx_signal_142;
			end
			`RVX_GDEF_079:
			begin
				rvx_signal_094 = rvx_signal_007;
				rvx_signal_093 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_040);
				rvx_port_10 = rvx_signal_024;
			end
			`RVX_GDEF_047:
			begin
				rvx_signal_074 = rvx_signal_007;
				rvx_signal_120 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_133);
				rvx_port_10 = rvx_signal_143;
			end
			`RVX_GDEF_317:
			begin
				rvx_signal_020 = rvx_signal_007;
				rvx_signal_008 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_123);
				rvx_port_10 = rvx_signal_012;
			end
			`RVX_GDEF_172:
			begin
				rvx_signal_053 = rvx_signal_007;
				rvx_signal_100 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_104);
				rvx_port_10 = rvx_signal_066;
			end
			`RVX_GDEF_145:
			begin
				rvx_signal_157 = rvx_signal_007;
				rvx_signal_108 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_047);
				rvx_port_10 = rvx_signal_044;
			end
			`RVX_GDEF_367:
			begin
				rvx_signal_084 = rvx_signal_007;
				rvx_signal_102 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_029);
				rvx_port_10 = rvx_signal_115;
			end
			`RVX_GDEF_349:
			begin
				rvx_signal_077 = rvx_signal_007;
				rvx_signal_109 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_032);
				rvx_port_10 = rvx_signal_116;
			end
			`RVX_GDEF_055:
			begin
				rvx_signal_060 = rvx_signal_007;
				rvx_signal_068 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_078);
				rvx_port_10 = rvx_signal_134;
			end
			`RVX_GDEF_089:
			begin
				rvx_signal_089 = rvx_signal_007;
				rvx_signal_013 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_153);
				rvx_port_10 = rvx_signal_098;
			end
			`RVX_GDEF_038:
			begin
				rvx_signal_085 = rvx_signal_007;
				rvx_signal_075 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_038);
				rvx_port_10 = rvx_signal_010;
			end
			`RVX_GDEF_372:
			begin
				rvx_signal_121 = rvx_signal_007;
				rvx_signal_082 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_131);
				rvx_port_10 = rvx_signal_070;
			end
			`RVX_GDEF_420:
			begin
				rvx_signal_018 = rvx_signal_007;
				rvx_signal_145 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_138);
				rvx_port_10 = rvx_signal_090;
			end
			`RVX_GDEF_388:
			begin
				rvx_signal_112 = rvx_signal_007;
				rvx_signal_006 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_061);
				rvx_port_10 = rvx_signal_114;
			end
			`RVX_GDEF_397:
			begin
				rvx_signal_105 = rvx_signal_007;
				rvx_signal_072 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_052);
				rvx_port_10 = rvx_signal_117;
			end
			`RVX_GDEF_074:
			begin
				rvx_signal_017 = rvx_signal_007;
				rvx_signal_015 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_073);
				rvx_port_10 = rvx_signal_136;
			end
			`RVX_GDEF_364:
			begin
				rvx_signal_149 = rvx_signal_007;
				rvx_signal_028 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_043);
				rvx_port_10 = rvx_signal_095;
			end
			`RVX_GDEF_203:
			begin
				rvx_signal_046 = rvx_signal_007;
				rvx_signal_097 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_154);
				rvx_port_10 = rvx_signal_064;
			end
			`RVX_GDEF_284:
			begin
				rvx_signal_103 = rvx_signal_007;
				rvx_signal_001 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_026);
				rvx_port_10 = rvx_signal_079;
			end
			`RVX_GDEF_264:
			begin
				rvx_signal_148 = rvx_signal_007;
				rvx_signal_065 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_139);
				rvx_port_10 = rvx_signal_146;
			end
			`RVX_GDEF_333:
			begin
				rvx_signal_091 = rvx_signal_007;
				rvx_signal_034 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_130);
				rvx_port_10 = rvx_signal_039;
			end
			`RVX_GDEF_143:
			begin
				rvx_signal_031 = rvx_signal_007;
				rvx_signal_080 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_051);
				rvx_port_10 = rvx_signal_135;
			end
			`RVX_GDEF_114:
			begin
				rvx_signal_144 = rvx_signal_007;
				rvx_signal_147 = rvx_signal_019;
				rvx_signal_055 = $unsigned(rvx_signal_014);
				rvx_port_10 = rvx_signal_096;
			end
			default:
				rvx_port_04 = 1;
		endcase
	end
end

always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_036 <= `RVX_GDEF_049;
	else if (rvx_signal_156==1'b 1)
		rvx_signal_036 <= rvx_signal_045;
end
assign rvx_signal_128 = rvx_signal_036;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_111 <= `RVX_GDEF_377;
	else if (rvx_signal_126==1'b 1)
		rvx_signal_111 <= rvx_signal_155;
end
assign rvx_signal_150 = rvx_signal_111;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_076 <= `RVX_GDEF_377;
	else if (rvx_signal_003==1'b 1)
		rvx_signal_076 <= rvx_signal_118;
end
assign rvx_signal_058 = rvx_signal_076;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_152 <= `RVX_GDEF_377;
	else if (rvx_signal_093==1'b 1)
		rvx_signal_152 <= rvx_signal_023;
end
assign rvx_signal_040 = rvx_signal_152;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_137 <= `RVX_GDEF_377;
	else if (rvx_signal_120==1'b 1)
		rvx_signal_137 <= rvx_signal_159;
end
assign rvx_signal_133 = rvx_signal_137;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_071 <= `RVX_GDEF_377;
	else if (rvx_signal_008==1'b 1)
		rvx_signal_071 <= rvx_signal_132;
end
assign rvx_signal_123 = rvx_signal_071;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_011 <= `RVX_GDEF_377;
	else if (rvx_signal_100==1'b 1)
		rvx_signal_011 <= rvx_signal_092;
end
assign rvx_signal_104 = rvx_signal_011;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_083 <= `RVX_GDEF_377;
	else if (rvx_signal_108==1'b 1)
		rvx_signal_083 <= rvx_signal_141;
end
assign rvx_signal_047 = rvx_signal_083;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_099 <= `RVX_GDEF_377;
	else if (rvx_signal_102==1'b 1)
		rvx_signal_099 <= rvx_signal_041;
end
assign rvx_signal_029 = rvx_signal_099;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_062 <= `RVX_GDEF_031;
	else if (rvx_signal_109==1'b 1)
		rvx_signal_062 <= rvx_signal_005;
end
assign rvx_signal_032 = rvx_signal_062;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_067 <= `RVX_GDEF_031;
	else if (rvx_signal_068==1'b 1)
		rvx_signal_067 <= rvx_signal_081;
end
assign rvx_signal_078 = rvx_signal_067;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_158 <= `RVX_GDEF_031;
	else if (rvx_signal_013==1'b 1)
		rvx_signal_158 <= rvx_signal_107;
end
assign rvx_signal_153 = rvx_signal_158;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_050 <= `RVX_GDEF_031;
	else if (rvx_signal_075==1'b 1)
		rvx_signal_050 <= rvx_signal_042;
end
assign rvx_signal_038 = rvx_signal_050;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_127 <= `RVX_GDEF_031;
	else if (rvx_signal_082==1'b 1)
		rvx_signal_127 <= rvx_signal_119;
end
assign rvx_signal_131 = rvx_signal_127;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_122 <= `RVX_GDEF_031;
	else if (rvx_signal_145==1'b 1)
		rvx_signal_122 <= rvx_signal_033;
end
assign rvx_signal_138 = rvx_signal_122;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_069 <= `RVX_GDEF_031;
	else if (rvx_signal_006==1'b 1)
		rvx_signal_069 <= rvx_signal_129;
end
assign rvx_signal_061 = rvx_signal_069;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_030 <= `RVX_GDEF_031;
	else if (rvx_signal_072==1'b 1)
		rvx_signal_030 <= rvx_signal_022;
end
assign rvx_signal_052 = rvx_signal_030;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_063 <= `RVX_GDEF_408;
	else if (rvx_signal_015==1'b 1)
		rvx_signal_063 <= rvx_signal_140;
end
assign rvx_signal_073 = rvx_signal_063;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_025 <= `RVX_GDEF_408;
	else if (rvx_signal_028==1'b 1)
		rvx_signal_025 <= rvx_signal_002;
end
assign rvx_signal_043 = rvx_signal_025;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_086 <= `RVX_GDEF_408;
	else if (rvx_signal_097==1'b 1)
		rvx_signal_086 <= rvx_signal_125;
end
assign rvx_signal_154 = rvx_signal_086;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_056 <= `RVX_GDEF_408;
	else if (rvx_signal_001==1'b 1)
		rvx_signal_056 <= rvx_signal_088;
end
assign rvx_signal_026 = rvx_signal_056;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_106 <= `RVX_GDEF_408;
	else if (rvx_signal_065==1'b 1)
		rvx_signal_106 <= rvx_signal_016;
end
assign rvx_signal_139 = rvx_signal_106;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_000 <= `RVX_GDEF_408;
	else if (rvx_signal_034==1'b 1)
		rvx_signal_000 <= rvx_signal_035;
end
assign rvx_signal_130 = rvx_signal_000;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_113 <= `RVX_GDEF_408;
	else if (rvx_signal_080==1'b 1)
		rvx_signal_113 <= rvx_signal_059;
end
assign rvx_signal_051 = rvx_signal_113;
always@(posedge rvx_port_02, negedge rvx_port_07)
begin
	if(rvx_port_07==0)
		rvx_signal_004 <= `RVX_GDEF_408;
	else if (rvx_signal_147==1'b 1)
		rvx_signal_004 <= rvx_signal_009;
end
assign rvx_signal_014 = rvx_signal_004;

assign rvx_port_01 = rvx_signal_036;
assign rvx_signal_087 = 1;

assign rvx_port_13[(32)*((00)+1)-1-:32] = rvx_signal_111;

assign rvx_port_13[(32)*((01)+1)-1-:32] = rvx_signal_076;

assign rvx_port_13[(32)*((02)+1)-1-:32] = rvx_signal_152;

assign rvx_port_13[(32)*((03)+1)-1-:32] = rvx_signal_137;

assign rvx_port_13[(32)*((04)+1)-1-:32] = rvx_signal_071;

assign rvx_port_13[(32)*((05)+1)-1-:32] = rvx_signal_011;

assign rvx_port_13[(32)*((06)+1)-1-:32] = rvx_signal_083;

assign rvx_port_13[(32)*((07)+1)-1-:32] = rvx_signal_099;

assign rvx_signal_110 = 1;

assign rvx_signal_142 = 1;

assign rvx_signal_024 = 1;

assign rvx_signal_143 = 1;

assign rvx_signal_012 = 1;

assign rvx_signal_066 = 1;

assign rvx_signal_044 = 1;

assign rvx_signal_115 = 1;

assign rvx_port_05[(32)*((00)+1)-1-:32] = rvx_signal_062;

assign rvx_port_05[(32)*((01)+1)-1-:32] = rvx_signal_067;

assign rvx_port_05[(32)*((02)+1)-1-:32] = rvx_signal_158;

assign rvx_port_05[(32)*((03)+1)-1-:32] = rvx_signal_050;

assign rvx_port_05[(32)*((04)+1)-1-:32] = rvx_signal_127;

assign rvx_port_05[(32)*((05)+1)-1-:32] = rvx_signal_122;

assign rvx_port_05[(32)*((06)+1)-1-:32] = rvx_signal_069;

assign rvx_port_05[(32)*((07)+1)-1-:32] = rvx_signal_030;

assign rvx_signal_116 = 1;

assign rvx_signal_134 = 1;

assign rvx_signal_098 = 1;

assign rvx_signal_010 = 1;

assign rvx_signal_070 = 1;

assign rvx_signal_090 = 1;

assign rvx_signal_114 = 1;

assign rvx_signal_117 = 1;

assign rvx_port_06[(32)*((00)+1)-1-:32] = rvx_signal_063;

assign rvx_port_06[(32)*((01)+1)-1-:32] = rvx_signal_025;

assign rvx_port_06[(32)*((02)+1)-1-:32] = rvx_signal_086;

assign rvx_port_06[(32)*((03)+1)-1-:32] = rvx_signal_056;

assign rvx_port_06[(32)*((04)+1)-1-:32] = rvx_signal_106;

assign rvx_port_06[(32)*((05)+1)-1-:32] = rvx_signal_000;

assign rvx_port_06[(32)*((06)+1)-1-:32] = rvx_signal_113;

assign rvx_port_06[(32)*((07)+1)-1-:32] = rvx_signal_004;

assign rvx_signal_136 = 1;

assign rvx_signal_095 = 1;

assign rvx_signal_064 = 1;

assign rvx_signal_079 = 1;

assign rvx_signal_146 = 1;

assign rvx_signal_039 = 1;

assign rvx_signal_135 = 1;

assign rvx_signal_096 = 1;

endmodule
