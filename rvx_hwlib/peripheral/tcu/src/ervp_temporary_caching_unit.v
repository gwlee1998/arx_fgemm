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



module ERVP_TEMPORARY_CACHING_UNIT
(
	clk,
	rstnn,

	rxawid_x,
	rxawaddr_x,
	rxawlen_x,
	rxawsize_x,
	rxawburst_x,
	rxawvalid_x,
	rxawready_x,
	rxwid_x,
	rxwdata_x,
	rxwstrb_x,
	rxwlast_x,
	rxwvalid_x,
	rxwready_x,
	rxbid_x,
	rxbresp_x,
	rxbvalid_x,
	rxbready_x,
	rxarid_x,
	rxaraddr_x,
	rxarlen_x,
	rxarsize_x,
	rxarburst_x,
	rxarvalid_x,
	rxarready_x,
	rxrid_x,
	rxrdata_x,
	rxrresp_x,
	rxrlast_x,
	rxrvalid_x,
	rxrready_x,

	sxawid_y,
	sxawaddr_y,
	sxawlen_y,
	sxawsize_y,
	sxawburst_y,
	sxawvalid_y,
	sxawready_y,
	sxwid_y,
	sxwdata_y,
	sxwstrb_y,
	sxwlast_y,
	sxwvalid_y,
	sxwready_y,
	sxbid_y,
	sxbresp_y,
	sxbvalid_y,
	sxbready_y,
	sxarid_y,
	sxaraddr_y,
	sxarlen_y,
	sxarsize_y,
	sxarburst_y,
	sxarvalid_y,
	sxarready_y,
	sxrid_y,
	sxrdata_y,
	sxrresp_y,
	sxrlast_y,
	sxrvalid_y,
	sxrready_y,

	rpaddr,
	rpwrite,
	rpsel,
	rpenable,
	rpwdata,
	rprdata,
	rpready,
	rpslverr
);



`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

`define RVX_LDEF_6            3
`define RVX_LDEF_2				0
`define RVX_LDEF_0					1
`define RVX_LDEF_3				2
`define RVX_LDEF_5					3
`define RVX_LDEF_1				4
`define RVX_LDEF_4			5

parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_AXI_TID = 1;
parameter BW_CACHE_LINE = 128;
parameter NUM_TC = 8;

localparam  RVX_LPARA_0 = 32;

input wire clk, rstnn;

input wire [BW_AXI_TID-1:0] rxawid_x;
input wire [BW_ADDR-1:0] rxawaddr_x;
input wire [`BW_AXI_ALEN-1:0] rxawlen_x;
input wire [`BW_AXI_ASIZE-1:0] rxawsize_x;
input wire [`BW_AXI_ABURST-1:0] rxawburst_x;
input wire rxawvalid_x;
output wire rxawready_x;

input wire [BW_AXI_TID-1:0] rxwid_x;
input wire [BW_DATA-1:0] rxwdata_x;
input wire [`BW_AXI_WSTRB(BW_DATA)-1:0] rxwstrb_x;
input wire rxwlast_x;
input wire rxwvalid_x;
output wire rxwready_x;

output wire [BW_AXI_TID-1:0] rxbid_x;
output wire [`BW_AXI_BRESP-1:0] rxbresp_x;
output wire rxbvalid_x;
input wire rxbready_x;

input wire [BW_AXI_TID-1:0] rxarid_x;
input wire [BW_ADDR-1:0] rxaraddr_x;
input wire [`BW_AXI_ALEN-1:0] rxarlen_x;       
input wire [`BW_AXI_ASIZE-1:0] rxarsize_x;     
input wire [`BW_AXI_ABURST-1:0] rxarburst_x;   
input wire rxarvalid_x;
output wire rxarready_x;

output wire [BW_AXI_TID-1:0] rxrid_x;
output wire [BW_DATA-1:0] rxrdata_x;
output wire [`BW_AXI_RRESP-1:0] rxrresp_x;
output wire rxrlast_x;
output wire rxrvalid_x;
input wire rxrready_x;

output wire [BW_AXI_TID-1:0] sxawid_y;
output wire [BW_ADDR-1:0] sxawaddr_y;
output wire [`BW_AXI_ALEN-1:0] sxawlen_y;
output wire [`BW_AXI_ASIZE-1:0] sxawsize_y;
output wire [`BW_AXI_ABURST-1:0] sxawburst_y;
output wire sxawvalid_y;
input wire sxawready_y;

