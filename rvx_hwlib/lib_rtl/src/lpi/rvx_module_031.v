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





module RVX_MODULE_031
(
	rvx_port_03,
	rvx_port_14,
  rvx_port_13,
  rvx_port_02,

  rvx_port_12,
  rvx_port_07,
  rvx_port_24,
  rvx_port_11,
  rvx_port_23,
  rvx_port_21,

  rvx_port_17,
  rvx_port_06,
  rvx_port_22,
  rvx_port_16,
  rvx_port_18,

  rvx_port_15,
	rvx_port_08,
	rvx_port_19,
	rvx_port_05,
	rvx_port_09,
	rvx_port_01,
	rvx_port_04,
	rvx_port_10,
	rvx_port_20,
  rvx_port_00
);





parameter RVX_GPARA_5 = 32;
parameter RVX_GPARA_4 = 32;
parameter BW_LPI_BURDEN = 1;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_0 = 0;

parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_1 = RVX_GPARA_4;
parameter RVX_GPARA_3 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_08 = `NUM_BYTE(RVX_GPARA_4);
localparam  RVX_LPARA_06 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_08);

localparam  RVX_LPARA_02 = `NUM_BYTE(RVX_GPARA_1);
localparam  RVX_LPARA_00 = (RVX_GPARA_3<=1)? 0 : REQUIRED_BITWIDTH_INDEX(RVX_GPARA_3);
localparam  RVX_LPARA_07 = `MAX(RVX_LPARA_00, 1);
localparam  RVX_LPARA_03 = RVX_LPARA_00 + RVX_GPARA_2;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = RVX_GPARA_5;
localparam  BW_LPIXS_DATA = RVX_GPARA_4;

`include "lpixs_lpara.vb"

input wire rvx_port_03;
input wire rvx_port_14;
input wire rvx_port_13;
input wire rvx_port_02;

output wire [2-1:0] rvx_port_12;
input wire rvx_port_07;
input wire rvx_port_24;
input wire rvx_port_11;
input wire rvx_port_23;
input wire [BW_LPI_QDATA-1:0] rvx_port_21;

input wire [2-1:0] rvx_port_17;
output reg rvx_port_06;
output wire rvx_port_22;
output wire rvx_port_16;
output wire [BW_LPI_YDATA-1:0] rvx_port_18;

output wire [RVX_GPARA_3-1:0] rvx_port_15;
output wire [RVX_GPARA_2*RVX_GPARA_3-1:0] rvx_port_08;
output wire [RVX_GPARA_3-1:0] rvx_port_19;
output wire [RVX_GPARA_3-1:0] rvx_port_05;
output wire [RVX_LPARA_02*RVX_GPARA_3-1:0] rvx_port_09;
output wire [RVX_GPARA_1*RVX_GPARA_3-1:0] rvx_port_01;
output wire [RVX_GPARA_1*RVX_GPARA_3-1:0] rvx_port_04;
output wire [RVX_GPARA_3-1:0] rvx_port_10;
input wire [RVX_GPARA_1*RVX_GPARA_3-1:0] rvx_port_20;
input wire [RVX_GPARA_3-1:0] rvx_port_00;

genvar i;

localparam  RVX_LPARA_04 = RVX_GPARA_5;
localparam  RVX_LPARA_09 = RVX_GPARA_4;

wire rvx_signal_13;
wire [`BW_AXI_ALEN-1:0] rvx_signal_03;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_06;
wire [`BW_AXI_ABURST-1:0] rvx_signal_17;
wire [`NUM_BYTE(RVX_LPARA_09)-1:0] rvx_signal_11;
wire [RVX_LPARA_09-1:0] rvx_signal_15;
wire [RVX_LPARA_04-1:0] rvx_signal_25;

wire [RVX_LPARA_06-1:0] rvx_signal_24;

wire [RVX_GPARA_5-RVX_LPARA_06-1:0] rvx_signal_04;
wire rvx_signal_18;
wire [RVX_LPARA_08-1:0] rvx_signal_12;
wire [RVX_GPARA_4-1:0] rvx_signal_01;
wire [RVX_GPARA_4-1:0] rvx_signal_27;
wire rvx_signal_31;
wire [RVX_GPARA_4-1:0] rvx_signal_19;
wire rvx_signal_16;

localparam  RVX_LPARA_05 = RVX_GPARA_1/RVX_GPARA_4;
localparam  RVX_LPARA_01 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_05);

wire [RVX_LPARA_01-1:0] rvx_signal_30;

wire [RVX_LPARA_03-1:0] rvx_signal_22;
wire rvx_signal_26;
wire [RVX_LPARA_02-1:0] rvx_signal_07;
wire [RVX_GPARA_1-1:0] rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_28;
wire rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_23;
wire rvx_signal_10;

reg  [RVX_LPARA_01-1:0] rvx_signal_05;
reg  [RVX_GPARA_3-1:0] rvx_signal_29;

wire rvx_signal_14;
wire rvx_signal_09;

reg rvx_signal_02;
wire [`BW_AXI_RESP-1:0] rvx_signal_08;
wire [RVX_GPARA_4-1:0] rvx_signal_20;

assign {rvx_signal_13,rvx_signal_03,rvx_signal_06,rvx_signal_17,rvx_signal_11,rvx_signal_15,rvx_signal_25} = rvx_port_21;
assign rvx_port_12[0] = rvx_signal_09 & (~rvx_signal_16);
assign rvx_port_12[1] = 0;

