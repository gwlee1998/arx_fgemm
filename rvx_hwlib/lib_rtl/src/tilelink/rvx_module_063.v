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
`include "rvx_include_15.vh"
`include "ervp_axi_define.vh"




module RVX_MODULE_063 (
	rvx_port_03,
	rvx_port_28,

	rvx_port_07,
	rvx_port_14,
	rvx_port_08,
	rvx_port_25,
	rvx_port_40,
	rvx_port_18,
	rvx_port_26,
	rvx_port_09,

	rvx_port_41,
	rvx_port_30,
	rvx_port_36,
	rvx_port_35,
	rvx_port_43,
	rvx_port_12,
	rvx_port_29,
	rvx_port_22,
	rvx_port_13,

	rvx_port_19,
	rvx_port_47,
	rvx_port_01,
	rvx_port_17,
	rvx_port_42,
	rvx_port_20,
	rvx_port_49,
	rvx_port_32,
	rvx_port_38,

	rvx_port_24,
	rvx_port_23,
	rvx_port_00,
	rvx_port_04,
	rvx_port_44,
	rvx_port_45,
	rvx_port_31,
	rvx_port_21,
	rvx_port_27,

	rvx_port_05,
	rvx_port_06,
	rvx_port_16,
	rvx_port_48,
	rvx_port_46,
	rvx_port_11,
	rvx_port_33,
	rvx_port_10,
	rvx_port_39,
	rvx_port_15,

	rvx_port_02,
	rvx_port_34,
	rvx_port_37
);




parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_6 = 1;
parameter RVX_GPARA_5 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_4 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;

parameter RVX_GPARA_7 = 0;
parameter RVX_GPARA_8 = 16;

input wire rvx_port_03, rvx_port_28;

input wire rvx_port_07;
input wire rvx_port_14;
input wire [RVX_GPARA_3-1:0] rvx_port_08;
input wire rvx_port_25;
input wire [RVX_GPARA_6-1:0] rvx_port_40;
output wire [RVX_GPARA_6-1:0] rvx_port_18;
output wire rvx_port_26;
output wire rvx_port_09;

input wire rvx_port_41;
output wire rvx_port_30;
output wire [2:0] rvx_port_36;
output wire [2:0] rvx_port_35;
output wire [RVX_GPARA_1-1:0] rvx_port_43;
output wire [RVX_GPARA_4-1:0] rvx_port_12;
output reg [RVX_GPARA_5-1:0] rvx_port_29;
output wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_port_22;
output wire [RVX_GPARA_0-1:0] rvx_port_13;

output wire rvx_port_19;
input wire rvx_port_47;
input wire [2:0] rvx_port_01;
input wire [1:0] rvx_port_17;
input wire [RVX_GPARA_1-1:0] rvx_port_42;
input wire [RVX_GPARA_4-1:0] rvx_port_20;
input wire [RVX_GPARA_5-1:0] rvx_port_49;
input wire [`BW_AXI_WSTRB(RVX_GPARA_0)-1:0] rvx_port_32;
input wire [RVX_GPARA_0-1:0] rvx_port_38;

input wire rvx_port_24;
output wire rvx_port_23;
output wire [2:0] rvx_port_00;
output wire [2:0] rvx_port_04;
output wire [RVX_GPARA_1-1:0] rvx_port_44;
output wire [RVX_GPARA_4-1:0] rvx_port_45;
output wire [RVX_GPARA_5-1:0] rvx_port_31;
output wire [RVX_GPARA_0-1:0] rvx_port_21;
output wire rvx_port_27;

output wire rvx_port_05;
input wire rvx_port_06;
input wire [2:0] rvx_port_16;
input wire [1:0] rvx_port_48;
input wire [RVX_GPARA_1-1:0] rvx_port_46;
input wire [RVX_GPARA_4-1:0] rvx_port_11;
input wire rvx_port_33;
input wire [RVX_GPARA_2-1:0] rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_39;
input wire rvx_port_15;

input wire rvx_port_02;
output wire rvx_port_34;
output wire rvx_port_37;

genvar i;

`define RVX_LDEF_3 2
`define RVX_LDEF_2 0
`define RVX_LDEF_1 1
`define RVX_LDEF_0 2

reg [`RVX_LDEF_3-1:0] rvx_signal_4;
wire rvx_signal_0;
wire rvx_signal_3;
wire rvx_signal_1;

wire [`BW_AXI_WSTRB(RVX_GPARA_6)-1:0] rvx_signal_2;

always@(posedge rvx_port_03, negedge rvx_port_28)
begin
	if(rvx_port_28==0)
		rvx_signal_4 <= `RVX_LDEF_2;
	else
		case(rvx_signal_4)
			`RVX_LDEF_2:
				if(rvx_signal_0)
					rvx_signal_4 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
				if(rvx_signal_3)
				begin
					if(rvx_signal_1)
						rvx_signal_4 <= `RVX_LDEF_2;
					else
						rvx_signal_4 <= `RVX_LDEF_0;
				end
			`RVX_LDEF_0:
				if(rvx_signal_1)
					rvx_signal_4 <= `RVX_LDEF_2;
		endcase
end

assign rvx_signal_0 = (rvx_signal_4==`RVX_LDEF_2) & rvx_port_07 & rvx_port_14;
assign rvx_signal_3 = rvx_port_30 & rvx_port_41;
assign rvx_signal_1 = rvx_port_06 & rvx_port_05;

assign rvx_port_30 = (rvx_signal_4==`RVX_LDEF_1);
assign rvx_port_36 = (rvx_port_25==1)? `RVX_GDEF_197 : `RVX_GDEF_037;
assign rvx_port_35 = 0;
assign rvx_port_43 = `GET_AXI_SIZE(RVX_GPARA_6);
assign rvx_port_12 = 0;
always@(*)
begin
	rvx_port_29 = RVX_GPARA_7;
	rvx_port_29[RVX_GPARA_8-1:0] = rvx_port_08[RVX_GPARA_8-1:0];
end

assign rvx_signal_2 = -1;
assign rvx_port_22 = $unsigned(rvx_signal_2);
assign rvx_port_13 = $unsigned(rvx_port_40);

assign rvx_port_05 = (rvx_signal_4==`RVX_LDEF_1) | (rvx_signal_4==`RVX_LDEF_0);
assign rvx_port_18 = $unsigned(rvx_port_39);
assign rvx_port_26 = rvx_signal_1;
assign rvx_port_09 = rvx_port_15;

assign rvx_port_19 = 0;

assign rvx_port_23 = 0;
assign rvx_port_00 = 0;
assign rvx_port_04 = 0;
assign rvx_port_44 = 0;
assign rvx_port_45 = 0;
assign rvx_port_31 = 0;
assign rvx_port_21 = 0;
assign rvx_port_27 = 0;

assign rvx_port_34 = 0;
assign rvx_port_37 = 0;

`undef RVX_LDEF_3
`undef RVX_LDEF_2
`undef RVX_LDEF_1
`undef RVX_LDEF_0
endmodule
