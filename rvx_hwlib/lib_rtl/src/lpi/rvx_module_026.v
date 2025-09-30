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
`include "ervp_axi_define.vh"





module RVX_MODULE_026
(
  rvx_port_21,
  rvx_port_02,
  rvx_port_11,
  rvx_port_04,

  rvx_port_08,
  rvx_port_16,
  rvx_port_13,
  rvx_port_18,
  rvx_port_14,
  rvx_port_01,

  rvx_port_12,
  rvx_port_17,
  rvx_port_10,
  rvx_port_07,
  rvx_port_09,

  rvx_port_05,
  rvx_port_25,
  rvx_port_19,
  rvx_port_06,
  rvx_port_15,
  rvx_port_22,

  rvx_port_24,
  rvx_port_20,
  rvx_port_00,
  rvx_port_23,
  rvx_port_03
);





parameter BW_LPI_BURDEN = 32;
parameter BW_LPI_QPARCEL = 32;
parameter BW_LPI_YPARCEL = 4;
parameter RVX_GPARA_0 = 4;

`include "lpit_function.vb"
`include "lpig_lpara.vb"

input wire rvx_port_21;
input wire rvx_port_02;
input wire rvx_port_11;
input wire rvx_port_04;

output wire [2-1:0] rvx_port_08;
input wire rvx_port_16;
input wire rvx_port_13;
input wire rvx_port_18;
input wire rvx_port_14;
input wire [BW_LPI_QDATA-1:0] rvx_port_01;

input wire [2-1:0] rvx_port_12;
output wire rvx_port_10;
output wire rvx_port_17;
output wire rvx_port_07;
output wire [BW_LPI_YDATA-1:0] rvx_port_09;

input wire [2-1:0] rvx_port_05;
output wire rvx_port_25;
output wire rvx_port_19;
output wire rvx_port_06;
output wire rvx_port_15;
output wire [BW_LPI_QDATA-1:0] rvx_port_22;

output wire [2-1:0] rvx_port_24;
input wire rvx_port_20;
input wire rvx_port_00;
input wire rvx_port_23;
input wire [BW_LPI_YDATA-1:0] rvx_port_03;

localparam  RVX_LPARA_1 = 1 + BW_LPI_YPARCEL;

wire [2-1:0] rvx_signal_12;
wire rvx_signal_13;
wire [RVX_LPARA_1-1:0] rvx_signal_11;
wire rvx_signal_08;
wire rvx_signal_00;
wire [RVX_LPARA_1-1:0] rvx_signal_03;

localparam  RVX_LPARA_0 = BW_LPI_BURDEN_NZ;

wire [2-1:0] rvx_signal_02;
wire rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_07;
wire rvx_signal_05;
wire rvx_signal_15;
wire [RVX_LPARA_0-1:0] rvx_signal_09;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_10;
wire [BW_LPI_YPARCEL-1:0] rvx_signal_01;

wire [2-1:0] rvx_signal_14;
wire rvx_signal_04;

assign rvx_port_08 = rvx_signal_14 & rvx_port_05;
assign rvx_port_25 = rvx_signal_14[0] & rvx_port_16;
assign rvx_port_19 = rvx_port_13;
assign rvx_port_06 = rvx_port_18;
assign rvx_port_15 = rvx_port_14;
assign rvx_port_22 = rvx_port_01;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_GPARA_0),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_02),
	.enable(rvx_port_04 & HAS_LPI_BURDEN),
  .clear(rvx_port_11),
	.wready(rvx_signal_02),
	.wrequest(rvx_signal_06),
	.wdata(rvx_signal_07),
	.wfull(),
  .wnum(),
	.rready(rvx_signal_05),
	.rrequest(rvx_signal_15),
	.rdata(rvx_signal_09),
	.rempty(),
	.rnum()
);

assign rvx_signal_06 = rvx_port_16 & rvx_port_08[0] & rvx_port_18 & rvx_port_14;
assign rvx_signal_07 = rvx_port_01[BW_LPI_QDATA-1-:BW_LPI_BURDEN_NZ];
assign rvx_signal_15 = rvx_port_10 & rvx_port_12[0] & rvx_port_07;

assign rvx_signal_14 = HAS_LPI_BURDEN? rvx_signal_02 : `ALL_ONE;
assign rvx_signal_04 = HAS_LPI_BURDEN? rvx_signal_05 : `ALL_ONE;

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_1
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_02),
	.enable(rvx_port_04),
  .clear(rvx_port_11),
	.wready(rvx_signal_12),
	.wrequest(rvx_signal_13),
	.wdata(rvx_signal_11),
	.wfull(),
	.rready(rvx_signal_08),
	.rrequest(rvx_signal_00),
	.rdata(rvx_signal_03),
	.rempty()
);

assign rvx_signal_13 = rvx_port_20;
assign rvx_signal_11 = {rvx_port_23, rvx_port_03[BW_LPI_YPARCEL-1:0]};
assign rvx_signal_00 = rvx_port_10 & rvx_port_12[0];

assign rvx_port_24 = rvx_signal_12;

assign rvx_port_10 = rvx_signal_04 & rvx_signal_08;
assign rvx_port_17 = 0;
assign rvx_port_09 = {rvx_signal_10,rvx_signal_01};
assign {rvx_port_07,rvx_signal_01} = rvx_signal_03;
assign rvx_signal_10 = rvx_signal_09;

endmodule
