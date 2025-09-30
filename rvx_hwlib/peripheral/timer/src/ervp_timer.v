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
`include "rvx_include_12.vh"
`include "ervp_endian.vh"



module ERVP_TIMER
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,

	tick_1us,
	delay_notice,
	timer_interrupt
);



parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;

localparam  RVX_LPARA_0 = 32;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire clk, rstnn;
input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

input wire tick_1us;

output reg delay_notice;
output wire timer_interrupt;

reg rvx_signal_12; 

wire rvx_signal_17;
wire [5-1:0] rvx_signal_00;
wire rvx_signal_10;
wire [5-1:0] rvx_signal_08;

wire rvx_signal_03;

wire [32-1:0] rvx_signal_09;

wire [32-1:0] rvx_signal_14;

wire [32-1:0] rvx_signal_16;

wire rvx_signal_13;
reg rvx_signal_15;
reg rvx_signal_18;
reg rvx_signal_11;

wire [RVX_LPARA_0-1:0] rvx_signal_19;
reg [RVX_LPARA_0-1:0] rvx_signal_02, rvx_signal_04;

reg rvx_signal_05;
wire rvx_signal_06;
wire rvx_signal_20;

reg rvx_signal_07;
wire rvx_signal_01;

RVX_MODULE_074
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA),
	.RVX_GPARA_1(ENDIAN_TYPE)
)
i_rvx_instance_0
(
	.rvx_port_12(clk),
	.rvx_port_16(rstnn),

	.rvx_port_08(rpsel),
	.rvx_port_13(rpenable),
	.rvx_port_18(rpaddr),
	.rvx_port_09(rpwrite),
	.rvx_port_17(rpwdata),
	.rvx_port_05(rprdata),
	.rvx_port_04(rpready),
	.rvx_port_11(rpslverr),

	.rvx_port_07(1'b 0),
	.rvx_port_10(rvx_signal_17),
	.rvx_port_02(rvx_signal_00),
	.rvx_port_03(rvx_signal_10),
	.rvx_port_00(rvx_signal_08),
	.rvx_port_01(rvx_signal_03),
	.rvx_port_14(rvx_signal_09),
	.rvx_port_06(rvx_signal_14),
	.rvx_port_15(rvx_signal_16)
);

assign rvx_signal_00 = {rvx_signal_11,rvx_signal_15};

assign rvx_signal_13 = rvx_signal_15 | rvx_signal_11;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_15 <= 0;
	else if(rvx_signal_10 && rvx_signal_08[0])
		rvx_signal_15 <= rvx_signal_08[1];
	else if(rvx_signal_06 && (rvx_signal_18==0))
		rvx_signal_15 <= 0;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_18 <= 0;
	else if(rvx_signal_10 && rvx_signal_08[0])
		rvx_signal_18 <= rvx_signal_08[2];
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_11 <= 0;
	else if(rvx_signal_10 && rvx_signal_08[3])
		rvx_signal_11 <= rvx_signal_08[4];
	else if(rvx_signal_01)
		rvx_signal_11 <= 0;
end

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
  .CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(rvx_signal_13),
	.init(1'b 0),
	.count(tick_1us),
	.value(rvx_signal_19),
	.is_first_count(),
	.is_last_count()
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_02 <= 0;
	else if(rvx_signal_05)
		rvx_signal_02 <= rvx_signal_19 + rvx_signal_09;
end

always@(*)
begin
	rvx_signal_05 = 0;
	if(rvx_signal_10 && rvx_signal_08[0])
		rvx_signal_05 = 1;
	else if(rvx_signal_06)
		rvx_signal_05 = 1;
end

assign rvx_signal_06 = rvx_signal_15 & (rvx_signal_19==rvx_signal_02);
assign rvx_signal_20 = rvx_signal_15 & rvx_signal_06;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_12 <= 0;
	else if(rvx_signal_03)
		rvx_signal_12 <= 0;
	else if(rvx_signal_20)
		rvx_signal_12 <= 1;
end

assign timer_interrupt = rvx_signal_12;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_04 <= 0;
	else if(rvx_signal_07)
		rvx_signal_04 <= rvx_signal_19 + rvx_signal_14;
end

always@(*)
begin
	rvx_signal_07 = 0;
	if(rvx_signal_10 && rvx_signal_08[3])
		rvx_signal_07 = 1;
end

assign rvx_signal_01 = rvx_signal_11 & (rvx_signal_19==rvx_signal_04);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		delay_notice <= 0;
	else if(rvx_signal_10)
		delay_notice <= 0;
	else if(delay_notice)
		delay_notice <= 0;
	else if(rvx_signal_01)
		delay_notice <= 1;
end

endmodule
