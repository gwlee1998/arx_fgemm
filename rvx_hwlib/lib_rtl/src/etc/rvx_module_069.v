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




module RVX_MODULE_069
(
	rvx_port_2,
	rvx_port_1,
  rvx_port_0
);




parameter RVX_GPARA_1 = 16;
parameter RVX_GPARA_2 = 3;
parameter UNSIGNED = 0;
parameter RVX_GPARA_0 = 0;

input wire [RVX_GPARA_1-1:0] rvx_port_2;
output wire [RVX_GPARA_1-1:0] rvx_port_1;
output reg rvx_port_0;

localparam  RVX_LPARA_3 = 1 - UNSIGNED;

localparam  RVX_LPARA_2 = RVX_GPARA_2 + 2 ;
localparam  RVX_LPARA_1 = RVX_GPARA_1 - RVX_GPARA_2 + 1;
localparam  RVX_LPARA_0 = RVX_LPARA_2 + RVX_LPARA_1;

wire [RVX_LPARA_0-1:0] rvx_signal_7;
wire [RVX_LPARA_0-1:0] rvx_signal_5;

wire [RVX_LPARA_1-1:0] rvx_signal_2;
wire [RVX_LPARA_2-1:0] rvx_signal_6;

wire rvx_signal_0;
wire rvx_signal_3;
reg rvx_signal_4;

wire [RVX_LPARA_1-1:0] rvx_signal_1;
wire [RVX_LPARA_2-1:0] rvx_signal_8;

assign rvx_signal_7[RVX_LPARA_0-2:0] = rvx_port_2 << 2;
assign rvx_signal_7[RVX_LPARA_0-1] = (RVX_LPARA_3==1)? rvx_port_2[RVX_GPARA_1-1] : 0;

assign {rvx_signal_2, rvx_signal_6} = rvx_signal_7;

assign rvx_signal_3 = rvx_signal_2[0];
assign rvx_signal_0 = (rvx_signal_6[RVX_LPARA_2-2:0]==0);

always@(*)
begin
	rvx_signal_4 = 0;
	if(rvx_signal_6[RVX_LPARA_2-1])
	begin
		if(rvx_signal_0)
			rvx_signal_4 = rvx_signal_3;
		else
			rvx_signal_4 = 1;
	end
end

assign rvx_signal_1 = rvx_signal_2 + rvx_signal_4;
assign rvx_signal_8 = 0;

assign rvx_signal_5 = {rvx_signal_1,rvx_signal_8};
assign rvx_port_1 = rvx_signal_5 >> 2;

always@(*)
begin
  rvx_port_0 = 0;
  if(RVX_LPARA_3==1)
    rvx_port_0 = rvx_signal_7[RVX_LPARA_0-1] & (~rvx_signal_5[RVX_LPARA_0-1]);
  else
    rvx_port_0 = (~rvx_signal_7[RVX_LPARA_0-1]) & rvx_signal_5[RVX_LPARA_0-1];
end

endmodule
