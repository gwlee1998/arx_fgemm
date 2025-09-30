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
`include "rvx_include_12.vh"




module RVX_MODULE_074
(
	rvx_port_12,
	rvx_port_16,

	rvx_port_08,
	rvx_port_13,
	rvx_port_18,
	rvx_port_09,
	rvx_port_17,
	rvx_port_05,
	rvx_port_04,
	rvx_port_11,

	rvx_port_07,
	rvx_port_10,
	rvx_port_02,
	rvx_port_03,
	rvx_port_00,
	rvx_port_14,
	rvx_port_01,
	rvx_port_06,
	rvx_port_15
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_12, rvx_port_16;
input wire rvx_port_08;
input wire rvx_port_13;
input wire [RVX_GPARA_0-1:0] rvx_port_18;
input wire rvx_port_09;
input wire [RVX_GPARA_2-1:0] rvx_port_17;
output wire [RVX_GPARA_2-1:0] rvx_port_05;
output reg rvx_port_04;
output reg rvx_port_11;

input wire rvx_port_07;

output wire rvx_port_10;
input wire [5-1:0] rvx_port_02;
output wire rvx_port_03;
output wire [5-1:0] rvx_port_00;

output wire [32-1:0] rvx_port_14;

output wire rvx_port_01;

output wire [32-1:0] rvx_port_06;

output wire [32-1:0] rvx_port_15;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_07;
reg [RVX_GPARA_2-1:0] rvx_signal_23;
wire rvx_signal_21;
wire rvx_signal_28;
wire rvx_signal_26;

wire [`RVX_GDEF_422-1:0] paddr_offset = rvx_port_18;
wire [`RVX_GDEF_422-1:0] rvx_signal_25;
wire [RVX_GPARA_0-1:0] rvx_signal_14;
wire [`RVX_GDEF_411-1:0] rvx_signal_13;
wire [`RVX_GDEF_411-1:0] addr_unused = 0;
reg rvx_signal_19;
wire [5-1:0] rvx_signal_34;
reg rvx_signal_12;
wire [5-1:0] rvx_signal_30;
wire rvx_signal_35;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_01;
reg rvx_signal_15;
wire [32-1:0] rvx_signal_20;
wire rvx_signal_37;
reg [32-1:0] rvx_signal_09;
reg rvx_signal_27;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_18;
wire [32-1:0] rvx_signal_31;
wire rvx_signal_06;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_32;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_22;
reg [32-1:0] rvx_signal_33;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_36;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_11;
reg [32-1:0] rvx_signal_10;

assign rvx_signal_07 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_17);
assign rvx_port_05 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_23);
assign {rvx_signal_14,rvx_signal_13} = paddr_offset;
assign rvx_signal_25 = {rvx_signal_14,addr_unused};
assign rvx_signal_26 = (rvx_signal_13==0);
assign rvx_signal_21 = rvx_port_08 & rvx_port_13 & rvx_signal_26 & (~rvx_port_09);
assign rvx_signal_28 = rvx_port_08 & rvx_port_13 & rvx_signal_26 & rvx_port_09;

assign rvx_signal_30 = $unsigned(rvx_port_17);
assign rvx_signal_20 = $unsigned(rvx_port_17);
assign rvx_signal_31 = $unsigned(rvx_port_17);
assign rvx_signal_24 = $unsigned(rvx_port_17);
assign rvx_signal_08 = $unsigned(rvx_port_17);

always@(*)
begin
	rvx_port_11 = 0;
	rvx_signal_23 = 0;
	rvx_port_04 = 1;

	rvx_signal_19 = 0;
	rvx_signal_12 = 0;

	rvx_signal_16 = 0;
	rvx_signal_15 = 0;

	rvx_signal_27 = 0;
	rvx_signal_18 = 0;

	rvx_signal_17 = 0;
	rvx_signal_03 = 0;

	rvx_signal_29 = 0;
	rvx_signal_04 = 0;

	if(rvx_port_08==1'b 1)
	begin
		case(rvx_signal_25)
			`RVX_GDEF_298:
			begin
				rvx_signal_19 = rvx_signal_21;
				rvx_signal_12 = rvx_signal_28;
				rvx_signal_23 = $unsigned(rvx_signal_34);
				rvx_port_04 = rvx_signal_35;
			end
			`RVX_GDEF_198:
			begin
				rvx_signal_16 = rvx_signal_21;
				rvx_signal_15 = rvx_signal_28;
				rvx_signal_23 = $unsigned(rvx_signal_01);
				rvx_port_04 = rvx_signal_37;
			end
			`RVX_GDEF_010:
			begin
				rvx_signal_27 = rvx_signal_21;
				rvx_signal_18 = rvx_signal_28;
				rvx_signal_23 = $unsigned(rvx_signal_00);
				rvx_port_04 = rvx_signal_06;
			end
			`RVX_GDEF_097:
			begin
				rvx_signal_17 = rvx_signal_21;
				rvx_signal_03 = rvx_signal_28;
				rvx_signal_23 = $unsigned(rvx_signal_32);
				rvx_port_04 = rvx_signal_22;
			end
			`RVX_GDEF_256:
			begin
				rvx_signal_29 = rvx_signal_21;
				rvx_signal_04 = rvx_signal_28;
				rvx_signal_23 = $unsigned(rvx_signal_36);
				rvx_port_04 = rvx_signal_11;
			end
			default:
				rvx_port_11 = 1;
		endcase
	end
end

always@(posedge rvx_port_12, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_09 <= `RVX_GDEF_118;
	else if (rvx_signal_15==1'b 1)
		rvx_signal_09 <= rvx_signal_20;
end
assign rvx_signal_01 = rvx_signal_09;
always@(posedge rvx_port_12, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_33 <= `RVX_GDEF_235;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_33 <= rvx_signal_24;
end
assign rvx_signal_32 = rvx_signal_33;
always@(posedge rvx_port_12, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_10 <= `RVX_GDEF_137;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_10 <= rvx_signal_08;
end
assign rvx_signal_36 = rvx_signal_10;
assign rvx_port_10 = rvx_signal_19;
assign rvx_signal_34 = rvx_port_02;
assign rvx_port_03 = rvx_signal_12;
assign rvx_port_00 = rvx_signal_30;
assign rvx_signal_35 = 1;
assign rvx_port_14 = rvx_signal_09;
assign rvx_signal_37 = 1;
assign rvx_port_01 = rvx_signal_18;
assign rvx_signal_00 = 0;
assign rvx_signal_06 = 1;
assign rvx_port_06 = rvx_signal_33;
assign rvx_signal_22 = 1;
assign rvx_port_15 = rvx_signal_10;
assign rvx_signal_11 = 1;

endmodule
