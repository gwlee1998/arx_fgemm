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


module ERVP_SPSRAM_CONTROLLER_AXI
(
	clk,
	rstnn,
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

  sscell_select_list,
	sscell_index_list,
	sscell_enable_list,
	sscell_wenable_list,
	sscell_wenable_byte_list,
	sscell_wenable_bit_list,
	sscell_wdata_list,
	sscell_renable_list,
	sscell_rdata_list,
  sscell_stall_list
);


parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_AXI_TID = 4;
parameter MEMORY_OPERATION_TYPE = 3;
parameter BASEADDR = 0;

parameter CELL_SIZE = 65536; 
parameter CELL_WIDTH = BW_DATA;
parameter NUM_CELL = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = BW_ADDR;
localparam  RVX_LPARA_1 = BW_DATA;

localparam  RVX_LPARA_3 = `NUM_BYTE(CELL_WIDTH);
localparam  RVX_LPARA_2 = `DIVIDERU(CELL_SIZE,`NUM_BYTE(CELL_WIDTH));
localparam  RVX_LPARA_4 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_2);

input wire clk;
input wire rstnn;
input wire enable;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [RVX_LPARA_0-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [RVX_LPARA_1-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire rxrlast;
output wire rxrvalid;
input wire rxrready;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [RVX_LPARA_0-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [RVX_LPARA_1-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(RVX_LPARA_1)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

output wire [NUM_CELL-1:0] sscell_select_list;
output wire [RVX_LPARA_4*NUM_CELL-1:0] sscell_index_list;
output wire [NUM_CELL-1:0] sscell_enable_list;
output wire [NUM_CELL-1:0] sscell_wenable_list;
output wire [RVX_LPARA_3*NUM_CELL-1:0] sscell_wenable_byte_list;
output wire [CELL_WIDTH*NUM_CELL-1:0] sscell_wenable_bit_list;
output wire [CELL_WIDTH*NUM_CELL-1:0] sscell_wdata_list;
output wire [NUM_CELL-1:0] sscell_renable_list;
input wire [CELL_WIDTH*NUM_CELL-1:0] sscell_rdata_list;
input wire [NUM_CELL-1:0] sscell_stall_list;

RVX_MODULE_073
#(
  .RVX_GPARA_5(RVX_LPARA_0),
  .RVX_GPARA_0(RVX_LPARA_1),
  .RVX_GPARA_3(BW_AXI_TID),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .RVX_GPARA_4(BASEADDR),
  .RVX_GPARA_6(RVX_LPARA_4),
  .RVX_GPARA_2(CELL_WIDTH),
  .RVX_GPARA_1(NUM_CELL)
)
i_rvx_instance_0
(
	.rvx_port_28(clk),
	.rvx_port_15(rstnn),
  .rvx_port_17(1'b 0),
  .rvx_port_21(enable),

  .rvx_port_11(rxarid),
	.rvx_port_39(rxaraddr),
	.rvx_port_12(rxarlen),
	.rvx_port_09(rxarsize),
	.rvx_port_42(rxarburst),
	.rvx_port_24(rxarvalid),
	.rvx_port_40(rxarready),

	.rvx_port_43(rxrid),
	.rvx_port_34(rxrdata),
	.rvx_port_29(rxrresp),
	.rvx_port_10(rxrlast),
	.rvx_port_38(rxrvalid),
	.rvx_port_35(rxrready),

	.rvx_port_08(rxawid),
  .rvx_port_33(rxawaddr),
  .rvx_port_02(rxawlen),
  .rvx_port_03(rxawsize),
  .rvx_port_27(rxawburst),
  .rvx_port_07(rxawvalid),
  .rvx_port_16(rxawready),

  .rvx_port_36(rxwid),
  .rvx_port_20(rxwdata),
  .rvx_port_22(rxwstrb),
  .rvx_port_30(rxwlast),
  .rvx_port_01(rxwvalid),
  .rvx_port_13(rxwready),

  .rvx_port_14(rxbid),
  .rvx_port_25(rxbresp),
  .rvx_port_32(rxbvalid),
  .rvx_port_06(rxbready),

  .rvx_port_41(sscell_select_list),
	.rvx_port_23(sscell_index_list),
	.rvx_port_05(sscell_enable_list),
	.rvx_port_18(sscell_wenable_list),
	.rvx_port_19(sscell_wenable_byte_list),
	.rvx_port_37(sscell_wenable_bit_list),
	.rvx_port_04(sscell_wdata_list),
	.rvx_port_26(sscell_renable_list),
	.rvx_port_00(sscell_rdata_list),
  .rvx_port_31(sscell_stall_list)
);

endmodule
