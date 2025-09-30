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




module RVX_MODULE_010
(
	rvx_port_5,
	rvx_port_1,
	rvx_port_4,
	rvx_port_0,
	
	rvx_port_2,
	rvx_port_3,
	rvx_port_6
);




input wire rvx_port_5;
input wire rvx_port_1;
input wire rvx_port_4;
input wire rvx_port_0;

input wire rvx_port_2;
output wire rvx_port_3;
output wire rvx_port_6;

localparam  RVX_LPARA_1 = 3;
localparam  RVX_LPARA_0 = 0;

reg [RVX_LPARA_1-1:0] rvx_signal_2;
wire [RVX_LPARA_1-1:0] rvx_signal_0;
reg rvx_signal_3;
wire rvx_signal_1;

assign rvx_signal_0 = {rvx_signal_2, 1'b 1};
assign rvx_signal_1 = ~rvx_signal_2[RVX_LPARA_1-1];

always@(posedge rvx_port_5, negedge rvx_port_1)
begin
	if(rvx_port_1==0)
	begin
		rvx_signal_2 <= RVX_LPARA_0;
		rvx_signal_3 <= 1'b 0;
	end
	else if(rvx_port_0)
	begin
		rvx_signal_2 <= RVX_LPARA_0;
		rvx_signal_3 <= 1'b 0;
	end
	else if(rvx_signal_2[0]==0)
	begin
		if(rvx_port_4)
		begin
			rvx_signal_2 <= rvx_signal_0;
			rvx_signal_3 <= 1'b 1;
		end
	end
	else if(rvx_signal_1)
		rvx_signal_2 <= rvx_signal_0;
end

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_2),
	.rstnn(rvx_port_1),
	.enable(1'b 1),
	.asynch_value(rvx_signal_3),
	.synch_value(rvx_port_6)
);

CLOCK_GATE
i_rvx_instance_0
(
	.clk(rvx_port_2),
	.enable_asynch(rvx_signal_1),
	.gclk(rvx_port_3)
);

endmodule
