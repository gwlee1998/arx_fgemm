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



module ERVP_PIPELINED_MULTIPLIER
(
  clk,
  rstnn,
  enable,
  stall,

  input_wvalid,
  input_wready,
  input_left,
  input_right,

  output_rvalid,
  output_rready,
  output_result,
  output_upper,
  output_lower
);



parameter BW_INPUT = 32;
parameter BW_OUTPUT = 32;
parameter BW_LOWER = BW_OUTPUT>>1;
parameter USE_LIBRARY = 1;

localparam  RVX_LPARA_5 = 2*BW_INPUT;
localparam  RVX_LPARA_6 = RVX_LPARA_5-BW_LOWER;

input wire clk;
input wire rstnn;
input wire enable;
input wire stall;

input wire input_wvalid;
output wire input_wready;
input wire [BW_INPUT-1:0] input_left;
input wire [BW_INPUT-1:0] input_right;

output wire output_rvalid;
input wire output_rready;
output wire [BW_OUTPUT-1:0] output_result;
output wire [RVX_LPARA_6-1:0] output_upper;
output wire [BW_LOWER-1:0] output_lower;

localparam  RVX_LPARA_7 = (BW_INPUT+1)>>1;
localparam  RVX_LPARA_1 = BW_INPUT-RVX_LPARA_7;

localparam  RVX_LPARA_0 = (RVX_LPARA_7+1)>>1;
localparam  RVX_LPARA_3 = RVX_LPARA_7 - RVX_LPARA_0;
localparam  RVX_LPARA_2 = (RVX_LPARA_1+1)>>1;
localparam  RVX_LPARA_4 = RVX_LPARA_1 - RVX_LPARA_2;

wire rvx_signal_03;
wire rvx_signal_00;
wire rvx_signal_16;

wire [RVX_LPARA_0-1:0] rvx_signal_10;
wire [RVX_LPARA_3-1:0] rvx_signal_22;
wire [RVX_LPARA_2-1:0] rvx_signal_05;
wire [RVX_LPARA_4-1:0] rvx_signal_04;

wire [BW_INPUT+RVX_LPARA_0+1-1:0] rvx_signal_15;
wire [BW_INPUT+RVX_LPARA_3+1-1:0] rvx_signal_01;
wire [BW_INPUT+RVX_LPARA_2+1-1:0] rvx_signal_17;
wire [BW_INPUT+RVX_LPARA_4-1:0] rvx_signal_18;

wire rvx_signal_11;
reg rvx_signal_20;
wire rvx_signal_08;
reg [BW_INPUT+RVX_LPARA_0+1-1:0] rvx_signal_02;
reg [BW_INPUT+RVX_LPARA_3+1-1:0] rvx_signal_12;
reg [BW_INPUT+RVX_LPARA_2+1-1:0] rvx_signal_19;
reg [BW_INPUT+RVX_LPARA_4-1:0] rvx_signal_06;

wire [RVX_LPARA_5-1:0] rvx_signal_21;
wire [RVX_LPARA_5-1:0] rvx_signal_14;
wire [RVX_LPARA_5-1:0] rvx_signal_09;
wire [RVX_LPARA_5-1:0] rvx_signal_13;
wire [RVX_LPARA_5-1:0] rvx_signal_07;

assign input_wready = rvx_signal_16;

assign rvx_signal_03 = rvx_signal_00 & rvx_signal_16;
assign rvx_signal_00 = input_wvalid;
assign rvx_signal_16 = (~stall) & (rvx_signal_20? rvx_signal_08 : 1);

assign {rvx_signal_04,rvx_signal_05,rvx_signal_22,rvx_signal_10} = input_right;

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_0+1),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_3
(
  .multiplicand(input_left),
  .multiplier({1'b0,rvx_signal_10}),
  .product(rvx_signal_15)
);

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_3+1),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_1
(
  .multiplicand(input_left),
  .multiplier({1'b0,rvx_signal_22}),
  .product(rvx_signal_01)
);

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_2+1),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_0
(
  .multiplicand(input_left),
  .multiplier({1'b0,rvx_signal_05}),
  .product(rvx_signal_17)
);

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_4),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_2
(
  .multiplicand(input_left),
  .multiplier(rvx_signal_04),
  .product(rvx_signal_18)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_20 <= 0;
  else if(enable)
  begin
    if(rvx_signal_03)
      rvx_signal_20 <= 1;
    else if(rvx_signal_11)
      rvx_signal_20 <= 0;
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_02 <= 0;
    rvx_signal_12 <= 0;
    rvx_signal_19 <= 0;
    rvx_signal_06 <= 0;
  end
  else if(enable && rvx_signal_03)
  begin
    rvx_signal_02 <= rvx_signal_15;
    rvx_signal_12 <= rvx_signal_01;
    rvx_signal_19 <= rvx_signal_17;
    rvx_signal_06 <= rvx_signal_18;
  end
end

assign rvx_signal_11 = rvx_signal_20 & rvx_signal_08;
assign rvx_signal_08 = (~stall) & output_rready;

assign rvx_signal_21 = $signed(rvx_signal_02);
assign rvx_signal_14 = $signed(rvx_signal_12) << RVX_LPARA_0;
assign rvx_signal_09 = $signed(rvx_signal_19) << (RVX_LPARA_0+RVX_LPARA_3);
assign rvx_signal_13 = $signed(rvx_signal_06) << (RVX_LPARA_0+RVX_LPARA_3+RVX_LPARA_2);

assign rvx_signal_07 = rvx_signal_21 + rvx_signal_14 + rvx_signal_09 + rvx_signal_13;

assign output_rvalid = rvx_signal_20;
assign output_result = rvx_signal_07;
assign {output_upper,output_lower} = rvx_signal_07;

endmodule
