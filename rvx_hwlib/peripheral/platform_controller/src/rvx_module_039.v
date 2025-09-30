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




module RVX_MODULE_039
(
	rvx_port_04,
	rvx_port_28,

	rvx_port_12,
	rvx_port_27,
	rvx_port_30,
	rvx_port_05,
	rvx_port_37,
	rvx_port_11,
	rvx_port_09,
	rvx_port_21,

	rvx_port_32,
	rvx_port_26,
	rvx_port_03,
	rvx_port_00,
	rvx_port_34,
	rvx_port_10,
	rvx_port_17,
	rvx_port_33,
	rvx_port_07,
	rvx_port_06,
	rvx_port_14,
	rvx_port_25,
	rvx_port_20,
	rvx_port_18,
	rvx_port_36,
	rvx_port_19,
	rvx_port_15,
	rvx_port_31,
	rvx_port_23,
	rvx_port_13,
	rvx_port_02,
	rvx_port_35,
	rvx_port_01,
	rvx_port_24,
	rvx_port_29,
	rvx_port_08,
	rvx_port_22,
	rvx_port_16
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_04, rvx_port_28;
input wire rvx_port_12;
input wire rvx_port_27;
input wire [RVX_GPARA_1-1:0] rvx_port_30;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_37;
output wire [RVX_GPARA_0-1:0] rvx_port_11;
output reg rvx_port_09;
output reg rvx_port_21;

input wire rvx_port_32;

output wire rvx_port_26;
input wire [4-1:0] rvx_port_03;

output wire rvx_port_00;
input wire [1-1:0] rvx_port_34;

output wire rvx_port_10;
input wire [1-1:0] rvx_port_17;
output wire rvx_port_33;
output wire [1-1:0] rvx_port_07;

output wire rvx_port_06;
input wire [1-1:0] rvx_port_14;

output wire rvx_port_25;
input wire [32-1:0] rvx_port_20;
output wire rvx_port_18;
output wire [32-1:0] rvx_port_36;

output wire [32-1:0] rvx_port_19;

output wire rvx_port_15;
input wire [32-1:0] rvx_port_31;

output wire rvx_port_23;
input wire [32-1:0] rvx_port_13;

output wire rvx_port_02;
input wire [32-1:0] rvx_port_35;

output wire rvx_port_01;
input wire [32-1:0] rvx_port_24;

output wire [4-1:0] rvx_port_29;
input wire [(32)*(4)-1:0] rvx_port_08;

output wire [4-1:0] rvx_port_22;
input wire [(32)*(4)-1:0] rvx_port_16;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_045;
reg [RVX_GPARA_0-1:0] rvx_signal_050;
wire rvx_signal_063;
wire rvx_signal_041;
wire rvx_signal_055;

wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] paddr_offset = rvx_port_30;
wire [`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_089;
wire [RVX_GPARA_1-1:0] rvx_signal_037;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] rvx_signal_081;
wire [`BW_UNUSED_ERVP_PLATFORM_CONTROLLER-1:0] addr_unused = 0;
reg rvx_signal_011;
wire [4-1:0] rvx_signal_042;
reg rvx_signal_043;
wire [4-1:0] rvx_signal_067;
wire rvx_signal_059;
reg rvx_signal_010;
wire [1-1:0] rvx_signal_083;
reg rvx_signal_030;
wire [1-1:0] rvx_signal_028;
wire rvx_signal_034;
reg rvx_signal_036;
wire [1-1:0] rvx_signal_015;
reg rvx_signal_003;
wire [1-1:0] rvx_signal_082;
wire rvx_signal_032;
reg rvx_signal_009;
wire [1-1:0] rvx_signal_021;
reg rvx_signal_056;
wire [1-1:0] rvx_signal_053;
wire rvx_signal_023;
reg rvx_signal_025;
wire [32-1:0] rvx_signal_096;
reg rvx_signal_078;
wire [32-1:0] rvx_signal_019;
wire rvx_signal_049;
reg rvx_signal_057;
wire [32-1:0] rvx_signal_022;
reg rvx_signal_033;
wire [32-1:0] rvx_signal_086;
wire rvx_signal_002;
reg [32-1:0] rvx_signal_017;
reg rvx_signal_088;
wire [32-1:0] rvx_signal_061;
reg rvx_signal_035;
wire [32-1:0] rvx_signal_006;
wire rvx_signal_054;
reg rvx_signal_068;
wire [32-1:0] rvx_signal_040;
reg rvx_signal_052;
wire [32-1:0] rvx_signal_076;
wire rvx_signal_085;
reg rvx_signal_097;
wire [32-1:0] rvx_signal_031;
reg rvx_signal_014;
wire [32-1:0] rvx_signal_004;
wire rvx_signal_064;
reg rvx_signal_060;
wire [32-1:0] rvx_signal_026;
reg rvx_signal_038;
wire [32-1:0] rvx_signal_087;
wire rvx_signal_039;
reg rvx_signal_048;
wire [32-1:0] rvx_signal_001;
reg rvx_signal_029;
wire [32-1:0] rvx_signal_079;
wire rvx_signal_024;
reg rvx_signal_005;
wire [32-1:0] rvx_signal_065;
reg rvx_signal_099;
wire [32-1:0] rvx_signal_093;
wire rvx_signal_066;
reg rvx_signal_027;
wire [32-1:0] rvx_signal_008;
reg rvx_signal_013;
wire [32-1:0] rvx_signal_074;
wire rvx_signal_075;
reg rvx_signal_000;
wire [32-1:0] rvx_signal_077;
reg rvx_signal_073;
wire [32-1:0] rvx_signal_094;
wire rvx_signal_090;
reg rvx_signal_018;
wire [32-1:0] rvx_signal_020;
reg rvx_signal_016;
wire [32-1:0] rvx_signal_091;
wire rvx_signal_051;
reg rvx_signal_080;
wire [32-1:0] rvx_signal_044;
reg rvx_signal_069;
wire [32-1:0] rvx_signal_084;
wire rvx_signal_070;
reg rvx_signal_072;
wire [32-1:0] rvx_signal_098;
reg rvx_signal_046;
wire [32-1:0] rvx_signal_058;
wire rvx_signal_071;
reg rvx_signal_047;
wire [32-1:0] rvx_signal_012;
reg rvx_signal_092;
wire [32-1:0] rvx_signal_062;
wire rvx_signal_095;

