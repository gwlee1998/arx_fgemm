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




module RVX_MODULE_110
(
	rvx_port_02,
	rvx_port_08,

	rvx_port_07,
	rvx_port_05,
	rvx_port_09,
	rvx_port_00,
	rvx_port_04,
	rvx_port_12,
	rvx_port_01,
	rvx_port_06,

	rvx_port_10,
	rvx_port_11,
	rvx_port_03
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_02, rvx_port_08;
input wire rvx_port_07;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_09;
input wire rvx_port_00;
input wire [RVX_GPARA_2-1:0] rvx_port_04;
output wire [RVX_GPARA_2-1:0] rvx_port_12;
output reg rvx_port_01;
output reg rvx_port_06;

input wire rvx_port_10;

output wire [16-1:0] rvx_port_11;

output wire [(32)*(8)-1:0] rvx_port_03;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_43;
reg [RVX_GPARA_2-1:0] rvx_signal_55;
wire rvx_signal_57;
wire rvx_signal_39;
wire rvx_signal_15;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_09;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_37;
wire [RVX_GPARA_0-1:0] rvx_signal_26;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_07;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_49;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_13;
wire rvx_signal_58;
reg [32-1:0] rvx_signal_33;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_40;
reg rvx_signal_54;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_51;
reg [32-1:0] rvx_signal_31;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_23;
wire rvx_signal_04;
reg [32-1:0] rvx_signal_45;
reg rvx_signal_42;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_59;
wire [32-1:0] rvx_signal_11;
wire rvx_signal_61;
reg [32-1:0] rvx_signal_62;
reg rvx_signal_53;
wire [32-1:0] rvx_signal_20;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_38;
wire rvx_signal_36;
reg [32-1:0] rvx_signal_21;
reg rvx_signal_06;
wire [32-1:0] rvx_signal_46;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_47;
wire rvx_signal_09;
reg [32-1:0] rvx_signal_52;
reg rvx_signal_35;
wire [32-1:0] rvx_signal_32;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_16;
wire rvx_signal_14;
reg [32-1:0] rvx_signal_48;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_22;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_10;
reg [32-1:0] rvx_signal_01;
reg rvx_signal_18;
wire [16-1:0] rvx_signal_30;
reg rvx_signal_44;
wire [16-1:0] rvx_signal_12;
wire rvx_signal_50;
reg [16-1:0] rvx_signal_60;

assign rvx_signal_43 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_04);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_55);
assign {rvx_signal_26,rvx_signal_07} = paddr_offset;
assign rvx_signal_37 = {rvx_signal_26,addr_unused};
assign rvx_signal_15 = (rvx_signal_07==0);
assign rvx_signal_57 = rvx_port_07 & rvx_port_05 & rvx_signal_15 & (~rvx_port_00);
assign rvx_signal_39 = rvx_port_07 & rvx_port_05 & rvx_signal_15 & rvx_port_00;

assign rvx_signal_13 = $unsigned(rvx_port_04);
assign rvx_signal_24 = $unsigned(rvx_port_04);
assign rvx_signal_23 = $unsigned(rvx_port_04);
assign rvx_signal_11 = $unsigned(rvx_port_04);
assign rvx_signal_38 = $unsigned(rvx_port_04);
assign rvx_signal_47 = $unsigned(rvx_port_04);
assign rvx_signal_16 = $unsigned(rvx_port_04);
assign rvx_signal_27 = $unsigned(rvx_port_04);
assign rvx_signal_12 = $unsigned(rvx_port_04);

