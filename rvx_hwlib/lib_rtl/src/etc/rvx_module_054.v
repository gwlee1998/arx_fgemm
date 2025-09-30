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




module RVX_MODULE_054
(
	rvx_port_1,
	rvx_port_4,
	rvx_port_5,
	rvx_port_3,
	rvx_port_0,
	rvx_port_2
);




parameter RVX_GPARA_0 = 1;
parameter UNSIGNED = 1;
parameter RVX_GPARA_1 = 0;

input wire rvx_port_1;
input wire [RVX_GPARA_0-1:0] rvx_port_4;
input wire rvx_port_5;
input wire [RVX_GPARA_0-1:0] rvx_port_3;
output wire rvx_port_0;
output wire [RVX_GPARA_0-1:0] rvx_port_2;

wire [RVX_GPARA_0+1-1:0] rvx_signal_1, rvx_signal_3;
wire [RVX_GPARA_0+1-1:0] rvx_signal_2;
reg [RVX_GPARA_0+1-1:0] rvx_signal_0;

assign rvx_port_0 = (RVX_GPARA_1==1)? (rvx_port_1 & rvx_port_5) : (rvx_port_1 | rvx_port_5);

assign rvx_signal_1 = (UNSIGNED==1)? $unsigned(rvx_port_4) : $signed(rvx_port_4);
assign rvx_signal_3 = (UNSIGNED==1)? $unsigned(rvx_port_3) : $signed(rvx_port_3);

assign rvx_signal_2 = (UNSIGNED==1)? ($unsigned(rvx_signal_1) + $unsigned(rvx_signal_3)) : ($signed(rvx_signal_1) + $signed(rvx_signal_3));

always@(*)
begin
	rvx_signal_0 = rvx_signal_2;
	if(rvx_port_1 && rvx_port_5)
		rvx_signal_0 = rvx_signal_2;
	else if(RVX_GPARA_1==0)
	begin
		if(rvx_port_1)
			rvx_signal_0 = rvx_signal_1<<1;
		else if(rvx_port_5)
			rvx_signal_0 = rvx_signal_3<<1;
	end
end

assign rvx_port_2 = rvx_signal_0>>1;

endmodule
