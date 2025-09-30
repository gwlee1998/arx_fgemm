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





module RVX_MODULE_087
(
	rvx_port_42,
	rvx_port_29,
  rvx_port_03,
  rvx_port_07,

  rvx_port_35,
	rvx_port_11,
	rvx_port_37,
	rvx_port_39,
	rvx_port_36,
	rvx_port_32,
	rvx_port_30,

	rvx_port_34,
	rvx_port_20,
	rvx_port_18,
	rvx_port_10,
	rvx_port_44,
	rvx_port_14,

	rvx_port_41,
  rvx_port_38,
  rvx_port_15,
  rvx_port_33,
  rvx_port_43,
  rvx_port_23,
  rvx_port_22,

  rvx_port_09,
  rvx_port_04,
  rvx_port_17,
  rvx_port_25,
  rvx_port_24,
  rvx_port_27,

  rvx_port_06,
  rvx_port_16,
  rvx_port_13,
  rvx_port_40,

  rvx_port_28,
  rvx_port_05,
  rvx_port_19,
  rvx_port_31,
  rvx_port_12,
  rvx_port_21,

  rvx_port_00,
  rvx_port_01,
  rvx_port_26,
  rvx_port_08,
  rvx_port_02
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 4;
parameter MEMORY_OPERATION_TYPE = 3;

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = RVX_GPARA_0;
localparam  BW_LPIXM_DATA = RVX_GPARA_1;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXM_BURDEN(RVX_GPARA_2);

`include "lpixm_lpara.vb"

input wire rvx_port_42;
input wire rvx_port_29;
input wire rvx_port_03;
input wire rvx_port_07;

input wire [RVX_GPARA_2-1:0] rvx_port_35;
input wire [RVX_GPARA_0-1:0] rvx_port_11;
input wire [`BW_AXI_ALEN-1:0] rvx_port_37;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_39;
input wire [`BW_AXI_ABURST-1:0] rvx_port_36;
input wire rvx_port_32;
output wire rvx_port_30;

output wire [RVX_GPARA_2-1:0] rvx_port_34;
output wire [RVX_GPARA_1-1:0] rvx_port_20;
output wire [`BW_AXI_RRESP-1:0] rvx_port_18;
output wire rvx_port_10;
output wire rvx_port_44;
input wire rvx_port_14;

input wire [RVX_GPARA_2-1:0] rvx_port_41;
input wire [RVX_GPARA_0-1:0] rvx_port_38;
input wire [`BW_AXI_ALEN-1:0] rvx_port_15;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_33;
input wire [`BW_AXI_ABURST-1:0] rvx_port_43;
input wire rvx_port_23;
output wire rvx_port_22;

input wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire [RVX_GPARA_1-1:0] rvx_port_04;
input wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_17;
input wire rvx_port_25;
input wire rvx_port_24;
output wire rvx_port_27;

output wire [RVX_GPARA_2-1:0] rvx_port_06;
output wire [`BW_AXI_BRESP-1:0] rvx_port_16;
output wire rvx_port_13;
input wire rvx_port_40;

input wire [2-1:0] rvx_port_28;
output wire rvx_port_05;
output wire rvx_port_19;
output wire rvx_port_31;
output wire rvx_port_12;
output wire [BW_LPI_QDATA-1:0] rvx_port_21;

output wire [2-1:0] rvx_port_00;
input wire rvx_port_01;
input wire rvx_port_26;
input wire rvx_port_08;
input wire [BW_LPI_YDATA-1:0] rvx_port_02;

`include "motype_lpara.vb"

localparam  RVX_LPARA_0 = 2;

wire [RVX_LPARA_0-1:0] rvx_signal_13;
wire [RVX_LPARA_0-1:0] rvx_signal_14;
wire [RVX_LPARA_0-1:0] rvx_signal_25;
wire [RVX_LPARA_0-1:0] rvx_signal_22;
wire [RVX_LPARA_0-1:0] rvx_signal_02;
wire rvx_signal_17;
wire rvx_signal_27;
wire rvx_signal_23;

localparam  RVX_LPARA_1 = 0;
localparam  RVX_LPARA_2 = 1;

wire rvx_signal_01;
wire rvx_signal_12;

wire [RVX_GPARA_2-1:0] rvx_signal_21;
wire rvx_signal_07;
wire [`BW_AXI_ALEN-1:0] rvx_signal_03;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_05;
wire [`BW_AXI_ABURST-1:0] rvx_signal_00;
wire [RVX_GPARA_0-1:0] rvx_signal_08;
wire [`NUM_BYTE(RVX_GPARA_1)-1:0] rvx_signal_09;
wire [RVX_GPARA_1-1:0] rvx_signal_11;

localparam  RVX_LPARA_3 = 1 + BW_LPI_YDATA;

wire [2-1:0] rvx_signal_26;
wire rvx_signal_04;
wire [RVX_LPARA_3-1:0] rvx_signal_10;
wire rvx_signal_28;
wire rvx_signal_16;
wire [RVX_LPARA_3-1:0] rvx_signal_20;

wire rvx_signal_19;
wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire rvx_signal_24;
wire [`BW_AXI_RESP-1:0] rvx_signal_18;
wire [RVX_GPARA_1-1:0] rvx_signal_15;

ERVP_GRANTER
#(
  .NUM_CANDIDATE(RVX_LPARA_0)
)
i_rvx_instance_1
(
  .clk(rvx_port_42),
  .rstnn(rvx_port_29),
  .clear(rvx_port_03),
  .enable(rvx_port_07),
  .candidate_ready_list(rvx_signal_13),
  .candidate_hint_list(rvx_signal_14),
  .candidate_valid_list(rvx_signal_25),
  .candidate_last_list(rvx_signal_22),
  .grant_list(rvx_signal_02),
  .granted_ready(rvx_signal_17),
  .granted_valid(rvx_signal_27),
  .granted_last(rvx_signal_23)
);