assign rvx_signal_045 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_37);
assign rvx_port_11 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_050);
assign {rvx_signal_037,rvx_signal_081} = paddr_offset;
assign rvx_signal_089 = {rvx_signal_037,addr_unused};
assign rvx_signal_055 = (rvx_signal_081==0);
assign rvx_signal_063 = rvx_port_12 & rvx_port_27 & rvx_signal_055 & (~rvx_port_05);
assign rvx_signal_041 = rvx_port_12 & rvx_port_27 & rvx_signal_055 & rvx_port_05;

assign rvx_signal_067 = $unsigned(rvx_port_37);
assign rvx_signal_028 = $unsigned(rvx_port_37);
assign rvx_signal_082 = $unsigned(rvx_port_37);
assign rvx_signal_053 = $unsigned(rvx_port_37);
assign rvx_signal_019 = $unsigned(rvx_port_37);
assign rvx_signal_086 = $unsigned(rvx_port_37);
assign rvx_signal_006 = $unsigned(rvx_port_37);
assign rvx_signal_076 = $unsigned(rvx_port_37);
assign rvx_signal_004 = $unsigned(rvx_port_37);
assign rvx_signal_087 = $unsigned(rvx_port_37);
assign rvx_signal_079 = $unsigned(rvx_port_37);
assign rvx_signal_093 = $unsigned(rvx_port_37);
assign rvx_signal_074 = $unsigned(rvx_port_37);
assign rvx_signal_094 = $unsigned(rvx_port_37);
assign rvx_signal_091 = $unsigned(rvx_port_37);
assign rvx_signal_084 = $unsigned(rvx_port_37);
assign rvx_signal_058 = $unsigned(rvx_port_37);
assign rvx_signal_062 = $unsigned(rvx_port_37);

