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
`include "rvx_include_21.vh"




module RVX_MODULE_126
(
	rvx_port_16,
	rvx_port_04,

	rvx_port_01,
	rvx_port_15,
	rvx_port_07,
	rvx_port_09,
	rvx_port_14,
	rvx_port_03,
	rvx_port_05,
	rvx_port_10,

	rvx_port_00,
	rvx_port_08,
	rvx_port_13,
	rvx_port_12,
	rvx_port_02,
	rvx_port_06,
	rvx_port_11
);




parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_16, rvx_port_04;
input wire rvx_port_01;
input wire rvx_port_15;
input wire [RVX_GPARA_3-1:0] rvx_port_07;
input wire rvx_port_09;
input wire [RVX_GPARA_1-1:0] rvx_port_14;
output wire [RVX_GPARA_1-1:0] rvx_port_03;
output reg rvx_port_05;
output reg rvx_port_10;

parameter RVX_GPARA_4 = 0;
parameter RVX_GPARA_2 = 0;

input wire rvx_port_00;

output wire rvx_port_08;
input wire [8-1:0] rvx_port_13;
output wire rvx_port_12;
output wire [8-1:0] rvx_port_02;

output wire [11-1:0] rvx_port_06;

output wire [11-1:0] rvx_port_11;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_25;
reg [RVX_GPARA_1-1:0] rvx_signal_12;
wire rvx_signal_13;
wire rvx_signal_01;
wire rvx_signal_08;

wire [`RVX_GDEF_171-1:0] paddr_offset = rvx_port_07;
wire [`RVX_GDEF_171-1:0] rvx_signal_20;
wire [RVX_GPARA_3-1:0] rvx_signal_26;
wire [`RVX_GDEF_341-1:0] rvx_signal_17;
wire [`RVX_GDEF_341-1:0] addr_unused = 0;
reg rvx_signal_09;
wire [8-1:0] rvx_signal_22;
reg rvx_signal_03;
wire [8-1:0] rvx_signal_16;
wire rvx_signal_19;
reg rvx_signal_23;
wire [11-1:0] rvx_signal_11;
reg rvx_signal_04;
wire [11-1:0] rvx_signal_15;
wire rvx_signal_24;
reg [11-1:0] rvx_signal_02;
reg rvx_signal_10;
wire [11-1:0] rvx_signal_18;
reg rvx_signal_06;
wire [11-1:0] rvx_signal_14;
wire rvx_signal_00;
reg [11-1:0] rvx_signal_21;

assign rvx_signal_25 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_14);
assign rvx_port_03 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_12);
assign {rvx_signal_26,rvx_signal_17} = paddr_offset;
assign rvx_signal_20 = {rvx_signal_26,addr_unused};
assign rvx_signal_08 = (rvx_signal_17==0);
assign rvx_signal_13 = rvx_port_01 & rvx_port_15 & rvx_signal_08 & (~rvx_port_09);
assign rvx_signal_01 = rvx_port_01 & rvx_port_15 & rvx_signal_08 & rvx_port_09;

assign rvx_signal_16 = $unsigned(rvx_port_14);
assign rvx_signal_15 = $unsigned(rvx_port_14);
assign rvx_signal_14 = $unsigned(rvx_port_14);

always@(*)
begin
	rvx_port_10 = 0;
	rvx_signal_12 = 0;
	rvx_port_05 = 1;

	rvx_signal_09 = 0;
	rvx_signal_03 = 0;

	rvx_signal_23 = 0;
	rvx_signal_04 = 0;

	rvx_signal_10 = 0;
	rvx_signal_06 = 0;

	if(rvx_port_01==1'b 1)
	begin
		case(rvx_signal_20)
			`RVX_GDEF_257:
			begin
				rvx_signal_09 = rvx_signal_13;
				rvx_signal_03 = rvx_signal_01;
				rvx_signal_12 = $unsigned(rvx_signal_22);
				rvx_port_05 = rvx_signal_19;
			end
			`RVX_GDEF_138:
			begin
				rvx_signal_23 = rvx_signal_13;
				rvx_signal_04 = rvx_signal_01;
				rvx_signal_12 = $unsigned(rvx_signal_11);
				rvx_port_05 = rvx_signal_24;
			end
			`RVX_GDEF_033:
			begin
				rvx_signal_10 = rvx_signal_13;
				rvx_signal_06 = rvx_signal_01;
				rvx_signal_12 = $unsigned(rvx_signal_18);
				rvx_port_05 = rvx_signal_00;
			end
			default:
				rvx_port_10 = 1;
		endcase
	end
end

always@(posedge rvx_port_16, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_02 <= RVX_GPARA_4;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_02 <= rvx_signal_15;
end
assign rvx_signal_11 = rvx_signal_02;
always@(posedge rvx_port_16, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_21 <= RVX_GPARA_2;
	else if (rvx_signal_06==1'b 1)
		rvx_signal_21 <= rvx_signal_14;
end
assign rvx_signal_18 = rvx_signal_21;
assign rvx_port_08 = rvx_signal_09;
assign rvx_signal_22 = rvx_port_13;
assign rvx_port_12 = rvx_signal_03;
assign rvx_port_02 = rvx_signal_16;
assign rvx_signal_19 = 1;
assign rvx_port_06 = rvx_signal_02;
assign rvx_signal_24 = 1;
assign rvx_port_11 = rvx_signal_21;
assign rvx_signal_00 = 1;

endmodule
