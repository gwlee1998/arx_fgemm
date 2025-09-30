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
`include "rvx_include_13.vh"




module RVX_MODULE_111
(
	rvx_port_08,
	rvx_port_11,

	rvx_port_16,
	rvx_port_05,
	rvx_port_19,
	rvx_port_09,
	rvx_port_03,
	rvx_port_12,
	rvx_port_20,
	rvx_port_17,

	rvx_port_07,
	rvx_port_04,
	rvx_port_06,
	rvx_port_15,
	rvx_port_14,
	rvx_port_01,
	rvx_port_18,
	rvx_port_00,
	rvx_port_10,
	rvx_port_13,
	rvx_port_02
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_08, rvx_port_11;
input wire rvx_port_16;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_19;
input wire rvx_port_09;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire [RVX_GPARA_2-1:0] rvx_port_12;
output reg rvx_port_20;
output reg rvx_port_17;

input wire rvx_port_07;

output wire rvx_port_04;
input wire [32-1:0] rvx_port_06;
output wire rvx_port_15;
output wire [32-1:0] rvx_port_14;

output wire [32-1:0] rvx_port_01;

output wire [32-1:0] rvx_port_18;

output wire rvx_port_00;
input wire [32-1:0] rvx_port_10;

output wire rvx_port_13;
input wire [32-1:0] rvx_port_02;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_34;
reg [RVX_GPARA_2-1:0] rvx_signal_15;
wire rvx_signal_00;
wire rvx_signal_28;
wire rvx_signal_03;

wire [`RVX_GDEF_029-1:0] paddr_offset = rvx_port_19;
wire [`RVX_GDEF_029-1:0] rvx_signal_14;
wire [RVX_GPARA_0-1:0] rvx_signal_07;
wire [`RVX_GDEF_380-1:0] rvx_signal_18;
wire [`RVX_GDEF_380-1:0] addr_unused = 0;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_02;
reg rvx_signal_33;
wire [32-1:0] rvx_signal_32;
wire rvx_signal_25;
reg rvx_signal_24;
wire [32-1:0] rvx_signal_20;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_26;
wire rvx_signal_17;
reg [32-1:0] rvx_signal_30;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_16;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_11;
wire rvx_signal_22;
reg [32-1:0] rvx_signal_12;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_01;
wire [32-1:0] rvx_signal_35;
wire rvx_signal_04;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_23;
reg rvx_signal_06;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_13;

assign rvx_signal_34 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_03);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_15);
assign {rvx_signal_07,rvx_signal_18} = paddr_offset;
assign rvx_signal_14 = {rvx_signal_07,addr_unused};
assign rvx_signal_03 = (rvx_signal_18==0);
assign rvx_signal_00 = rvx_port_16 & rvx_port_05 & rvx_signal_03 & (~rvx_port_09);
assign rvx_signal_28 = rvx_port_16 & rvx_port_05 & rvx_signal_03 & rvx_port_09;

assign rvx_signal_32 = $unsigned(rvx_port_03);
assign rvx_signal_26 = $unsigned(rvx_port_03);
assign rvx_signal_11 = $unsigned(rvx_port_03);
assign rvx_signal_35 = $unsigned(rvx_port_03);
assign rvx_signal_27 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_17 = 0;
	rvx_signal_15 = 0;
	rvx_port_20 = 1;

	rvx_signal_08 = 0;
	rvx_signal_33 = 0;

	rvx_signal_24 = 0;
	rvx_signal_09 = 0;

	rvx_signal_36 = 0;
	rvx_signal_19 = 0;

	rvx_signal_05 = 0;
	rvx_signal_01 = 0;

	rvx_signal_21 = 0;
	rvx_signal_06 = 0;

	if(rvx_port_16==1'b 1)
	begin
		case(rvx_signal_14)
			`RVX_GDEF_274:
			begin
				rvx_signal_08 = rvx_signal_00;
				rvx_signal_33 = rvx_signal_28;
				rvx_signal_15 = $unsigned(rvx_signal_02);
				rvx_port_20 = rvx_signal_25;
			end
			`RVX_GDEF_150:
			begin
				rvx_signal_24 = rvx_signal_00;
				rvx_signal_09 = rvx_signal_28;
				rvx_signal_15 = $unsigned(rvx_signal_20);
				rvx_port_20 = rvx_signal_17;
			end
			`RVX_GDEF_362:
			begin
				rvx_signal_36 = rvx_signal_00;
				rvx_signal_19 = rvx_signal_28;
				rvx_signal_15 = $unsigned(rvx_signal_16);
				rvx_port_20 = rvx_signal_22;
			end
			`RVX_GDEF_208:
			begin
				rvx_signal_05 = rvx_signal_00;
				rvx_signal_01 = rvx_signal_28;
				rvx_signal_15 = $unsigned(rvx_signal_29);
				rvx_port_20 = rvx_signal_04;
			end
			`RVX_GDEF_146:
			begin
				rvx_signal_21 = rvx_signal_00;
				rvx_signal_06 = rvx_signal_28;
				rvx_signal_15 = $unsigned(rvx_signal_23);
				rvx_port_20 = rvx_signal_13;
			end
			default:
				rvx_port_17 = 1;
		endcase
	end
end

always@(posedge rvx_port_08, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_30 <= `RVX_GDEF_006;
	else if (rvx_signal_09==1'b 1)
		rvx_signal_30 <= rvx_signal_26;
end
assign rvx_signal_20 = rvx_signal_30;
always@(posedge rvx_port_08, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_12 <= `RVX_GDEF_228;
	else if (rvx_signal_19==1'b 1)
		rvx_signal_12 <= rvx_signal_11;
end
assign rvx_signal_16 = rvx_signal_12;
assign rvx_port_04 = rvx_signal_08;
assign rvx_signal_02 = rvx_port_06;
assign rvx_port_15 = rvx_signal_33;
assign rvx_port_14 = rvx_signal_32;
assign rvx_signal_25 = 1;
assign rvx_port_01 = rvx_signal_30;
assign rvx_signal_17 = 1;
assign rvx_port_18 = rvx_signal_12;
assign rvx_signal_22 = 1;
assign rvx_port_00 = rvx_signal_05;
assign rvx_signal_29 = rvx_port_10;
assign rvx_signal_04 = 1;
assign rvx_port_13 = rvx_signal_21;
assign rvx_signal_23 = rvx_port_02;
assign rvx_signal_13 = 1;

endmodule
