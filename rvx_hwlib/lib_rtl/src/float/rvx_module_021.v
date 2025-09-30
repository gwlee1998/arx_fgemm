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
`include "fpir_define.vh"




module RVX_MODULE_021
(
	rvx_port_1,
  rvx_port_2,
  rvx_port_3,
  rvx_port_0,

  rvx_port_7,
  rvx_port_4,
  rvx_port_8,
  rvx_port_6,

  rvx_port_5
);




`include "rvx_include_11.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_0 = BW_SIGNIFICAND_EXTENDED+1;

localparam  RVX_LPARA_0 = 0; 

input wire [BW_FPIR_VALUE-1:0] rvx_port_1;
input wire [BW_FPIR_VALUE-1:0] rvx_port_2;
input wire rvx_port_3;
input wire rvx_port_0;

output wire [RVX_GPARA_0-1:0] rvx_port_7;
output wire [RVX_GPARA_0-1:0] rvx_port_4;
output wire rvx_port_8;
input wire [RVX_GPARA_0-1:0] rvx_port_6;

output wire [BW_EXPONENT_EXTENDED-1:0] rvx_port_5;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_02;
wire rvx_signal_03;
wire [BW_EXPONENT-1:0] rvx_signal_10;
wire [BW_SIGNIFICAND-1:0] rvx_signal_12;
wire [BW_GUARD-1:0] rvx_signal_00;
wire [BW_OVERFLOW-1:0] rvx_signal_04;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_11;
wire rvx_signal_06;
wire [BW_EXPONENT-1:0] rvx_signal_07;
wire [BW_SIGNIFICAND-1:0] rvx_signal_01;
wire [BW_GUARD-1:0] rvx_signal_08;
wire [BW_OVERFLOW-1:0] rvx_signal_09;

wire [BW_EXPONENT-1:0] rvx_signal_05;

assign {rvx_signal_02, rvx_signal_03, rvx_signal_10, rvx_signal_12, rvx_signal_00, rvx_signal_04} = rvx_port_1;
assign {rvx_signal_11, rvx_signal_06, rvx_signal_07, rvx_signal_01, rvx_signal_08, rvx_signal_09} = rvx_port_2;

assign rvx_signal_05 = rvx_port_3? (~rvx_signal_07) : rvx_signal_07;

assign rvx_port_7 = $signed(rvx_signal_10);
assign rvx_port_4 = $signed(rvx_signal_05);
assign rvx_port_8 = rvx_port_0;

assign rvx_port_5 = rvx_port_6;

endmodule
