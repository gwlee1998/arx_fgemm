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



module MUNOC_AXI2LPIXS
(
	clk,
	rstnn,
  clear,
  enable,

  rxarid,
	rxaraddr,
	rxarlen,
	rxarsize,
	rxarburst,
	rxarvalid,
	rxarready,

	rxrid,
	rxrdata,
	rxrresp,
	rxrlast,
	rxrvalid,
	rxrready,

	rxawid,
  rxawaddr,
  rxawlen,
  rxawsize,
  rxawburst,
  rxawvalid,
  rxawready,

  rxwid,
  rxwdata,
  rxwstrb,
  rxwlast,
  rxwvalid,
  rxwready,

  rxbid,
  rxbresp,
  rxbvalid,
  rxbready,

  slqdready,
  slqvalid,
  slqhint,
  slqlast,
  slqafy,
  slqdata,

  slydready,
  slyvalid,
  slyhint,
  slylast,
  slydata
);



parameter BW_AXI_ADDR = 32;
parameter BW_AXI_DATA = 32;
parameter BW_AXI_TID = 4;
parameter MEMORY_OPERATION_TYPE = 3;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = BW_AXI_ADDR;
localparam  BW_LPIXS_DATA = BW_AXI_DATA;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(BW_AXI_TID);

`include "lpixs_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [BW_AXI_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [BW_AXI_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [BW_AXI_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [BW_AXI_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [2-1:0] slqdready;
output wire slqvalid;
output wire slqhint;
output wire slqlast;
output wire slqafy;
output wire [BW_LPI_QDATA-1:0] slqdata;

output wire [2-1:0] slydready;
input wire slyvalid;
input wire slyhint;
input wire slylast;
input wire [BW_LPI_YDATA-1:0] slydata;

`include "lpixm_function.vb"

localparam  RVX_LPARA_4 = BW_AXI2LPIXM_BURDEN(BW_AXI_TID);
localparam  RVX_LPARA_1 = BW_LPIXM_QPARCEL(BW_AXI_ADDR,BW_AXI_DATA);
localparam  RVX_LPARA_0 = BW_LPIXM_YPARCEL(BW_AXI_DATA);
localparam  RVX_LPARA_3 = BW_LPI_DATA(RVX_LPARA_4,RVX_LPARA_1);
localparam  RVX_LPARA_2 = BW_LPI_DATA(RVX_LPARA_4,RVX_LPARA_0);

wire [2-1:0] rvx_signal_00;
wire rvx_signal_03;
wire rvx_signal_01;
wire rvx_signal_08;
wire rvx_signal_04;
wire [RVX_LPARA_3-1:0] rvx_signal_02;

wire [2-1:0] rvx_signal_07;
wire rvx_signal_09;
wire rvx_signal_06;
wire rvx_signal_05;
wire [RVX_LPARA_2-1:0] rvx_signal_10;

RVX_MODULE_087
#(
  .RVX_GPARA_0(BW_AXI_ADDR),
  .RVX_GPARA_1(BW_AXI_DATA),
  .RVX_GPARA_2(BW_AXI_TID),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE)
)
i_rvx_instance_1
(
	.rvx_port_42(clk),
	.rvx_port_29(rstnn),
  .rvx_port_03(clear),
  .rvx_port_07(enable),

  .rvx_port_35(rxarid),
	.rvx_port_11(rxaraddr),
	.rvx_port_37(rxarlen),
	.rvx_port_39(rxarsize),
	.rvx_port_36(rxarburst),
	.rvx_port_32(rxarvalid),
	.rvx_port_30(rxarready),

	.rvx_port_34(rxrid),
	.rvx_port_20(rxrdata),
	.rvx_port_18(rxrresp),
	.rvx_port_10(rxrlast),
	.rvx_port_44(rxrvalid),
	.rvx_port_14(rxrready),

	.rvx_port_41(rxawid),
  .rvx_port_38(rxawaddr),
  .rvx_port_15(rxawlen),
  .rvx_port_33(rxawsize),
  .rvx_port_43(rxawburst),
  .rvx_port_23(rxawvalid),
  .rvx_port_22(rxawready),

  .rvx_port_09(rxwid),
  .rvx_port_04(rxwdata),
  .rvx_port_17(rxwstrb),
  .rvx_port_25(rxwlast),
  .rvx_port_24(rxwvalid),
  .rvx_port_27(rxwready),

  .rvx_port_06(rxbid),
  .rvx_port_16(rxbresp),
  .rvx_port_13(rxbvalid),
  .rvx_port_40(rxbready),

  .rvx_port_28(rvx_signal_00),
  .rvx_port_05(rvx_signal_03),
  .rvx_port_19(rvx_signal_01),
  .rvx_port_31(rvx_signal_08),
  .rvx_port_12(rvx_signal_04),
  .rvx_port_21(rvx_signal_02),

  .rvx_port_00(rvx_signal_07),
  .rvx_port_01(rvx_signal_09),
  .rvx_port_26(rvx_signal_06),
  .rvx_port_08(rvx_signal_05),
  .rvx_port_02(rvx_signal_10)
);

RVX_MODULE_088
#(
  .RVX_GPARA_0(BW_AXI_ADDR),
  .RVX_GPARA_1(BW_AXI_DATA),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .BW_LPI_BURDEN(RVX_LPARA_4)
)
i_rvx_instance_0
(
	.rvx_port_15(clk),
	.rvx_port_17(rstnn),
  .rvx_port_05(clear),
  .rvx_port_18(enable),

  .rvx_port_09(rvx_signal_00),
  .rvx_port_24(rvx_signal_03),
  .rvx_port_16(rvx_signal_01),
  .rvx_port_07(rvx_signal_08),
  .rvx_port_04(rvx_signal_04),
  .rvx_port_20(rvx_signal_02),

  .rvx_port_00(rvx_signal_07),
  .rvx_port_25(rvx_signal_09),
  .rvx_port_19(rvx_signal_06),
  .rvx_port_08(rvx_signal_05),
  .rvx_port_06(rvx_signal_10),

  .rvx_port_22(slqdready),
  .rvx_port_03(slqvalid),
  .rvx_port_01(slqhint),
  .rvx_port_12(slqlast),
  .rvx_port_14(slqafy),
  .rvx_port_23(slqdata),

  .rvx_port_21(slydready),
  .rvx_port_11(slyvalid),
  .rvx_port_10(slyhint),
  .rvx_port_02(slylast),
  .rvx_port_13(slydata)
);

endmodule
