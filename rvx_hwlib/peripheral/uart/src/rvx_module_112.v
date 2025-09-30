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


`include "ervp_uart_defines.vh"




module RVX_MODULE_112
(
	rvx_port_05,
	rvx_port_17,
	rvx_port_12,
	rvx_port_10,
	rvx_port_15,
	rvx_port_16,
	rvx_port_09,
	rvx_port_03,
	rvx_port_18,
	rvx_port_08,

	rvx_port_07,
	rvx_port_19,
	rvx_port_06,

	rvx_port_14,
	rvx_port_13,
	rvx_port_02,
	rvx_port_11,
	rvx_port_00,
	rvx_port_04,
	rvx_port_01
);




input wire rvx_port_05;
input wire rvx_port_17;

input wire [31:0] rvx_port_12;
input wire rvx_port_10;
input wire rvx_port_15;
input wire rvx_port_16;
output wire [31:0] rvx_port_09;
input wire [31:0] rvx_port_03;
output wire rvx_port_18;
output wire rvx_port_08;
output wire rvx_port_07;

input wire rvx_port_19;
output wire rvx_port_06;

output wire rvx_port_14;
input wire rvx_port_13;
output wire rvx_port_02;
input wire rvx_port_11;
input wire rvx_port_00;
input wire rvx_port_04;
output wire rvx_port_01;

wire [7:0] rvx_signal_2;
wire [7:0] rvx_signal_1;

wire	eu_uart_wen = rvx_port_10 && (rvx_port_16 == 1) && rvx_port_15;
wire	eu_uart_ren = rvx_port_10 && (rvx_port_16 == 0) && rvx_port_15;

RVX_MODULE_100	i_rvx_instance_0(
	.rvx_port_12(rvx_port_05),
	.rvx_port_07(rvx_port_17),
	.rvx_port_13(rvx_port_12[`BW_UART_REG_INDEX-1:0]),
	.rvx_port_02(rvx_signal_2),
	.rvx_port_06(rvx_signal_1),
	.rvx_port_00(eu_uart_wen),
	.rvx_port_03(eu_uart_ren),

	.rvx_port_05(rvx_port_06),
	.rvx_port_01(rvx_port_19),

	.rvx_port_09({rvx_port_13, rvx_port_11, rvx_port_00,  rvx_port_04}),
	.rvx_port_10(rvx_port_14),
	.rvx_port_08(rvx_port_02),
	.rvx_port_04(rvx_port_07), 
	.rvx_port_11(rvx_port_01)

);

assign rvx_signal_2 = rvx_port_03;
assign rvx_port_09 = $unsigned(rvx_signal_1);

	
	
	
	

assign rvx_port_18 = 1;
assign rvx_port_08 = 0;

endmodule

