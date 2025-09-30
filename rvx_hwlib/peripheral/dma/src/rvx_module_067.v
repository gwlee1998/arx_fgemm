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
`include "rvx_include_08.vh"





module RVX_MODULE_067
(
	rvx_port_27,
	rvx_port_06,
	rvx_port_09,

	rvx_port_21,
	rvx_port_16,
	rvx_port_02,
	rvx_port_25,
	rvx_port_29,

	rvx_port_28,
	rvx_port_30,
	rvx_port_01,

	rvx_port_22,
	rvx_port_14,
	rvx_port_11,

	rvx_port_15,
	rvx_port_03,
	rvx_port_13,
	rvx_port_18,
	rvx_port_23,
	rvx_port_04,
	rvx_port_24,

	rvx_port_07,
	rvx_port_08,
	rvx_port_00,
	rvx_port_10,
	rvx_port_12,
	rvx_port_26,

	rvx_port_19,
	rvx_port_20,
	rvx_port_17,
	rvx_port_05
);





parameter RVX_GPARA_1 = 32;
parameter BW_AXI_DATA = 32;
parameter RVX_GPARA_0 = 4;

`include "rvx_include_05.vh"

parameter RVX_GPARA_2 = 10;

`define RVX_LDEF_1		(2)
`define RVX_LDEF_3			(0)
`define RVX_LDEF_2			(1)
`define RVX_LDEF_0			(2)

input wire rvx_port_27, rvx_port_06, rvx_port_09;

input wire [RVX_GPARA_1-1:0] rvx_port_21;
input wire [BW_LINE_SIZE-1:0] rvx_port_16;
input wire [BW_NUM_LINES-1:0] rvx_port_02;
input wire [RVX_GPARA_1-1:0] rvx_port_25;
input wire rvx_port_29;
input wire rvx_port_28;
output wire rvx_port_30;
output wire rvx_port_01;

input wire rvx_port_22;
input wire [BW_DATA_BUFFER-1:0] rvx_port_14;
output wire rvx_port_11;

output wire [RVX_GPARA_0-1:0] rvx_port_15;
output wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire [`BW_AXI_ALEN-1:0] rvx_port_13;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_18;
output wire [`BW_AXI_ABURST-1:0] rvx_port_23;
output wire rvx_port_04;
input wire rvx_port_24;

output wire [RVX_GPARA_0-1:0] rvx_port_07;
output wire [BW_AXI_DATA-1:0] rvx_port_08;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_00;
output wire rvx_port_10;
output wire rvx_port_12;
input wire rvx_port_26;

input wire [RVX_GPARA_0-1:0] rvx_port_19;
input wire [`BW_AXI_BRESP-1:0] rvx_port_20;
input wire rvx_port_17;
output wire rvx_port_05;

wire rvx_signal_01;
wire rvx_signal_08;
wire rvx_signal_02;
wire rvx_signal_12;

wire rvx_signal_09;
wire rvx_signal_10;

wire [RVX_GPARA_1-1:0] rvx_signal_04;
wire rvx_signal_06;

wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_signal_11;
wire rvx_signal_07;

reg [`RVX_LDEF_1-1:0] rvx_signal_05;
wire rvx_signal_00;

wire rvx_signal_03;

assign rvx_port_03 = rvx_signal_04;
assign rvx_port_15 = 0;
assign rvx_port_18 = AXI_SIZE;

assign rvx_port_07 = 0;
assign rvx_port_12 = rvx_port_22 & rvx_signal_09;

assign {rvx_port_08, rvx_port_10} = rvx_port_14;
assign rvx_port_11 = rvx_signal_08;

assign rvx_signal_10 = rvx_port_10 & rvx_signal_08;

assign rvx_port_05 = 1;

assign rvx_signal_01 = (rvx_port_24 && rvx_port_04);
assign rvx_signal_08 = (rvx_port_12 && rvx_port_26);
assign rvx_signal_02 = (rvx_port_10 && rvx_signal_08);
assign rvx_signal_12 = (rvx_port_17 && rvx_port_05);

assign rvx_port_23 = (rvx_signal_06)? `AXI_BURST_INCR: `AXI_BURST_FIXED;

assign rvx_signal_00 = (rvx_signal_05 == `RVX_LDEF_3);
assign rvx_signal_03 = (rvx_signal_07 | ~rvx_signal_00 | rvx_port_28);

always@(posedge rvx_port_27, negedge rvx_port_09)
begin
	if(rvx_port_09 == 0)
        begin
		rvx_signal_05 <= `RVX_LDEF_3;
	end
	else
	begin
		case(rvx_signal_05)
			`RVX_LDEF_3:
				if(rvx_signal_01)
					rvx_signal_05 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_port_06 == 0)
					rvx_signal_05 <= `RVX_LDEF_0;
			`RVX_LDEF_0:
				if(rvx_port_06 == 1)
					rvx_signal_05 <= `RVX_LDEF_3;
		endcase
	end
end

RVX_MODULE_003
#(
	.RVX_GPARA_0(RVX_GPARA_1),
	.BW_AXI_DATA(BW_AXI_DATA),
	.MAX_AXI_LENGTH(MAX_AXI_LENGTH)
)
i_rvx_instance_0
(
	.rvx_port_14(rvx_port_27),
	.rvx_port_01(rvx_port_09),
	.rvx_port_04(rvx_port_21),
	.rvx_port_10(rvx_port_16),
	.rvx_port_06(rvx_port_02),
	.rvx_port_11(rvx_port_25),
	.rvx_port_08(rvx_port_29),
	.rvx_port_12(rvx_signal_03),
	.rvx_port_13(rvx_port_30),
	.rvx_port_07(rvx_signal_04),
	.rvx_port_09(rvx_signal_06),
	.rvx_port_03(rvx_port_13),
	.rvx_port_05(rvx_signal_11),
	.rvx_port_00(rvx_port_04),
	.rvx_port_02(rvx_port_24)
);

ERVP_FIFO
#(
	.BW_DATA(`BW_AXI_WSTRB(BW_AXI_DATA)),
	.DEPTH(RVX_GPARA_2)
 )
i_rvx_instance_1
(
	.clk(rvx_port_27),
	.rstnn(rvx_port_09),
	.enable(1'b 1),
  .clear(1'b 0),

	.wready(),
	.wrequest(rvx_signal_01),
	.wfull(rvx_signal_07),
	.wdata(rvx_signal_11),
	.wnum(),

	.rready(rvx_signal_09),
	.rrequest(rvx_signal_10),
	.rempty(rvx_port_01),
	.rdata(rvx_port_00),
	.rnum()
);

endmodule
