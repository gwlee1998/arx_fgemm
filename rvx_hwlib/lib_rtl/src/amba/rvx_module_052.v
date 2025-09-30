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





module RVX_MODULE_052
(
	rvx_port_05,
	rvx_port_08,

	rvx_port_11,
	rvx_port_04,
	rvx_port_14,
	rvx_port_13,
	rvx_port_10,
	rvx_port_03,
	rvx_port_01,
	rvx_port_12,

	rvx_port_06,
	
	rvx_port_16,
	rvx_port_17,
	rvx_port_02,
	rvx_port_00,
	rvx_port_07,
	rvx_port_09,
	rvx_port_15,
	rvx_port_18
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;

input wire rvx_port_05, rvx_port_08;

input wire rvx_port_11;
input wire rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_14;
input wire rvx_port_13;
input wire [RVX_GPARA_2-1:0] rvx_port_10;
output wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire rvx_port_01;
output reg rvx_port_12;

input wire [RVX_GPARA_0-1:0] rvx_port_06;

output wire [RVX_GPARA_0-1:0] rvx_port_16;
output wire [RVX_GPARA_0-1:0] rvx_port_17;
output wire [RVX_GPARA_0*RVX_GPARA_1-1:0] rvx_port_02;
output wire [RVX_GPARA_0-1:0] rvx_port_00;
output wire [RVX_GPARA_0*RVX_GPARA_2-1:0] rvx_port_07;
input wire [RVX_GPARA_0*RVX_GPARA_2-1:0] rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_15;
input wire [RVX_GPARA_0-1:0] rvx_port_18;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_0;
wire [RVX_GPARA_0-1:0] rvx_signal_2;
wire [RVX_GPARA_1-1:0] rvx_signal_3 [RVX_GPARA_0-1:0];
wire [RVX_GPARA_0-1:0] rvx_signal_4;
wire [RVX_GPARA_2-1:0] rvx_signal_6 [RVX_GPARA_0-1:0];
wire [RVX_GPARA_2-1:0] rvx_signal_1;
wire rvx_signal_7;
wire rvx_signal_5;

generate
	for(i=0; i<RVX_GPARA_0; i=i+1)
	begin : i_split_and_merge
		assign rvx_port_16[i] = rvx_signal_0[i];
		assign rvx_port_17[i] = rvx_signal_2[i];
		assign rvx_port_02[RVX_GPARA_1*(i+1)-1 -:RVX_GPARA_1] = rvx_signal_3[i];
		assign rvx_port_00[i] = rvx_signal_4[i];
		assign rvx_port_07[RVX_GPARA_2*(i+1)-1 -:RVX_GPARA_2] = rvx_signal_6[i];
	end
endgenerate

assign rvx_signal_0 = (rvx_port_11==0)? 0 : rvx_port_06;

generate
	for(i=0; i<RVX_GPARA_0; i=i+1)
	begin : i_duplicate
		assign rvx_signal_2[i] = rvx_port_04;
		assign rvx_signal_3[i] = rvx_port_14;
		assign rvx_signal_4[i] = rvx_port_13;
		assign rvx_signal_6[i] = rvx_port_10;
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_2),
	.NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.data_input_list(rvx_port_09),
	.select(rvx_port_06),
	.data_output(rvx_signal_1)
);
assign rvx_port_03 = rvx_signal_1;

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(1),
	.NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_2
(
	.data_input_list(rvx_port_15),
	.select(rvx_port_06),
	.data_output(rvx_signal_7)
);
assign rvx_port_01 = rvx_signal_7;

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(1),
	.NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.data_input_list(rvx_port_18),
	.select(rvx_port_06),
	.data_output(rvx_signal_5)
);

always@(*)
begin
	rvx_port_12 = 0;
	if(rvx_port_11==1)
	begin
		if(rvx_port_06==0)
			rvx_port_12 = 1;
		else
			rvx_port_12 = rvx_signal_5;
	end
end

endmodule

