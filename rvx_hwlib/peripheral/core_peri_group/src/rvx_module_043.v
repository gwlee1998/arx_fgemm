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
`include "rvx_include_16.vh"




module RVX_MODULE_043
(
	rvx_port_13,
	rvx_port_09,

	rvx_port_02,
	rvx_port_08,
	rvx_port_15,
	rvx_port_04,
	rvx_port_11,
	rvx_port_03,
	rvx_port_01,
	rvx_port_12,

	rvx_port_06,
	rvx_port_00,
	rvx_port_17,
	rvx_port_10,
	rvx_port_05,
	rvx_port_16,
	rvx_port_07,
	rvx_port_14
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_13, rvx_port_09;
input wire rvx_port_02;
input wire rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_15;
input wire rvx_port_04;
input wire [RVX_GPARA_2-1:0] rvx_port_11;
output wire [RVX_GPARA_2-1:0] rvx_port_03;
output reg rvx_port_01;
output reg rvx_port_12;

input wire rvx_port_06;

output wire rvx_port_00;
input wire [`RVX_GDEF_309-1:0] rvx_port_17;

output wire rvx_port_10;
output wire [`RVX_GDEF_030-1:0] rvx_port_05;

output wire rvx_port_16;
input wire [`RVX_GDEF_120-1:0] rvx_port_07;
input wire rvx_port_14;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_18;
reg [RVX_GPARA_2-1:0] rvx_signal_14;
wire rvx_signal_12;
wire rvx_signal_04;
wire rvx_signal_06;

wire [`RVX_GDEF_389-1:0] paddr_offset = rvx_port_15;
wire [`RVX_GDEF_389-1:0] rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_17;
wire [`RVX_GDEF_184-1:0] rvx_signal_07;
wire [`RVX_GDEF_184-1:0] addr_unused = 0;
reg rvx_signal_20;
wire [RVX_GPARA_2-1:0] rvx_signal_13;
reg rvx_signal_16;
wire [RVX_GPARA_2-1:0] rvx_signal_22;
wire rvx_signal_24;
reg rvx_signal_05;
wire [RVX_GPARA_2-1:0] rvx_signal_23;
reg rvx_signal_09;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
wire rvx_signal_00;
reg rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_10;
reg rvx_signal_03;
wire [RVX_GPARA_2-1:0] rvx_signal_11;
wire rvx_signal_08;

assign rvx_signal_18 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_11);
assign rvx_port_03 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_14);
assign {rvx_signal_17,rvx_signal_07} = paddr_offset;
assign rvx_signal_01 = {rvx_signal_17,addr_unused};
assign rvx_signal_06 = (rvx_signal_07==0);
assign rvx_signal_12 = rvx_port_02 & rvx_port_08 & rvx_signal_06 & (~rvx_port_04);
assign rvx_signal_04 = rvx_port_02 & rvx_port_08 & rvx_signal_06 & rvx_port_04;

assign rvx_signal_22 = $unsigned(rvx_port_11);
assign rvx_signal_19 = $unsigned(rvx_port_11);
assign rvx_signal_11 = $unsigned(rvx_port_11);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_14 = 0;
	rvx_port_01 = 1;

	rvx_signal_20 = 0;
	rvx_signal_16 = 0;

	rvx_signal_05 = 0;
	rvx_signal_09 = 0;

	rvx_signal_15 = 0;
	rvx_signal_03 = 0;

	if(rvx_port_02==1'b 1)
	begin
		case(rvx_signal_01)
			`RVX_GDEF_170:
			begin
				rvx_signal_20 = rvx_signal_12;
				rvx_signal_16 = rvx_signal_04;
				rvx_signal_14 = $unsigned(rvx_signal_13);
				rvx_port_01 = rvx_signal_24;
			end
			`RVX_GDEF_236:
			begin
				rvx_signal_05 = rvx_signal_12;
				rvx_signal_09 = rvx_signal_04;
				rvx_signal_14 = $unsigned(rvx_signal_23);
				rvx_port_01 = rvx_signal_00;
			end
			`RVX_GDEF_407:
			begin
				rvx_signal_15 = rvx_signal_12;
				rvx_signal_03 = rvx_signal_04;
				rvx_signal_14 = $unsigned(rvx_signal_10);
				rvx_port_01 = rvx_signal_08;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

assign rvx_port_00 = rvx_signal_20;
assign rvx_signal_13 = rvx_port_17;
assign rvx_signal_24 = 1;
assign rvx_signal_23 = 0;
assign rvx_port_10 = rvx_signal_09;
assign rvx_port_05 = rvx_signal_19;
assign rvx_signal_00 = 1;
assign rvx_port_16 = rvx_signal_15;
assign rvx_signal_10 = rvx_port_07;
assign rvx_signal_08 = rvx_port_14;

endmodule
