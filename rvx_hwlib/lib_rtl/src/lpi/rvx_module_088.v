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





module RVX_MODULE_088
(
	rvx_port_15,
	rvx_port_17,
  rvx_port_05,
  rvx_port_18,

  rvx_port_09,
  rvx_port_24,
  rvx_port_16,
  rvx_port_07,
  rvx_port_04,
  rvx_port_20,

  rvx_port_00,
  rvx_port_25,
  rvx_port_19,
  rvx_port_08,
  rvx_port_06,

  rvx_port_22,
  rvx_port_03,
  rvx_port_01,
  rvx_port_12,
  rvx_port_14,
  rvx_port_23,

  rvx_port_21,
  rvx_port_11,
  rvx_port_10,
  rvx_port_02,
  rvx_port_13
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter BW_LPI_BURDEN = 1;
parameter MEMORY_OPERATION_TYPE = 3;

`include "rvx_include_02.vh"

`include "lpit_function.vb"
`include "lpixm_function.vb"
`include "lpixs_function.vb"

localparam  RVX_LPARA_04 = BW_LPI_BURDEN;
localparam  RVX_LPARA_08 = BW_LPIXM_QPARCEL(RVX_GPARA_0,RVX_GPARA_1);
localparam  RVX_LPARA_00 = BW_LPIXM_YPARCEL(RVX_GPARA_1);
localparam  RVX_LPARA_05 = BW_LPI_DATA(RVX_LPARA_04,RVX_LPARA_08);
localparam  RVX_LPARA_03 = BW_LPI_DATA(RVX_LPARA_04,RVX_LPARA_00);

localparam  RVX_LPARA_07 = RVX_LPARA_04;
localparam  RVX_LPARA_10 = BW_LPIXS_QPARCEL(RVX_GPARA_0,RVX_GPARA_1);
localparam  RVX_LPARA_09 = BW_LPIXS_YPARCEL(RVX_GPARA_1);
localparam  RVX_LPARA_02 = BW_LPI_DATA(RVX_LPARA_07,RVX_LPARA_10);
localparam  RVX_LPARA_06 = BW_LPI_DATA(RVX_LPARA_07,RVX_LPARA_09);

input wire rvx_port_15;
input wire rvx_port_17;
input wire rvx_port_05;
input wire rvx_port_18;

output wire [2-1:0] rvx_port_09;
input wire rvx_port_24;
input wire rvx_port_16;
input wire rvx_port_07;
input wire rvx_port_04;
input wire [RVX_LPARA_05-1:0] rvx_port_20;

input wire [2-1:0] rvx_port_00;
output wire rvx_port_25;
output wire rvx_port_19;
output wire rvx_port_08;
output wire [RVX_LPARA_03-1:0] rvx_port_06;

input wire [2-1:0] rvx_port_22;
output wire rvx_port_03;
output wire rvx_port_01;
output wire rvx_port_12;
output wire rvx_port_14;
output wire [RVX_LPARA_02-1:0] rvx_port_23;

output wire [2-1:0] rvx_port_21;
input wire rvx_port_11;
input wire rvx_port_10;
input wire rvx_port_02;
input wire [RVX_LPARA_06-1:0] rvx_port_13;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_01;
wire rvx_signal_22;
wire [`BW_AXI_ALEN-1:0] rvx_signal_03;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_14;
wire [`BW_AXI_ABURST-1:0] rvx_signal_23;
wire [`NUM_BYTE(RVX_GPARA_1)-1:0] rvx_signal_04;
wire [RVX_GPARA_1-1:0] rvx_signal_13;
wire [RVX_GPARA_0-1:0] rvx_signal_25;

wire [BW_LPI_BURDEN_NZ-1:0] rvx_signal_19;
wire rvx_signal_27;
wire [`BW_AXI_ALEN-1:0] rvx_signal_26;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_05;
wire [`BW_AXI_ABURST-1:0] rvx_signal_29;
wire [`NUM_BYTE(RVX_GPARA_1)-1:0] rvx_signal_17;
wire [RVX_GPARA_1-1:0] rvx_signal_30;
wire [RVX_GPARA_0-1:0] rvx_signal_15;

localparam  RVX_LPARA_01 = BW_LPI_BURDEN_NZ+1;

wire rvx_signal_20;
wire rvx_signal_00;
wire [RVX_LPARA_01-1:0] rvx_signal_21;
wire [RVX_GPARA_0-1:0] rvx_signal_10;
wire [`BW_AXI_ALEN-1:0] rvx_signal_16;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_24;
wire [`BW_AXI_ABURST-1:0] rvx_signal_08;

wire rvx_signal_28;
wire rvx_signal_31;
wire [RVX_LPARA_01-1:0] rvx_signal_06;
wire [RVX_GPARA_0-1:0] rvx_signal_32;
wire [`BW_AXI_ALEN-1:0] rvx_signal_09;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_18;
wire [`BW_AXI_ABURST-1:0] rvx_signal_11;
wire rvx_signal_02;

reg rvx_signal_07;
reg rvx_signal_12;

always@(*)
begin
  rvx_signal_07 = 0;
  if(rvx_signal_31)
  begin
    if(rvx_signal_27)
      rvx_signal_07 = 0;
    else
      rvx_signal_07 = rvx_signal_20;
  end
  else
    rvx_signal_07 = 1;
end

assign rvx_port_09 = {1'b 0, rvx_signal_12};
always@(*)
begin
  rvx_signal_12 = 0;
  if(rvx_signal_31 && rvx_signal_27)
    rvx_signal_12 = rvx_signal_28;
  else if(rvx_signal_07)
    rvx_signal_12 = ~rvx_signal_22;
end

assign {rvx_signal_01,rvx_signal_22,rvx_signal_03,rvx_signal_14,rvx_signal_23,rvx_signal_04,rvx_signal_13,rvx_signal_25} = rvx_port_20;

RVX_MODULE_047
#(
  .RVX_GPARA_1(RVX_GPARA_0),
  .RVX_GPARA_0(RVX_LPARA_01)
)
i_rvx_instance_0
(
	.rvx_port_00(rvx_port_15),
	.rvx_port_12(rvx_port_17),
  .rvx_port_03(rvx_port_05),
  .rvx_port_07(rvx_port_18),

  .rvx_port_01(rvx_signal_20),
  .rvx_port_15(rvx_signal_00),
  .rvx_port_14(rvx_signal_21),
	.rvx_port_04(rvx_signal_10),
	.rvx_port_13(rvx_signal_16),
	.rvx_port_11(rvx_signal_24),
	.rvx_port_18(rvx_signal_08),

	.rvx_port_17(rvx_signal_28),
  .rvx_port_06(rvx_signal_31),
  .rvx_port_09(rvx_signal_06),
	.rvx_port_10(rvx_signal_32),
  .rvx_port_02(rvx_signal_09),
	.rvx_port_08(rvx_signal_18),
  .rvx_port_05(rvx_signal_11),
  .rvx_port_16(rvx_signal_02)
);

assign rvx_signal_00 = rvx_signal_07 & rvx_port_24;
assign rvx_signal_21 = {rvx_signal_01,rvx_signal_22};
assign rvx_signal_10 = rvx_signal_25;
assign rvx_signal_16 = rvx_signal_03;
assign rvx_signal_24 = rvx_signal_14;
assign rvx_signal_08 = rvx_signal_23;

assign {rvx_signal_19,rvx_signal_27} = rvx_signal_06;
assign rvx_signal_26 = rvx_signal_09;
assign rvx_signal_05 = rvx_signal_18;
assign rvx_signal_29 = rvx_signal_11;
assign rvx_signal_17 = rvx_signal_04;
assign rvx_signal_30 = rvx_signal_13;
assign rvx_signal_15 = rvx_signal_32;
assign rvx_signal_28 = rvx_port_22[0] & (rvx_signal_27? rvx_port_24 : 1);

assign rvx_port_03 = rvx_signal_31 & (rvx_signal_27? rvx_port_24 : 1);
assign rvx_port_01 = rvx_port_24;
assign rvx_port_12 = 1;
assign rvx_port_14 = rvx_signal_27? rvx_signal_02 : 1;
assign rvx_port_23 = {rvx_signal_19,rvx_signal_27,rvx_signal_26,rvx_signal_05,rvx_signal_29,rvx_signal_17,rvx_signal_30,rvx_signal_15};

assign rvx_port_21 = rvx_port_00;
assign rvx_port_25 = rvx_port_11;
assign rvx_port_19 = rvx_port_10;
assign rvx_port_08 = rvx_port_02;
assign rvx_port_06 = rvx_port_13;

endmodule