assign rvx_signal_17 = rvx_port_28[0];

assign rvx_signal_14[RVX_LPARA_1] = 0;
assign rvx_signal_25[RVX_LPARA_1] = READ_SUPPORTED & rvx_port_32;
assign rvx_signal_22[RVX_LPARA_1] = 1;
assign rvx_signal_14[RVX_LPARA_2] = WRITE_SUPPORTED & (rvx_port_23 ^ rvx_port_24);
assign rvx_signal_25[RVX_LPARA_2] = WRITE_SUPPORTED & rvx_port_23 & rvx_port_24;
assign rvx_signal_22[RVX_LPARA_2] = rvx_port_25;

assign rvx_signal_01 = rvx_signal_02[RVX_LPARA_1];
assign rvx_signal_12 = ~rvx_signal_01;

assign rvx_port_05 = rvx_signal_27;
assign rvx_port_19 = 0;
assign rvx_port_31 = rvx_signal_01? 1 : rvx_port_25;
assign rvx_port_12 = rvx_signal_01 | (rvx_signal_12 & rvx_signal_23);

assign rvx_port_21 = {rvx_signal_21,rvx_signal_07,rvx_signal_03,rvx_signal_05,rvx_signal_00,rvx_signal_09,rvx_signal_11,rvx_signal_08};
assign rvx_signal_21 = rvx_signal_01? rvx_port_35 : rvx_port_41;
assign rvx_signal_07 = rvx_signal_12;
assign rvx_signal_03 = rvx_signal_01? rvx_port_37 : rvx_port_15;
assign rvx_signal_05 = rvx_signal_01? rvx_port_39 : rvx_port_33;
assign rvx_signal_00 = rvx_signal_01? rvx_port_36 : rvx_port_43;
assign rvx_signal_09 = rvx_port_17;
assign rvx_signal_11 = rvx_port_04;
assign rvx_signal_08 = rvx_signal_01? rvx_port_11 : rvx_port_38;

assign rvx_port_30 = rvx_signal_13[RVX_LPARA_1];
assign rvx_port_22 = rvx_signal_13[RVX_LPARA_2] & rvx_port_24 & rvx_port_25;
assign rvx_port_27 = rvx_signal_13[RVX_LPARA_2];

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_3),
	.DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_42),
	.rstnn(rvx_port_29),
	.enable(rvx_port_07),
  .clear(rvx_port_03),
	.wready(rvx_signal_26),
	.wrequest(rvx_signal_04),
	.wdata(rvx_signal_10),
	.wfull(),
	.rready(rvx_signal_28),
	.rrequest(rvx_signal_16),
	.rdata(rvx_signal_20),
	.rempty()
);

assign rvx_port_00 = rvx_signal_26;
assign rvx_signal_04 = rvx_port_01;
assign rvx_signal_10 = {rvx_port_08,rvx_port_02};
assign rvx_signal_16 = (rvx_port_13&rvx_port_40) | (rvx_port_44&rvx_port_14);

assign {rvx_signal_19,rvx_signal_06,rvx_signal_24,rvx_signal_18,rvx_signal_15} = rvx_signal_20;

assign rvx_port_06 = rvx_signal_06;
assign rvx_port_16 = rvx_signal_18;
assign rvx_port_13 = rvx_signal_28 & rvx_signal_24; 

assign rvx_port_34 = rvx_signal_06;
assign rvx_port_20 = rvx_signal_15;
assign rvx_port_18 = rvx_signal_18;
assign rvx_port_10 = rvx_signal_19;
assign rvx_port_44 = rvx_signal_28 & (~rvx_signal_24);

endmodule
