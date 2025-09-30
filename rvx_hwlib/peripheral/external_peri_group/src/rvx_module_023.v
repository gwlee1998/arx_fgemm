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
`include "ervp_external_peri_group_memorymap_offset.vh"




module RVX_MODULE_023
(
	rvx_port_05,
	rvx_port_11,

	rvx_port_09,
	rvx_port_08,
	rvx_port_10,
	rvx_port_02,
	rvx_port_06,
	rvx_port_01,
	rvx_port_14,
	rvx_port_12,

	rvx_port_07,
	rvx_port_03,
	rvx_port_00,
	rvx_port_13,
	rvx_port_04
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_05, rvx_port_11;
input wire rvx_port_09;
input wire rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_02;
input wire [RVX_GPARA_2-1:0] rvx_port_06;
output wire [RVX_GPARA_2-1:0] rvx_port_01;
output reg rvx_port_14;
output reg rvx_port_12;

input wire rvx_port_07;

output wire [16-1:0] rvx_port_03;
input wire [(32)*(16)-1:0] rvx_port_00;
output wire [16-1:0] rvx_port_13;
output wire [(32)*(16)-1:0] rvx_port_04;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_86;
reg [RVX_GPARA_2-1:0] rvx_signal_89;
wire rvx_signal_03;
wire rvx_signal_18;
wire rvx_signal_60;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_10;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_59;
wire [RVX_GPARA_0-1:0] rvx_signal_79;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_22;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_53;
wire [32-1:0] rvx_signal_28;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_01;
wire rvx_signal_32;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_35;
reg rvx_signal_58;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_82;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_66;
reg rvx_signal_48;
wire [32-1:0] rvx_signal_71;
wire rvx_signal_24;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_75;
reg rvx_signal_27;
wire [32-1:0] rvx_signal_70;
wire rvx_signal_51;
reg rvx_signal_74;
wire [32-1:0] rvx_signal_78;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_00;
wire rvx_signal_54;
reg rvx_signal_64;
wire [32-1:0] rvx_signal_14;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_63;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_67;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_77;
wire rvx_signal_02;
reg rvx_signal_62;
wire [32-1:0] rvx_signal_13;
reg rvx_signal_81;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_88;
reg rvx_signal_50;
wire [32-1:0] rvx_signal_15;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_65;
wire rvx_signal_30;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_21;
reg rvx_signal_33;
wire [32-1:0] rvx_signal_45;
wire rvx_signal_43;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_80;
reg rvx_signal_61;
wire [32-1:0] rvx_signal_85;
wire rvx_signal_38;
reg rvx_signal_55;
wire [32-1:0] rvx_signal_46;
reg rvx_signal_69;
wire [32-1:0] rvx_signal_25;
wire rvx_signal_09;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_26;
reg rvx_signal_84;
wire [32-1:0] rvx_signal_12;
wire rvx_signal_76;
reg rvx_signal_87;
wire [32-1:0] rvx_signal_16;
reg rvx_signal_42;
wire [32-1:0] rvx_signal_47;
wire rvx_signal_37;
reg rvx_signal_52;
wire [32-1:0] rvx_signal_04;
reg rvx_signal_39;
wire [32-1:0] rvx_signal_73;
wire rvx_signal_23;
reg rvx_signal_57;
wire [32-1:0] rvx_signal_44;
reg rvx_signal_40;
wire [32-1:0] rvx_signal_17;
wire rvx_signal_72;

assign rvx_signal_86 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_06);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_89);
assign {rvx_signal_79,rvx_signal_22} = paddr_offset;
assign rvx_signal_59 = {rvx_signal_79,addr_unused};
assign rvx_signal_60 = (rvx_signal_22==0);
assign rvx_signal_03 = rvx_port_09 & rvx_port_08 & rvx_signal_60 & (~rvx_port_02);
assign rvx_signal_18 = rvx_port_09 & rvx_port_08 & rvx_signal_60 & rvx_port_02;

assign rvx_signal_01 = $unsigned(rvx_port_06);
assign rvx_signal_08 = $unsigned(rvx_port_06);
assign rvx_signal_71 = $unsigned(rvx_port_06);
assign rvx_signal_70 = $unsigned(rvx_port_06);
assign rvx_signal_00 = $unsigned(rvx_port_06);
assign rvx_signal_05 = $unsigned(rvx_port_06);
assign rvx_signal_77 = $unsigned(rvx_port_06);
assign rvx_signal_06 = $unsigned(rvx_port_06);
assign rvx_signal_65 = $unsigned(rvx_port_06);
assign rvx_signal_45 = $unsigned(rvx_port_06);
assign rvx_signal_85 = $unsigned(rvx_port_06);
assign rvx_signal_25 = $unsigned(rvx_port_06);
assign rvx_signal_12 = $unsigned(rvx_port_06);
assign rvx_signal_47 = $unsigned(rvx_port_06);
assign rvx_signal_73 = $unsigned(rvx_port_06);
assign rvx_signal_17 = $unsigned(rvx_port_06);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_89 = 0;
	rvx_port_14 = 1;

	rvx_signal_53 = 0;
	rvx_signal_34 = 0;

	rvx_signal_36 = 0;
	rvx_signal_58 = 0;

	rvx_signal_49 = 0;
	rvx_signal_48 = 0;

	rvx_signal_20 = 0;
	rvx_signal_27 = 0;

	rvx_signal_74 = 0;
	rvx_signal_41 = 0;

	rvx_signal_64 = 0;
	rvx_signal_10 = 0;

	rvx_signal_31 = 0;
	rvx_signal_19 = 0;

	rvx_signal_62 = 0;
	rvx_signal_81 = 0;

	rvx_signal_50 = 0;
	rvx_signal_29 = 0;

	rvx_signal_56 = 0;
	rvx_signal_33 = 0;

	rvx_signal_83 = 0;
	rvx_signal_61 = 0;

	rvx_signal_55 = 0;
	rvx_signal_69 = 0;

	rvx_signal_07 = 0;
	rvx_signal_84 = 0;

	rvx_signal_87 = 0;
	rvx_signal_42 = 0;

	rvx_signal_52 = 0;
	rvx_signal_39 = 0;

	rvx_signal_57 = 0;
	rvx_signal_40 = 0;

	if(rvx_port_09==1'b 1)
	begin
		case(rvx_signal_59)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_53 = rvx_signal_03;
				rvx_signal_34 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_28);
				rvx_port_14 = rvx_signal_32;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_36 = rvx_signal_03;
				rvx_signal_58 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_35);
				rvx_port_14 = rvx_signal_82;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_49 = rvx_signal_03;
				rvx_signal_48 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_66);
				rvx_port_14 = rvx_signal_24;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_20 = rvx_signal_03;
				rvx_signal_27 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_75);
				rvx_port_14 = rvx_signal_51;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_74 = rvx_signal_03;
				rvx_signal_41 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_78);
				rvx_port_14 = rvx_signal_54;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_64 = rvx_signal_03;
				rvx_signal_10 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_14);
				rvx_port_14 = rvx_signal_63;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_31 = rvx_signal_03;
				rvx_signal_19 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_67);
				rvx_port_14 = rvx_signal_02;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_62 = rvx_signal_03;
				rvx_signal_81 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_13);
				rvx_port_14 = rvx_signal_88;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_50 = rvx_signal_03;
				rvx_signal_29 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_15);
				rvx_port_14 = rvx_signal_30;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_56 = rvx_signal_03;
				rvx_signal_33 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_21);
				rvx_port_14 = rvx_signal_43;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_83 = rvx_signal_03;
				rvx_signal_61 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_80);
				rvx_port_14 = rvx_signal_38;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_55 = rvx_signal_03;
				rvx_signal_69 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_46);
				rvx_port_14 = rvx_signal_09;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_07 = rvx_signal_03;
				rvx_signal_84 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_26);
				rvx_port_14 = rvx_signal_76;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_87 = rvx_signal_03;
				rvx_signal_42 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_16);
				rvx_port_14 = rvx_signal_37;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_52 = rvx_signal_03;
				rvx_signal_39 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_04);
				rvx_port_14 = rvx_signal_23;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_57 = rvx_signal_03;
				rvx_signal_40 = rvx_signal_18;
				rvx_signal_89 = $unsigned(rvx_signal_44);
				rvx_port_14 = rvx_signal_72;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

assign rvx_port_03[00] = rvx_signal_53;
assign rvx_signal_28 = rvx_port_00[(32)*((00)+1)-1-:32];
assign rvx_port_13[00] = rvx_signal_34;
assign rvx_port_04[(32)*((00)+1)-1-:32] = rvx_signal_01;

assign rvx_port_03[01] = rvx_signal_36;
assign rvx_signal_35 = rvx_port_00[(32)*((01)+1)-1-:32];
assign rvx_port_13[01] = rvx_signal_58;
assign rvx_port_04[(32)*((01)+1)-1-:32] = rvx_signal_08;

assign rvx_port_03[02] = rvx_signal_49;
assign rvx_signal_66 = rvx_port_00[(32)*((02)+1)-1-:32];
assign rvx_port_13[02] = rvx_signal_48;
assign rvx_port_04[(32)*((02)+1)-1-:32] = rvx_signal_71;

assign rvx_port_03[03] = rvx_signal_20;
assign rvx_signal_75 = rvx_port_00[(32)*((03)+1)-1-:32];
assign rvx_port_13[03] = rvx_signal_27;
assign rvx_port_04[(32)*((03)+1)-1-:32] = rvx_signal_70;

assign rvx_port_03[04] = rvx_signal_74;
assign rvx_signal_78 = rvx_port_00[(32)*((04)+1)-1-:32];
assign rvx_port_13[04] = rvx_signal_41;
assign rvx_port_04[(32)*((04)+1)-1-:32] = rvx_signal_00;

assign rvx_port_03[05] = rvx_signal_64;
assign rvx_signal_14 = rvx_port_00[(32)*((05)+1)-1-:32];
assign rvx_port_13[05] = rvx_signal_10;
assign rvx_port_04[(32)*((05)+1)-1-:32] = rvx_signal_05;

assign rvx_port_03[06] = rvx_signal_31;
assign rvx_signal_67 = rvx_port_00[(32)*((06)+1)-1-:32];
assign rvx_port_13[06] = rvx_signal_19;
assign rvx_port_04[(32)*((06)+1)-1-:32] = rvx_signal_77;

assign rvx_port_03[07] = rvx_signal_62;
assign rvx_signal_13 = rvx_port_00[(32)*((07)+1)-1-:32];
assign rvx_port_13[07] = rvx_signal_81;
assign rvx_port_04[(32)*((07)+1)-1-:32] = rvx_signal_06;

assign rvx_port_03[08] = rvx_signal_50;
assign rvx_signal_15 = rvx_port_00[(32)*((08)+1)-1-:32];
assign rvx_port_13[08] = rvx_signal_29;
assign rvx_port_04[(32)*((08)+1)-1-:32] = rvx_signal_65;

assign rvx_port_03[09] = rvx_signal_56;
assign rvx_signal_21 = rvx_port_00[(32)*((09)+1)-1-:32];
assign rvx_port_13[09] = rvx_signal_33;
assign rvx_port_04[(32)*((09)+1)-1-:32] = rvx_signal_45;

assign rvx_port_03[10] = rvx_signal_83;
assign rvx_signal_80 = rvx_port_00[(32)*((10)+1)-1-:32];
assign rvx_port_13[10] = rvx_signal_61;
assign rvx_port_04[(32)*((10)+1)-1-:32] = rvx_signal_85;

assign rvx_port_03[11] = rvx_signal_55;
assign rvx_signal_46 = rvx_port_00[(32)*((11)+1)-1-:32];
assign rvx_port_13[11] = rvx_signal_69;
assign rvx_port_04[(32)*((11)+1)-1-:32] = rvx_signal_25;

assign rvx_port_03[12] = rvx_signal_07;
assign rvx_signal_26 = rvx_port_00[(32)*((12)+1)-1-:32];
assign rvx_port_13[12] = rvx_signal_84;
assign rvx_port_04[(32)*((12)+1)-1-:32] = rvx_signal_12;

assign rvx_port_03[13] = rvx_signal_87;
assign rvx_signal_16 = rvx_port_00[(32)*((13)+1)-1-:32];
assign rvx_port_13[13] = rvx_signal_42;
assign rvx_port_04[(32)*((13)+1)-1-:32] = rvx_signal_47;

assign rvx_port_03[14] = rvx_signal_52;
assign rvx_signal_04 = rvx_port_00[(32)*((14)+1)-1-:32];
assign rvx_port_13[14] = rvx_signal_39;
assign rvx_port_04[(32)*((14)+1)-1-:32] = rvx_signal_73;

assign rvx_port_03[15] = rvx_signal_57;
assign rvx_signal_44 = rvx_port_00[(32)*((15)+1)-1-:32];
assign rvx_port_13[15] = rvx_signal_40;
assign rvx_port_04[(32)*((15)+1)-1-:32] = rvx_signal_17;

assign rvx_signal_32 = 1;

assign rvx_signal_82 = 1;

assign rvx_signal_24 = 1;

assign rvx_signal_51 = 1;

assign rvx_signal_54 = 1;

assign rvx_signal_63 = 1;

assign rvx_signal_02 = 1;

assign rvx_signal_88 = 1;

assign rvx_signal_30 = 1;

assign rvx_signal_43 = 1;

assign rvx_signal_38 = 1;

assign rvx_signal_09 = 1;

assign rvx_signal_76 = 1;

assign rvx_signal_37 = 1;

assign rvx_signal_23 = 1;

assign rvx_signal_72 = 1;

endmodule
