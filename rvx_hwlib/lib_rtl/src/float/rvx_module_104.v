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
`include "fpir_define.vh"





module RVX_MODULE_104
(
	rvx_port_0,
	rvx_port_2,
	rvx_port_1
);





parameter RVX_GPARA_3 = 33;
parameter RVX_GPARA_0 = 6;
parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_2 = (1<<RVX_GPARA_0)-1;

input wire [RVX_GPARA_3-1:0] rvx_port_0;
input wire [RVX_GPARA_0-1:0] rvx_port_2;
output wire [RVX_GPARA_3-1:0] rvx_port_1;

localparam  RVX_LPARA_0 = RVX_GPARA_3+RVX_GPARA_2;

wire [RVX_LPARA_0-1:0] rvx_signal_0;
wire [RVX_LPARA_0-1:0] rvx_signal_2;
wire [RVX_LPARA_0-1:0] rvx_signal_1;

assign rvx_signal_0 = rvx_port_0 << RVX_GPARA_2;

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(RVX_LPARA_0),
	.BW_SHIFT_AMOUNT(RVX_GPARA_0),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(0),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.MSB_FILL_VALUE(0)
)
i_rvx_instance_0
(
	.data_input(rvx_signal_0),
	.shift_amount(rvx_port_2),
	.data_output(rvx_signal_2)
);

RVX_MODULE_069
#(
  .RVX_GPARA_1(RVX_LPARA_0),
  .RVX_GPARA_2(RVX_GPARA_2),
  .RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_2(rvx_signal_2),
	.rvx_port_1(rvx_signal_1),
  .rvx_port_0()
);

assign rvx_port_1 = rvx_signal_1 >> RVX_GPARA_2;

endmodule