always@(*)
begin
	rvx_port_06 = 0;
	rvx_signal_55 = 0;
	rvx_port_01 = 1;

	rvx_signal_41 = 0;
	rvx_signal_02 = 0;

	rvx_signal_08 = 0;
	rvx_signal_54 = 0;

	rvx_signal_17 = 0;
	rvx_signal_03 = 0;

	rvx_signal_42 = 0;
	rvx_signal_59 = 0;

	rvx_signal_53 = 0;
	rvx_signal_19 = 0;

	rvx_signal_06 = 0;
	rvx_signal_34 = 0;

	rvx_signal_35 = 0;
	rvx_signal_05 = 0;

	rvx_signal_29 = 0;
	rvx_signal_56 = 0;

	rvx_signal_18 = 0;
	rvx_signal_44 = 0;

	if(rvx_port_07==1'b 1)
	begin
		case(rvx_signal_37)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_41 = rvx_signal_57;
				rvx_signal_02 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_49);
				rvx_port_01 = rvx_signal_58;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_08 = rvx_signal_57;
				rvx_signal_54 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_40);
				rvx_port_01 = rvx_signal_51;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_17 = rvx_signal_57;
				rvx_signal_03 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_00);
				rvx_port_01 = rvx_signal_04;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_42 = rvx_signal_57;
				rvx_signal_59 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_25);
				rvx_port_01 = rvx_signal_61;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_53 = rvx_signal_57;
				rvx_signal_19 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_20);
				rvx_port_01 = rvx_signal_36;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_06 = rvx_signal_57;
				rvx_signal_34 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_46);
				rvx_port_01 = rvx_signal_09;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_35 = rvx_signal_57;
				rvx_signal_05 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_32);
				rvx_port_01 = rvx_signal_14;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_29 = rvx_signal_57;
				rvx_signal_56 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_22);
				rvx_port_01 = rvx_signal_10;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_18 = rvx_signal_57;
				rvx_signal_44 = rvx_signal_39;
				rvx_signal_55 = $unsigned(rvx_signal_30);
				rvx_port_01 = rvx_signal_50;
			end
			default:
				rvx_port_06 = 1;
		endcase
	end
end

always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_33 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_02==1'b 1)
		rvx_signal_33 <= rvx_signal_13;
end
assign rvx_signal_49 = rvx_signal_33;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_31 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_54==1'b 1)
		rvx_signal_31 <= rvx_signal_24;
end
assign rvx_signal_40 = rvx_signal_31;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_45 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_45 <= rvx_signal_23;
end
assign rvx_signal_00 = rvx_signal_45;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_62 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_59==1'b 1)
		rvx_signal_62 <= rvx_signal_11;
end
assign rvx_signal_25 = rvx_signal_62;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_21 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_19==1'b 1)
		rvx_signal_21 <= rvx_signal_38;
end
assign rvx_signal_20 = rvx_signal_21;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_52 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_34==1'b 1)
		rvx_signal_52 <= rvx_signal_47;
end
assign rvx_signal_46 = rvx_signal_52;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_48 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_05==1'b 1)
		rvx_signal_48 <= rvx_signal_16;
end
assign rvx_signal_32 = rvx_signal_48;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_01 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_56==1'b 1)
		rvx_signal_01 <= rvx_signal_27;
end
assign rvx_signal_22 = rvx_signal_01;
always@(posedge rvx_port_02, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_60 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_44==1'b 1)
		rvx_signal_60 <= rvx_signal_12;
end
assign rvx_signal_30 = rvx_signal_60;
assign rvx_port_11 = rvx_signal_60;
assign rvx_signal_50 = 1;

assign rvx_port_03[(32)*((00)+1)-1-:32] = rvx_signal_33;

assign rvx_port_03[(32)*((01)+1)-1-:32] = rvx_signal_31;

assign rvx_port_03[(32)*((02)+1)-1-:32] = rvx_signal_45;

assign rvx_port_03[(32)*((03)+1)-1-:32] = rvx_signal_62;

assign rvx_port_03[(32)*((04)+1)-1-:32] = rvx_signal_21;

assign rvx_port_03[(32)*((05)+1)-1-:32] = rvx_signal_52;

assign rvx_port_03[(32)*((06)+1)-1-:32] = rvx_signal_48;

assign rvx_port_03[(32)*((07)+1)-1-:32] = rvx_signal_01;

assign rvx_signal_58 = 1;

assign rvx_signal_51 = 1;

assign rvx_signal_04 = 1;

assign rvx_signal_61 = 1;

assign rvx_signal_36 = 1;

assign rvx_signal_09 = 1;

assign rvx_signal_14 = 1;

assign rvx_signal_10 = 1;

endmodule
