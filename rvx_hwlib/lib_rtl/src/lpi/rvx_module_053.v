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




module RVX_MODULE_053
(
	rvx_port_02,
	rvx_port_22,
  rvx_port_11,
  rvx_port_23,

  rvx_port_08,
  rvx_port_17,
  rvx_port_13,
  rvx_port_05,
  rvx_port_24,
  rvx_port_18,

  rvx_port_10,
  rvx_port_01,
  rvx_port_16,
  rvx_port_20,
  rvx_port_06,

  rvx_port_04,
	rvx_port_09,
  rvx_port_03,
	rvx_port_15,
	rvx_port_07,
	rvx_port_19,
	rvx_port_14,
	rvx_port_12,
  rvx_port_00,
	rvx_port_21
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = 32;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = RVX_GPARA_1;
localparam  BW_LPIXS_DATA = RVX_GPARA_0;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(RVX_GPARA_2);

`include "lpixs_lpara.vb"

input wire rvx_port_02;
input wire rvx_port_22;
input wire rvx_port_11;
input wire rvx_port_23;

output wire [2-1:0] rvx_port_08;
input wire rvx_port_17;
input wire rvx_port_13;
input wire rvx_port_05;
input wire rvx_port_24;
input wire [BW_LPI_QDATA-1:0] rvx_port_18;

input wire [2-1:0] rvx_port_10;
output wire rvx_port_01;
output wire rvx_port_16;
output wire rvx_port_20;
output wire [BW_LPI_YDATA-1:0] rvx_port_06;

output wire rvx_port_04;
output wire rvx_port_09;
output wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire rvx_port_15;
output wire [RVX_GPARA_0-1:0] rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_19;
input wire rvx_port_14;
input wire rvx_port_12;
output wire [RVX_GPARA_2-1:0] rvx_port_00;
output wire [`NUM_BYTE(RVX_GPARA_0)-1:0] rvx_port_21;

wire [`BW_AXI_ALEN-1:0] rvx_signal_0;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_3;
wire [`BW_AXI_ABURST-1:0] rvx_signal_4;
wire [`BW_AXI_RESP-1:0] rvx_signal_8;

reg rvx_signal_5;
wire rvx_signal_1;
wire rvx_signal_6;

localparam  RVX_LPARA_3 = 2;
localparam  RVX_LPARA_2 = 0;
localparam  RVX_LPARA_1 = 1;
localparam  RVX_LPARA_0 = 3;

reg [RVX_LPARA_3-1:0] rvx_signal_7;

wire rvx_signal_2;

assign {rvx_port_00,rvx_port_15,rvx_signal_0,rvx_signal_3,rvx_signal_4,rvx_port_21,rvx_port_07,rvx_port_03} = rvx_port_18;

always@(posedge rvx_port_02, negedge rvx_port_22)
begin
  if(rvx_port_22==0)
    rvx_signal_5 <= 0;
  else if(rvx_port_23 && rvx_signal_2 && rvx_port_15)
  begin
    if(rvx_port_05)
      rvx_signal_5 <= 0;
    else
      rvx_signal_5 <= rvx_signal_1;
  end
end

assign rvx_signal_1 = rvx_signal_5 | rvx_port_12;
assign rvx_signal_6 = rvx_port_15? rvx_signal_1 : rvx_port_12;
assign rvx_signal_8 = rvx_signal_6? `AXI_RESPONSE_SLVERR : `AXI_RESPONSE_OKAY;

always@(posedge rvx_port_02, negedge rvx_port_22)
begin
  if(rvx_port_22==0)
		rvx_signal_7 <= RVX_LPARA_2;
  else if(rvx_port_23)
  begin
    case(rvx_signal_7)
      RVX_LPARA_2:
        if(rvx_port_17 & (rvx_port_10[0]|(~rvx_port_24)))
          rvx_signal_7 <= RVX_LPARA_1;
      RVX_LPARA_1:
        rvx_signal_7 <= RVX_LPARA_0;
      RVX_LPARA_0:
        if(rvx_signal_2)
          rvx_signal_7 <= RVX_LPARA_2;
    endcase
  end
end

assign {rvx_port_09,rvx_port_04} = rvx_signal_7;

assign rvx_signal_2 = (rvx_signal_7==RVX_LPARA_0) & rvx_port_14;

assign rvx_port_08[0] = rvx_signal_2;
assign rvx_port_08[1] = 0;

assign rvx_port_16 = 0;
assign rvx_port_01 = rvx_signal_2 & rvx_port_24;
assign rvx_port_06 = {rvx_port_15, rvx_signal_8, rvx_port_19};
assign rvx_port_20 = 1;

endmodule