always@(*)
begin
	rvx_port_21 = 0;
	rvx_signal_050 = 0;
	rvx_port_09 = 1;

	rvx_signal_011 = 0;
	rvx_signal_043 = 0;

	rvx_signal_010 = 0;
	rvx_signal_030 = 0;

	rvx_signal_036 = 0;
	rvx_signal_003 = 0;

	rvx_signal_009 = 0;
	rvx_signal_056 = 0;

	rvx_signal_025 = 0;
	rvx_signal_078 = 0;

	rvx_signal_057 = 0;
	rvx_signal_033 = 0;

	rvx_signal_088 = 0;
	rvx_signal_035 = 0;

	rvx_signal_068 = 0;
	rvx_signal_052 = 0;

	rvx_signal_097 = 0;
	rvx_signal_014 = 0;

	rvx_signal_060 = 0;
	rvx_signal_038 = 0;

	rvx_signal_048 = 0;
	rvx_signal_029 = 0;

	rvx_signal_005 = 0;
	rvx_signal_099 = 0;

	rvx_signal_027 = 0;
	rvx_signal_013 = 0;

	rvx_signal_000 = 0;
	rvx_signal_073 = 0;

	rvx_signal_018 = 0;
	rvx_signal_016 = 0;

	rvx_signal_080 = 0;
	rvx_signal_069 = 0;

	rvx_signal_072 = 0;
	rvx_signal_046 = 0;

	rvx_signal_047 = 0;
	rvx_signal_092 = 0;

	if(rvx_port_12==1'b 1)
	begin
		case(rvx_signal_089)
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_MODE:
			begin
				rvx_signal_011 = rvx_signal_063;
				rvx_signal_043 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_042);
				rvx_port_09 = rvx_signal_059;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_INITIALIZED:
			begin
				rvx_signal_010 = rvx_signal_063;
				rvx_signal_030 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_083);
				rvx_port_09 = rvx_signal_034;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_SIM_ENV:
			begin
				rvx_signal_036 = rvx_signal_063;
				rvx_signal_003 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_015);
				rvx_port_09 = rvx_signal_032;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_JTAG_SELECT:
			begin
				rvx_signal_009 = rvx_signal_063;
				rvx_signal_056 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_021);
				rvx_port_09 = rvx_signal_023;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_BOOT_STATUS:
			begin
				rvx_signal_025 = rvx_signal_063;
				rvx_signal_078 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_096);
				rvx_port_09 = rvx_signal_049;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_APP_ADDR:
			begin
				rvx_signal_057 = rvx_signal_063;
				rvx_signal_033 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_022);
				rvx_port_09 = rvx_signal_002;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_AUTO_ID:
			begin
				rvx_signal_088 = rvx_signal_063;
				rvx_signal_035 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_061);
				rvx_port_09 = rvx_signal_054;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_PROC_STATUS:
			begin
				rvx_signal_068 = rvx_signal_063;
				rvx_signal_052 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_040);
				rvx_port_09 = rvx_signal_085;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC00:
			begin
				rvx_signal_097 = rvx_signal_063;
				rvx_signal_014 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_031);
				rvx_port_09 = rvx_signal_064;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC01:
			begin
				rvx_signal_060 = rvx_signal_063;
				rvx_signal_038 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_026);
				rvx_port_09 = rvx_signal_039;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC02:
			begin
				rvx_signal_048 = rvx_signal_063;
				rvx_signal_029 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_001);
				rvx_port_09 = rvx_signal_024;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_PC03:
			begin
				rvx_signal_005 = rvx_signal_063;
				rvx_signal_099 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_065);
				rvx_port_09 = rvx_signal_066;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST00:
			begin
				rvx_signal_027 = rvx_signal_063;
				rvx_signal_013 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_008);
				rvx_port_09 = rvx_signal_075;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST01:
			begin
				rvx_signal_000 = rvx_signal_063;
				rvx_signal_073 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_077);
				rvx_port_09 = rvx_signal_090;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST02:
			begin
				rvx_signal_018 = rvx_signal_063;
				rvx_signal_016 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_020);
				rvx_port_09 = rvx_signal_051;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_CORE_INST03:
			begin
				rvx_signal_080 = rvx_signal_063;
				rvx_signal_069 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_044);
				rvx_port_09 = rvx_signal_070;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_IMP_TYPE:
			begin
				rvx_signal_072 = rvx_signal_063;
				rvx_signal_046 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_098);
				rvx_port_09 = rvx_signal_071;
			end
			`MMAP_OFFSET_PLATFORM_REGISTER_FLASH_BASE_ADDR:
			begin
				rvx_signal_047 = rvx_signal_063;
				rvx_signal_092 = rvx_signal_041;
				rvx_signal_050 = $unsigned(rvx_signal_012);
				rvx_port_09 = rvx_signal_095;
			end
			default:
				rvx_port_21 = 1;
		endcase
	end
end

always@(posedge rvx_port_04, negedge rvx_port_28)
begin
	if(rvx_port_28==0)
		rvx_signal_017 <= `PLATFORM_REGISTER_APP_ADDR_DEFAULT_VALUE;
	else if (rvx_signal_033==1'b 1)
		rvx_signal_017 <= rvx_signal_086;
end
assign rvx_signal_022 = rvx_signal_017;
assign rvx_port_26 = rvx_signal_011;
assign rvx_signal_042 = rvx_port_03;
assign rvx_signal_059 = 1;
assign rvx_port_00 = rvx_signal_010;
assign rvx_signal_083 = rvx_port_34;
assign rvx_signal_034 = 1;
assign rvx_port_10 = rvx_signal_036;
assign rvx_signal_015 = rvx_port_17;
assign rvx_port_33 = rvx_signal_003;
assign rvx_port_07 = rvx_signal_082;
assign rvx_signal_032 = 1;
assign rvx_port_06 = rvx_signal_009;
assign rvx_signal_021 = rvx_port_14;
assign rvx_signal_023 = 1;
assign rvx_port_25 = rvx_signal_025;
assign rvx_signal_096 = rvx_port_20;
assign rvx_port_18 = rvx_signal_078;
assign rvx_port_36 = rvx_signal_019;
assign rvx_signal_049 = 1;
assign rvx_port_19 = rvx_signal_017;
assign rvx_signal_002 = 1;
assign rvx_port_15 = rvx_signal_088;
assign rvx_signal_061 = rvx_port_31;
assign rvx_signal_054 = 1;
assign rvx_port_23 = rvx_signal_068;
assign rvx_signal_040 = rvx_port_13;
assign rvx_signal_085 = 1;
assign rvx_port_02 = rvx_signal_072;
assign rvx_signal_098 = rvx_port_35;
assign rvx_signal_071 = 1;
assign rvx_port_01 = rvx_signal_047;
assign rvx_signal_012 = rvx_port_24;
assign rvx_signal_095 = 1;

assign rvx_port_29[00] = rvx_signal_097;
assign rvx_signal_031 = rvx_port_08[(32)*((00)+1)-1-:32];

assign rvx_port_29[01] = rvx_signal_060;
assign rvx_signal_026 = rvx_port_08[(32)*((01)+1)-1-:32];

assign rvx_port_29[02] = rvx_signal_048;
assign rvx_signal_001 = rvx_port_08[(32)*((02)+1)-1-:32];

assign rvx_port_29[03] = rvx_signal_005;
assign rvx_signal_065 = rvx_port_08[(32)*((03)+1)-1-:32];

assign rvx_signal_064 = 1;

assign rvx_signal_039 = 1;

assign rvx_signal_024 = 1;

assign rvx_signal_066 = 1;

assign rvx_port_22[00] = rvx_signal_027;
assign rvx_signal_008 = rvx_port_16[(32)*((00)+1)-1-:32];

assign rvx_port_22[01] = rvx_signal_000;
assign rvx_signal_077 = rvx_port_16[(32)*((01)+1)-1-:32];

assign rvx_port_22[02] = rvx_signal_018;
assign rvx_signal_020 = rvx_port_16[(32)*((02)+1)-1-:32];

assign rvx_port_22[03] = rvx_signal_080;
assign rvx_signal_044 = rvx_port_16[(32)*((03)+1)-1-:32];

assign rvx_signal_075 = 1;

assign rvx_signal_090 = 1;

assign rvx_signal_051 = 1;

assign rvx_signal_070 = 1;

endmodule