output wire [BW_AXI_TID-1:0] sxwid_y;
output wire [BW_DATA-1:0] sxwdata_y;
output wire [`BW_AXI_WSTRB(BW_DATA)-1:0] sxwstrb_y;
output wire sxwlast_y;
output wire sxwvalid_y;
input wire sxwready_y;

input wire [BW_AXI_TID-1:0] sxbid_y;
input wire [`BW_AXI_BRESP-1:0] sxbresp_y;
input wire sxbvalid_y;
output wire sxbready_y;

output wire [BW_AXI_TID-1:0] sxarid_y;
output wire [BW_ADDR-1:0] sxaraddr_y;
output wire [`BW_AXI_ALEN-1:0] sxarlen_y;       
output wire [`BW_AXI_ASIZE-1:0] sxarsize_y;     
output wire [`BW_AXI_ABURST-1:0] sxarburst_y;   
output wire sxarvalid_y;
input wire sxarready_y;

input wire [BW_AXI_TID-1:0] sxrid_y;
input wire [BW_DATA-1:0] sxrdata_y;
input wire [`BW_AXI_RRESP-1:0] sxrresp_y;
input wire sxrlast_y;
input wire sxrvalid_y;
output wire sxrready_y;

input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire rpsel;
input wire rpenable;
input wire [RVX_LPARA_0-1:0] rpwdata;
output wire [RVX_LPARA_0-1:0] rprdata;
output wire rpready;
output wire rpslverr;

wire [BW_ADDR*NUM_TC-1:0] rvx_signal_02;
wire [BW_ADDR*NUM_TC-1:0] rvx_signal_05;
wire [BW_ADDR*NUM_TC-1:0] rvx_signal_11;
wire [NUM_TC-1:0] rvx_signal_12;

