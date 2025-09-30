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





module RVX_MODULE_047
(
	rvx_port_00,
	rvx_port_12,
  rvx_port_03,
  rvx_port_07,

  rvx_port_01,
  rvx_port_15,
  rvx_port_14,
	rvx_port_04,
	rvx_port_13,
	rvx_port_11,
	rvx_port_18,

	rvx_port_17,
  rvx_port_06,
  rvx_port_09,
	rvx_port_10,
  rvx_port_02,
	rvx_port_08,
  rvx_port_05,
  rvx_port_16
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 4;

input wire rvx_port_00;
input wire rvx_port_12;
input wire rvx_port_03;
input wire rvx_port_07;

output wire rvx_port_01;
input wire rvx_port_15;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire [RVX_GPARA_1-1:0] rvx_port_04;
input wire [`BW_AXI_ALEN-1:0] rvx_port_13;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_11;
input wire [`BW_AXI_ABURST-1:0] rvx_port_18;

input wire rvx_port_17;
output wire rvx_port_06;
output reg [RVX_GPARA_0-1:0] rvx_port_09;
output wire [RVX_GPARA_1-1:0] rvx_port_10;
output reg [`BW_AXI_ALEN-1:0] rvx_port_02;
output reg [`BW_AXI_ASIZE-1:0] rvx_port_08;
output reg [`BW_AXI_ABURST-1:0] rvx_port_05;
output wire rvx_port_16;

wire [`BW_AXI_ALEN-1:0] rvx_signal_09;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_06;
wire [`BW_AXI_ABURST-1:0] rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_05;
wire rvx_signal_02;
wire rvx_signal_07;

wire rvx_signal_08;
wire rvx_signal_04;
wire [RVX_GPARA_1-1:0] rvx_signal_01;
wire rvx_signal_11;
wire rvx_signal_03;

wire rvx_signal_10;

RVX_MODULE_065
#(
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_11(rvx_port_00),
	.rvx_port_01(rvx_port_12),
  .rvx_port_02(rvx_port_03),
  .rvx_port_10(rvx_port_07),

  .rvx_port_08(rvx_signal_09),
	.rvx_port_13(rvx_signal_06),
	.rvx_port_06(rvx_signal_00),
  .rvx_port_12(rvx_signal_05),
	.rvx_port_07(rvx_signal_02),
  .rvx_port_04(rvx_signal_07),
	
  .rvx_port_00(rvx_signal_08),
  .rvx_port_14(rvx_signal_04),
  .rvx_port_09(rvx_signal_01),
	.rvx_port_03(rvx_signal_11),
	.rvx_port_05(rvx_signal_03)
);

assign rvx_signal_09 = rvx_port_13;
assign rvx_signal_06 = rvx_port_11;
assign rvx_signal_00 = rvx_port_18;
assign rvx_signal_05 = rvx_port_04;
assign rvx_signal_02 = rvx_port_15;
assign rvx_signal_04 = rvx_port_06 & rvx_port_17;

assign rvx_signal_10 = rvx_signal_02 & rvx_signal_07;

always@(posedge rvx_port_00, negedge rvx_port_12)
begin
  if(rvx_port_12==0)
  begin
    rvx_port_09 <= 0;
    rvx_port_02 <= 0;
    rvx_port_08 <= 0;
    rvx_port_05 <= 0;
  end
  else if(rvx_port_07 && rvx_signal_10)
  begin
    rvx_port_09 <= rvx_port_14;
    rvx_port_02 <= rvx_port_13;
    rvx_port_08 <= rvx_port_11;
    rvx_port_05 <= rvx_port_18;
  end
end

assign rvx_port_06 = rvx_signal_08;
assign rvx_port_10 = rvx_signal_01;
assign rvx_port_16 = rvx_signal_03;

assign rvx_port_01 = rvx_signal_07;

endmodule
