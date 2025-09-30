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





module RVX_MODULE_006
(
  rvx_port_07,
  rvx_port_03,
  rvx_port_01,

  rvx_port_04,
  rvx_port_06,
	rvx_port_09,
	rvx_port_05,
  rvx_port_02,
  rvx_port_00,
	rvx_port_08,
  rvx_port_10
);





`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_0 = 33;
parameter RVX_GPARA_1 = 48;

input wire rvx_port_07;
input wire rvx_port_03;
input wire rvx_port_01;

input wire rvx_port_04;
output wire rvx_port_06;
input wire [RVX_GPARA_0-1:0] rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_05;

output wire rvx_port_02;
input wire rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_08;
output wire [RVX_GPARA_1+RVX_GPARA_0-1:0] rvx_port_10;

localparam  RVX_LPARA_3 = 1;
localparam  RVX_LPARA_2 = 0;
localparam  RVX_LPARA_4 = 1;

reg [RVX_LPARA_3-1:0] rvx_signal_01;
wire rvx_signal_11;
wire rvx_signal_00;

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_UNSIGNED(RVX_GPARA_1);

wire rvx_signal_12;
wire rvx_signal_03;
wire rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_13;
wire [RVX_LPARA_0-1:0] rvx_signal_04;
wire rvx_signal_05;

localparam  RVX_LPARA_1 = RVX_GPARA_0 + 1;

reg [RVX_LPARA_1-1:0] rvx_signal_08;
reg [RVX_LPARA_1-1:0] rvx_signal_02;
reg [RVX_GPARA_1-1:0] rvx_signal_09;

wire [RVX_LPARA_1-1:0] rvx_signal_10;
wire rvx_signal_07; 
wire [RVX_GPARA_0-1:0] rvx_signal_14;

always@(posedge rvx_port_07, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
		rvx_signal_01 <= RVX_LPARA_2;
  else if(rvx_port_01)
    case(rvx_signal_01)
      RVX_LPARA_2:
        if(rvx_signal_11)
          rvx_signal_01 <= RVX_LPARA_4;
      RVX_LPARA_4:
        if(rvx_signal_00)
          rvx_signal_01 <= RVX_LPARA_2;
    endcase
end

assign rvx_signal_11 = rvx_port_04 & rvx_port_06;
assign rvx_signal_00 = rvx_port_02 & rvx_port_00;

assign rvx_port_06 = (rvx_signal_01==RVX_LPARA_2);
assign rvx_port_02 = (rvx_signal_01==RVX_LPARA_4) & rvx_signal_05;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_0),
  .RESET_NUMBER(RVX_GPARA_1),
  .LOWER_LIMIT_NUMBER(0)
)
i_rvx_instance_0
(
	.clk(rvx_port_07),
  .rstnn(rvx_port_03),
	.enable(rvx_port_01),

  .init(rvx_signal_12),
	.up(rvx_signal_03),
	.down(rvx_signal_06),
	.count_amount(rvx_signal_13),
	.value(rvx_signal_04),
	.is_upper_limit(),
	.is_lower_limit(rvx_signal_05)
);

assign rvx_signal_12 = rvx_signal_11;
assign rvx_signal_03 = 0;
assign rvx_signal_06 = (rvx_signal_01==RVX_LPARA_4);
assign rvx_signal_13 = 1;

always@(posedge rvx_port_07, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
  begin
    rvx_signal_08 <= 0;
    rvx_signal_02 <= 0;
    rvx_signal_09 <= 0;
  end
  else if(rvx_port_01)
    case(rvx_signal_01)
      RVX_LPARA_2:
        if(rvx_signal_11)
        begin
          rvx_signal_08 <= rvx_port_09;
          rvx_signal_02 <= rvx_port_05;
        end
      RVX_LPARA_4:
        if(~rvx_signal_05)
        begin
          rvx_signal_08 <= rvx_signal_14<<1;
          rvx_signal_09 <= {rvx_signal_09,rvx_signal_07};
        end
    endcase
end

assign rvx_signal_10 = rvx_signal_08 - rvx_signal_02;
assign rvx_signal_07 = ~rvx_signal_10[RVX_LPARA_1-1];
assign rvx_signal_14 = rvx_signal_07? rvx_signal_10 : rvx_signal_08;

assign rvx_port_08 = rvx_signal_09;
assign rvx_port_10 = $unsigned(rvx_signal_08);

endmodule
