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





module RVX_MODULE_079
(
	rvx_port_14,
	rvx_port_08,
	rvx_port_05,
	rvx_port_11,

	rvx_port_03,
	rvx_port_15,
	rvx_port_07,
	rvx_port_06,

	rvx_port_00,
	rvx_port_13,

	rvx_port_02,
	rvx_port_10,
	rvx_port_01,

	rvx_port_04,
	rvx_port_12,
	rvx_port_09
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;

localparam  RVX_LPARA_1 = RVX_GPARA_1;
localparam  RVX_LPARA_0 = RVX_GPARA_1;
localparam  RVX_LPARA_2 = 63;

output wire [RVX_GPARA_1-1:0] rvx_port_14;
input wire rvx_port_08;
input wire [RVX_GPARA_1-1:0] rvx_port_05;
output wire rvx_port_11;

output wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire rvx_port_15;
output wire [RVX_GPARA_1-1:0] rvx_port_07;
input wire rvx_port_06;

input wire rvx_port_00;
input wire rvx_port_13;

output wire rvx_port_02;
output wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_01;

input wire rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_12;
output wire rvx_port_09;

wire [RVX_GPARA_1-1:0] rvx_signal_02;
wire rvx_signal_23;
wire [RVX_GPARA_1-1:0] rvx_signal_25;
reg rvx_signal_20;

wire [RVX_GPARA_1-1:0] rvx_signal_13;
reg rvx_signal_22;
wire [RVX_GPARA_1-1:0] rvx_signal_14;
wire rvx_signal_11;

wire rvx_signal_09;
wire rvx_signal_24;
wire rvx_signal_15;
wire [RVX_LPARA_1-1:0] rvx_signal_21;

wire rvx_signal_19;
wire rvx_signal_04;
wire rvx_signal_27;
wire [RVX_LPARA_1-1:0] rvx_signal_26;

`define RVX_LDEF_4 2
`define RVX_LDEF_2 0
`define RVX_LDEF_5 1
`define RVX_LDEF_0 2
`define RVX_LDEF_6 3

reg [`RVX_LDEF_4-1:0] rvx_signal_18;

wire rvx_signal_16;

wire rvx_signal_10;
wire rvx_signal_00;
wire rvx_signal_03;
wire [RVX_LPARA_0-1:0] rvx_signal_17;

wire rvx_signal_12;
wire rvx_signal_05;
wire rvx_signal_08;
wire [RVX_LPARA_0-1:0] rvx_signal_07;

wire rvx_signal_06;

`define RVX_LDEF_2 0
`define RVX_LDEF_3 1

reg rvx_signal_01;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1+RVX_GPARA_1)
)
i_rvx_instance_2
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_13),
	.enable(1'b 1),
	.asynch_value({rvx_port_08,rvx_port_05}),
	.synch_value({rvx_signal_23,rvx_signal_25})
);

assign rvx_port_11 = rvx_signal_20;
assign rvx_port_15 = rvx_signal_22;
assign rvx_port_07 = rvx_signal_14;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_13),
	.enable(1'b 1),
	.asynch_value(rvx_port_06),
	.synch_value(rvx_signal_11)
);

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(RVX_LPARA_2)
)
i_rvx_instance_3
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_13),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_09),
	.wfull(rvx_signal_15),
	.wrequest(rvx_signal_24),
	.wdata(rvx_signal_21),
	.wnum(rvx_signal_02),
	.rready(rvx_signal_19),
	.rempty(rvx_signal_27),
	.rrequest(rvx_signal_04),
	.rdata(rvx_signal_26),
	.rnum()
);

assign rvx_signal_24 = (rvx_signal_18==`RVX_LDEF_6);
assign rvx_signal_21 = $unsigned(rvx_signal_25);
assign rvx_signal_16 = rvx_signal_09 & rvx_signal_24;
assign rvx_port_14 = rvx_signal_02;

always@(posedge rvx_port_00, negedge rvx_port_13)
begin
	if(rvx_port_13==0)
	begin
		rvx_signal_18 <= `RVX_LDEF_2;
		rvx_signal_20 <= 0;
	end
	else
		case(rvx_signal_18)
			`RVX_LDEF_2:
				if(rvx_signal_23 != rvx_signal_20)
					rvx_signal_18 <= `RVX_LDEF_5;
			`RVX_LDEF_5:
				if(rvx_signal_23 != rvx_signal_20)
					rvx_signal_18 <= `RVX_LDEF_0;
				else
					rvx_signal_18 <= `RVX_LDEF_2;
			`RVX_LDEF_0:
				if(rvx_signal_23 != rvx_signal_20)
					rvx_signal_18 <= `RVX_LDEF_6;
				else
					rvx_signal_18 <= `RVX_LDEF_2;
			`RVX_LDEF_6:
				if(rvx_signal_16)
				begin
					rvx_signal_18 <= `RVX_LDEF_2;
					rvx_signal_20 <= ~rvx_signal_20;
				end
		endcase
end

assign rvx_port_02 = rvx_signal_19;
assign rvx_port_10 = $unsigned(rvx_signal_26);
assign rvx_signal_04 = rvx_port_01;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_LPARA_2),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_13),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_10),
	.wfull(rvx_signal_03),
	.wrequest(rvx_signal_00),
	.wdata(rvx_signal_17),
	.wnum(),
	.rready(rvx_signal_12),
	.rempty(rvx_signal_08),
	.rrequest(rvx_signal_05),
	.rdata(rvx_signal_07),
	.rnum(rvx_signal_13)
);

assign rvx_signal_00 = rvx_port_04;
assign rvx_signal_17 = $unsigned(rvx_port_12);
assign rvx_port_09 = rvx_signal_10;
assign rvx_port_03 = rvx_signal_13;

always@(posedge rvx_port_00, negedge rvx_port_13)
begin
	if(rvx_port_13==0)
	begin
		rvx_signal_01 <= `RVX_LDEF_2;
		rvx_signal_22 <= 0;
	end
	else
		case(rvx_signal_01)
			`RVX_LDEF_2:
				if(rvx_signal_12)
				begin
					rvx_signal_01 <= `RVX_LDEF_3;
					rvx_signal_22 <= ~rvx_signal_22;
				end
			`RVX_LDEF_3:
				if(rvx_signal_06)
					rvx_signal_01 <= `RVX_LDEF_2;
		endcase
end

assign rvx_signal_06 = (rvx_signal_01==`RVX_LDEF_3) & (rvx_signal_22==rvx_signal_11);
assign rvx_signal_05 = rvx_signal_06;
assign rvx_signal_14 = $unsigned(rvx_signal_07);

`undef RVX_LDEF_2
`undef RVX_LDEF_3
endmodule
