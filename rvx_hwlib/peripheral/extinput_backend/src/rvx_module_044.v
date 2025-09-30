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
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"

`include "rvx_include_04.vh"





module RVX_MODULE_044
(
  rvx_port_09,
  rvx_port_19,

  rvx_port_05,
  rvx_port_17,
  rvx_port_25,

  rvx_port_01,
  rvx_port_12,
  rvx_port_04,
  rvx_port_28,

  rvx_port_07,
  rvx_port_11,
  rvx_port_26,
  rvx_port_00,
  rvx_port_10,
  rvx_port_16,
  rvx_port_22,
  rvx_port_24,
  rvx_port_03,
  rvx_port_21,
  rvx_port_02,
  rvx_port_20,
  rvx_port_27,
  rvx_port_13,
  rvx_port_23,
  rvx_port_14,
  rvx_port_15,
  rvx_port_08,

  rvx_port_18,
  rvx_port_06
);





parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;

localparam  RVX_LPARA_12 = 1;
localparam  RVX_LPARA_10 = 1;
localparam  RVX_LPARA_16 = 1;
localparam  RVX_LPARA_11 = `RVX_GDEF_216;
localparam  RVX_LPARA_01 = 1;
localparam  RVX_LPARA_14 = RVX_GPARA_0;

input wire rvx_port_09;
input wire rvx_port_19;

input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_17;
output wire rvx_port_25;

input wire rvx_port_01;
input wire [RVX_LPARA_11-1:0] rvx_port_12;
output wire rvx_port_04;
input wire rvx_port_28;

localparam  RVX_LPARA_15 = RVX_GPARA_3;
localparam  RVX_LPARA_05 = 1;