assign {rvx_signal_04,rvx_signal_24} = rvx_signal_25 - RVX_GPARA_0;
assign rvx_signal_18 = rvx_signal_09 & rvx_port_07 & rvx_signal_13;
assign rvx_signal_12 = rvx_signal_18? rvx_signal_11 : 0;

generate
for(i=0; i<RVX_GPARA_4; i=i+1)
begin : i_gen_wenable_bit
  assign rvx_signal_01[i] = rvx_signal_18 & rvx_signal_12[i/`BW_BYTE];
end
endgenerate

assign rvx_signal_27 = rvx_signal_15;
assign rvx_signal_31 = rvx_signal_09 & rvx_port_07 & (~rvx_signal_13);
assign rvx_signal_16 = rvx_signal_10;

always@(posedge rvx_port_03, negedge rvx_port_14)
begin
  if(rvx_port_14==0)
  begin
    rvx_signal_05 <= 0;
    rvx_signal_29 <= 0;
  end
  else if(rvx_port_07 & rvx_port_12[0] & (~rvx_signal_13))
  begin
    rvx_signal_05 <= rvx_signal_30;
    rvx_signal_29 <= rvx_port_15;
  end
end

assign rvx_signal_14 = rvx_port_06? rvx_port_17[1] : rvx_port_17[0];
assign rvx_signal_09 = rvx_port_23? rvx_signal_14 : 1;

assign rvx_signal_30 = rvx_signal_04[RVX_LPARA_01-1:0];

assign rvx_signal_22 = (RVX_LPARA_05==1)? rvx_signal_04 : (rvx_signal_04>>RVX_LPARA_01);
assign rvx_signal_26 = rvx_signal_18;

ERVP_DEMUX
#(
  .BW_DATA(RVX_LPARA_08),
  .NUM_DATA(RVX_LPARA_05)
)
i_rvx_instance_4
(
  .data_input(rvx_signal_12),
  .select(rvx_signal_30),
  .data_output_list(rvx_signal_07)
);

ERVP_DEMUX
#(
  .BW_DATA(RVX_GPARA_4),
  .NUM_DATA(RVX_LPARA_05)
)
i_rvx_instance_0
(
  .data_input(rvx_signal_01),
  .select(rvx_signal_30),
  .data_output_list(rvx_signal_00)
);

ERVP_DUPLICATOR
#(
  .BW_DATA(RVX_GPARA_4),
  .NUM_DATA(RVX_LPARA_05)
)
i_rvx_instance_1
(
  .data_input(rvx_signal_27),
  .data_output(rvx_signal_28)
);

assign rvx_signal_21 = rvx_signal_31;

ERVP_MUX
#(
	.BW_DATA(RVX_GPARA_4),
	.NUM_DATA(RVX_LPARA_05)
)
i_rvx_instance_3
(
	.data_input_list(rvx_signal_23),
	.select(rvx_signal_05),
	.data_output(rvx_signal_19)
);

assign rvx_port_19 = rvx_port_05 | rvx_port_10;

generate
for(i=0; i<RVX_GPARA_3; i=i+1)
begin : i_generate_each_cell
  assign rvx_port_15[i] = (RVX_GPARA_3<=1)? 1 : (rvx_signal_22[RVX_LPARA_03-1-:RVX_LPARA_07]==i);
  assign rvx_port_08[RVX_GPARA_2*(i+1)-1 -:RVX_GPARA_2] = rvx_signal_22[RVX_GPARA_2-1:0];
  assign rvx_port_05[i] = (rvx_port_15[i]==1)? rvx_signal_26 : 0;
  assign rvx_port_09[RVX_LPARA_02*(i+1)-1 -:RVX_LPARA_02] = (rvx_port_15[i]==1)? rvx_signal_07 : 0;
  assign rvx_port_01[RVX_GPARA_4*(i+1)-1 -:RVX_GPARA_4] = (rvx_port_15[i]==1)? rvx_signal_00 : 0;
  assign rvx_port_04[RVX_GPARA_4*(i+1)-1 -:RVX_GPARA_4] = rvx_signal_28;
  assign rvx_port_10[i] = (rvx_port_15[i]==1)? rvx_signal_21 : 0;
end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(1),
	.NUM_DATA(RVX_GPARA_3)
)
i_rvx_instance_5
(
	.data_input_list(rvx_port_00),
	.select(rvx_port_15),
	.data_output(rvx_signal_10)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_1),
	.NUM_DATA(RVX_GPARA_3)
)
i_rvx_instance_2
(
	.data_input_list(rvx_port_20),
	.select(rvx_signal_29),
	.data_output(rvx_signal_23)
);

assign rvx_signal_08 = `AXI_RESPONSE_OKAY;
assign rvx_signal_20 = rvx_signal_19;

always@(posedge rvx_port_03, negedge rvx_port_14)
begin
  if(rvx_port_14==0)
  begin
		rvx_port_06 <= 0;
    rvx_signal_02 <= 0;
  end
  else if(rvx_port_07 & rvx_port_12[0] & rvx_port_23)
  begin
    rvx_port_06 <= 1;
    rvx_signal_02 <= rvx_signal_13;
  end
  else
    rvx_port_06 <= 0;
end

assign rvx_port_22 = 0;
assign rvx_port_16 = 1;
assign rvx_port_18 = {rvx_signal_02, rvx_signal_08, rvx_signal_20};

endmodule