reg [`RVX_LDEF_6-1:0] rvx_signal_03;
reg [BW_ADDR-1:0] rvx_signal_00;
wire rvx_signal_10;
wire [BW_ADDR-1:0] rvx_signal_01;
wire [BW_ADDR-1:0] rvx_signal_16;
wire [BW_ADDR-1:0] rvx_signal_17;

wire rvx_signal_14;
wire rvx_signal_13;
wire rvx_signal_06;
wire rvx_signal_04;
wire rvx_signal_07;

wire rvx_signal_08;
wire rvx_signal_09;
wire rvx_signal_15;

RVX_MODULE_055
#(
	.RVX_GPARA_1(BW_ADDR),
	.RVX_GPARA_0(BW_DATA)
)
i_rvx_instance_0
(
	.rvx_port_02(clk),
	.rvx_port_07(rstnn),
	.rvx_port_11(rpsel),
	.rvx_port_08(rpenable),
	.rvx_port_14(rpaddr),
	.rvx_port_09(rpwrite),
	.rvx_port_00(rpwdata),
	.rvx_port_12(rprdata),
	.rvx_port_10(rpready),
	.rvx_port_04(rpslverr),

	.rvx_port_03(1'b 0),
	.rvx_port_01(rvx_signal_12),
	.rvx_port_13(rvx_signal_02),
	.rvx_port_05(rvx_signal_05),
	.rvx_port_06(rvx_signal_11)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_00 <= 0;
	else
	begin
		if(rvx_signal_14)
			rvx_signal_00 <= rxaraddr_x;
		else if(rvx_signal_13)
			rvx_signal_00 <= rxawaddr_x;
	end
end

RVX_MODULE_084
#(
	.RVX_GPARA_2(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_3(BW_CACHE_LINE),
	.RVX_GPARA_0(NUM_TC)
)
i_rvx_instance_1
(
	.rvx_port_6(rvx_signal_02),
	.rvx_port_3(rvx_signal_05),
	.rvx_port_7(rvx_signal_11),
	.rvx_port_0(rvx_signal_12),
	.rvx_port_1(rvx_signal_10),
	.rvx_port_2(rvx_signal_00),
	.rvx_port_8(rvx_signal_01),
	.rvx_port_4(rvx_signal_16),
	.rvx_port_5(rvx_signal_17)
);

assign sxaraddr_y = rvx_signal_01;
assign sxawaddr_y = rvx_signal_01;

assign rvx_signal_14 = (rvx_signal_03==`RVX_LDEF_2) && rxarvalid_x;
assign rvx_signal_13 = (rvx_signal_03==`RVX_LDEF_3) && rxawvalid_x;

assign rvx_signal_06 = sxarvalid_y && rxarready_x;
assign rvx_signal_04 = sxawvalid_y && rxawready_x;
assign rvx_signal_07 = rvx_signal_04 && rvx_signal_10;

assign sxarvalid_y = (rvx_signal_03==`RVX_LDEF_0) && rxarvalid_x;
assign sxawvalid_y = (rvx_signal_03==`RVX_LDEF_5) && rxawvalid_x;

assign rxarready_x   = (rvx_signal_03==`RVX_LDEF_0) && sxarready_y;
assign rxawready_x   = (rvx_signal_03==`RVX_LDEF_5) && sxawready_y;

assign sxawid_y      = rxawid_x;
assign sxawlen_y     = rxawlen_x;
assign sxawsize_y    = rxawsize_x;
assign sxawburst_y   = rxawburst_x;

assign sxarid_y      = rxarid_x;
assign sxarlen_y     = rxarlen_x;
assign sxarsize_y    = rxarsize_x;
assign sxarburst_y   = rxarburst_x;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_03 <= `RVX_LDEF_2;
	else
		case(rvx_signal_03)
			`RVX_LDEF_2:
				if(rvx_signal_14)
					rvx_signal_03 <= `RVX_LDEF_0;
				else if(rxawvalid_x==1)
					rvx_signal_03 <= `RVX_LDEF_3;
			`RVX_LDEF_0:
				if(rvx_signal_06)
				begin
					if(rxawvalid_x==1)
						rvx_signal_03 <= `RVX_LDEF_3;
					else
						rvx_signal_03 <= `RVX_LDEF_2;
				end
			`RVX_LDEF_3:
				if(rvx_signal_13)
					rvx_signal_03 <= `RVX_LDEF_5;
				else
					rvx_signal_03 <= `RVX_LDEF_2;
			`RVX_LDEF_5:
				if(rvx_signal_04)
				begin
					if(rvx_signal_07)
						rvx_signal_03 <= `RVX_LDEF_1;
					else
						rvx_signal_03 <= `RVX_LDEF_4;
				end
			`RVX_LDEF_1:
				if(rvx_signal_09)
				begin
					if(rxawvalid_x==0)
						rvx_signal_03 <= `RVX_LDEF_2;
					else if(rxarvalid_x==1)
						rvx_signal_03 <= `RVX_LDEF_2;
					else
						rvx_signal_03 <= `RVX_LDEF_3;
				end
			`RVX_LDEF_4:
				if(rvx_signal_09)
				begin
					if(rxarvalid_x==1)
						rvx_signal_03 <= `RVX_LDEF_2;
					else if(rxawvalid_x==0)
						rvx_signal_03 <= `RVX_LDEF_2;
					else
						rvx_signal_03 <= `RVX_LDEF_3;
				end
		endcase
end

assign rvx_signal_08 = sxwvalid_y && rxwready_x;
assign rvx_signal_09 = rvx_signal_08 && rxwlast_x;
assign rvx_signal_15 = rvx_signal_08 && (rvx_signal_03==`RVX_LDEF_1);

RVX_MODULE_020
#(
	.RVX_GPARA_1(BW_ADDR)
)
i_rvx_instance_2
(
	.rvx_port_08(clk),
	.rvx_port_04(rstnn),
	.rvx_port_12(rvx_signal_00),
	.rvx_port_00(rxawlen_x),
	.rvx_port_02(rxawsize_x),
	.rvx_port_09(rxawburst_x),
	.rvx_port_05(rvx_signal_07),
	.rvx_port_01(rvx_signal_15),
	.rvx_port_03(rvx_signal_16),
	.rvx_port_10(rvx_signal_17),
	.rvx_port_06((rvx_signal_03!=`RVX_LDEF_1)),
	.rvx_port_11(rxwstrb_x),
	.rvx_port_07(sxwstrb_y)
);

assign sxwid_y       = rxwid_x;
assign sxwdata_y     = rxwdata_x;
assign sxwlast_y     = rxwlast_x;
assign sxwvalid_y    = rxwvalid_x && ((rvx_signal_03==`RVX_LDEF_1) || (rvx_signal_03==`RVX_LDEF_4));
assign rxwready_x    = sxwready_y && ((rvx_signal_03==`RVX_LDEF_1) || (rvx_signal_03==`RVX_LDEF_4));

assign rxbid_x       = sxbid_y;
assign rxbresp_x     = sxbresp_y;
assign rxbvalid_x    = sxbvalid_y;
assign sxbready_y    = rxbready_x;

assign rxrid_x       = sxrid_y;
assign rxrdata_x     = sxrdata_y;
assign rxrresp_x     = sxrresp_y;
assign rxrlast_x     = sxrlast_y;
assign rxrvalid_x    = sxrvalid_y;
assign sxrready_y    = rxrready_x;

endmodule