input wire [(2)-1:0] rvx_port_07;
output wire rvx_port_11;
output wire rvx_port_26;
output wire rvx_port_00;
output wire [`BW_AXI_ALEN-1:0] rvx_port_10;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_16;
output wire [`BW_AXI_ABURST-1:0] rvx_port_22;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_24;
output wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire [RVX_LPARA_15-1:0] rvx_port_21;
output wire [RVX_LPARA_05-1:0] rvx_port_02;
output wire [(2)-1:0] rvx_port_20;
input wire rvx_port_27;
input wire rvx_port_13;
input wire rvx_port_23;
input wire [`BW_AXI_RESP-1:0] rvx_port_14;
input wire [RVX_GPARA_2-1:0] rvx_port_15;
input wire [RVX_LPARA_05-1:0] rvx_port_08;

output wire rvx_port_18;
output wire rvx_port_06;

genvar i;

localparam  RVX_LPARA_04 = 1<<`PLOG2(RVX_GPARA_0);
localparam  RVX_LPARA_08 = (RVX_GPARA_1!=0);

wire [`RVX_GDEF_297-1:0] rvx_signal_00;
wire [RVX_GPARA_3-1:0] rvx_signal_33;
wire [`RVX_GDEF_116-1:0] rvx_signal_02;
wire rvx_signal_09;
wire rvx_signal_07;
wire rvx_signal_20;
wire rvx_signal_26;
wire rvx_signal_19;

localparam  RVX_LPARA_00 = RVX_LPARA_11;
localparam  RVX_LPARA_09 = 4;

wire rvx_signal_28;
wire rvx_signal_31;
wire rvx_signal_18;
wire rvx_signal_30;
wire [RVX_LPARA_00-1:0] rvx_signal_10;
wire rvx_signal_25;
wire rvx_signal_22;
wire [RVX_LPARA_00-1:0] rvx_signal_06;

localparam  RVX_LPARA_03 = RVX_GPARA_0;
localparam  RVX_LPARA_17 = RVX_LPARA_08? RVX_GPARA_1 : 2;

wire rvx_signal_21;
wire rvx_signal_08;
wire rvx_signal_17;
wire rvx_signal_24;
wire [RVX_LPARA_03-1:0] rvx_signal_14;
wire rvx_signal_15;
wire rvx_signal_32;
wire [RVX_LPARA_03-1:0] rvx_signal_03;

localparam  RVX_LPARA_07 = `RVX_GDEF_297;

wire rvx_signal_23;
wire rvx_signal_27;
wire rvx_signal_16;
wire [RVX_LPARA_07-1:0] rvx_signal_29;

wire rvx_signal_11;
wire rvx_signal_01;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_04;

localparam  RVX_LPARA_02 = `GET_AXI_SIZE(RVX_GPARA_2);

wire [RVX_LPARA_02-1:0] rvx_signal_13;
wire [RVX_LPARA_02-1:0] rvx_signal_05;
wire [RVX_LPARA_15-1:0] rvx_signal_12;

localparam  RVX_LPARA_06 = `BW_AXI_WSTRB(RVX_GPARA_2);
localparam  RVX_LPARA_13 = RVX_LPARA_02;

assign {rvx_signal_19,rvx_signal_26,rvx_signal_20,rvx_signal_07,rvx_signal_09,rvx_signal_02,rvx_signal_33,rvx_signal_00} = rvx_signal_06;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_00),
  .DEPTH(RVX_LPARA_09)
)
i_rvx_instance_2
(
  .clk(rvx_port_09),
  .rstnn(rvx_port_19),
  .enable(rvx_signal_28),
  .clear(rvx_signal_31),
  .wready(rvx_signal_18),
  .wfull(),
  .wrequest(rvx_signal_30),
  .wdata(rvx_signal_10),
  .wnum(),
  .rready(rvx_signal_25),
  .rempty(),
  .rrequest(rvx_signal_22),
  .rdata(rvx_signal_06),
  .rnum()
);

assign rvx_signal_28 = 1;
assign rvx_signal_31 = rvx_port_18;
assign rvx_port_04 = rvx_signal_18;
assign rvx_signal_30 = rvx_port_01;
assign rvx_signal_10 = rvx_port_12;
assign rvx_signal_22 = rvx_port_06;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_03),
  .DEPTH(RVX_LPARA_17)
)
i_rvx_instance_1
(
  .clk(rvx_port_09),
  .rstnn(rvx_port_19),
  .enable(rvx_signal_21),
  .clear(rvx_signal_08),
  .wready(rvx_signal_17),
  .wfull(),
  .wrequest(rvx_signal_24),
  .wdata(rvx_signal_14),
  .wnum(),
  .rready(rvx_signal_15),
  .rempty(),
  .rrequest(rvx_signal_32),
  .rdata(rvx_signal_03),
  .rnum()
);

assign rvx_signal_21 = RVX_LPARA_08;
assign rvx_signal_08 = rvx_port_18;
assign rvx_signal_24 = rvx_port_05;
assign rvx_signal_14 = rvx_port_17;
assign rvx_port_25 = rvx_signal_17;
assign rvx_signal_32 = rvx_signal_16;

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_07)
)
i_rvx_instance_0
(
	.clk(rvx_port_09),
  .rstnn(rvx_port_19),
	.enable(rvx_signal_23),
	.init(rvx_signal_27),
  .count(rvx_signal_16),
	.value(rvx_signal_29),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_23 = RVX_LPARA_08;
assign rvx_signal_27 = rvx_signal_01;
assign rvx_signal_16 = rvx_signal_11;

assign rvx_signal_11 = rvx_port_11 & rvx_port_07[0];
assign rvx_signal_01 = rvx_signal_11 & rvx_port_26;

assign rvx_signal_04 = `GET_AXI_SIZE(RVX_LPARA_04);

assign rvx_signal_13 = 0;
assign rvx_signal_05 = rvx_signal_33;
assign rvx_signal_12 = {rvx_signal_33[RVX_LPARA_15-1:RVX_LPARA_02], rvx_signal_13};

assign rvx_port_11 = rvx_signal_25 & rvx_signal_26;
assign rvx_port_26 = (rvx_signal_29==rvx_signal_02);
assign rvx_port_00 = 1;
assign rvx_port_10 = rvx_signal_02;
assign rvx_port_16 = rvx_signal_04;
assign rvx_port_22 = `AXI_BURST_INCR;
assign rvx_port_21 = rvx_signal_12;
assign rvx_port_02 = 0;

assign rvx_port_24 = -1;

generate
for(i=0; i<RVX_GPARA_2/RVX_LPARA_04; i=i+1)
begin : i_duplicate_dma_wdata
  assign rvx_port_03[RVX_LPARA_04*(i+1)-1-:RVX_LPARA_04] = rvx_signal_03;
end
endgenerate

assign rvx_port_20[1] = 1;
assign rvx_port_20[0] = 1;

assign rvx_port_18 = rvx_port_28 & (~rvx_signal_25);
assign rvx_port_06 = rvx_signal_25 & (rvx_signal_26? ((~rvx_signal_19) & rvx_signal_01) : 1);

endmodule
