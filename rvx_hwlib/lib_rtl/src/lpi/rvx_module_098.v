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





module RVX_MODULE_098
(
	rvx_port_03,
	rvx_port_31,
  rvx_port_24,
  rvx_port_39,

  rvx_port_21,
  rvx_port_27,
  rvx_port_41,
  rvx_port_16,
  rvx_port_01,
  rvx_port_14,

  rvx_port_40,
  rvx_port_12,
  rvx_port_07,
  rvx_port_42,
  rvx_port_26,

  rvx_port_44,
	rvx_port_05,
	rvx_port_00,
	rvx_port_02,
	rvx_port_04,
	rvx_port_34,
	rvx_port_17,

	rvx_port_30,
	rvx_port_25,
	rvx_port_06,
	rvx_port_18,
	rvx_port_20,
	rvx_port_23, 

	rvx_port_29,
	rvx_port_13,
	rvx_port_35,
	rvx_port_22,

	rvx_port_38,
	rvx_port_33,
	rvx_port_43,
	rvx_port_36,
	rvx_port_08,
	rvx_port_37,
	rvx_port_09,

	rvx_port_15,
	rvx_port_11,
	rvx_port_10,
	rvx_port_28,
	rvx_port_32,
	rvx_port_19
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = 1;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_2 = 4;

`include "burden_para.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = RVX_GPARA_0;
localparam  BW_LPIXM_DATA = RVX_GPARA_3;
localparam  BW_LPI_BURDEN = HAS_BURDEN? BW_BURDEN : 0;

`include "lpixm_lpara.vb"

input wire rvx_port_03;
input wire rvx_port_31;
input wire rvx_port_24;
input wire rvx_port_39;

output wire [2-1:0] rvx_port_21;
input wire rvx_port_27;
input wire rvx_port_41;
input wire rvx_port_16;
input wire rvx_port_01;
input wire [BW_LPI_QDATA-1:0] rvx_port_14;

input wire [2-1:0] rvx_port_40;
output wire rvx_port_12;
output wire rvx_port_07;
output wire rvx_port_42;
output wire [BW_LPI_YDATA-1:0] rvx_port_26;

output wire [RVX_GPARA_1-1:0] rvx_port_44;
output wire [RVX_GPARA_0-1:0] rvx_port_05;
output wire [`BW_AXI_ALEN-1:0] rvx_port_00;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_02;
output wire [`BW_AXI_ABURST-1:0] rvx_port_04;
output wire rvx_port_34;
input wire rvx_port_17;

output wire [RVX_GPARA_1-1:0] rvx_port_30;
output wire [RVX_GPARA_3-1:0] rvx_port_25;
output wire [`BW_AXI_WSTRB(RVX_GPARA_3)-1:0] rvx_port_06;
output wire rvx_port_18;
output wire rvx_port_20;
input wire rvx_port_23;

input wire [RVX_GPARA_1-1:0] rvx_port_29;
input wire [`BW_AXI_BRESP-1:0] rvx_port_13;
input wire rvx_port_35;
output wire rvx_port_22;

output wire [RVX_GPARA_1-1:0] rvx_port_38;
output wire [RVX_GPARA_0-1:0] rvx_port_33;
output wire [`BW_AXI_ALEN-1:0] rvx_port_43;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_36;
output wire [`BW_AXI_ABURST-1:0] rvx_port_08;
output wire rvx_port_37;
input wire rvx_port_09;

input wire [RVX_GPARA_1-1:0] rvx_port_15;
input wire [RVX_GPARA_3-1:0] rvx_port_11;
input wire [`BW_AXI_RRESP-1:0] rvx_port_10;
input wire rvx_port_28;
input wire rvx_port_32;
output wire rvx_port_19;

`include "motype_lpara.vb"

wire rvx_signal_12;
wire [`BW_AXI_ALEN-1:0] rvx_signal_25;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_08;
wire [`BW_AXI_ABURST-1:0] rvx_signal_22;
wire [`NUM_BYTE(RVX_GPARA_3)-1:0] rvx_signal_10;
wire [RVX_GPARA_3-1:0] rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_02;

wire rvx_signal_16;
wire rvx_signal_24;
wire rvx_signal_21;
wire rvx_signal_15;
wire rvx_signal_20;

localparam  RVX_LPARA_05 = RVX_GPARA_2 + 1;

wire rvx_signal_11;
wire rvx_signal_06;
wire rvx_signal_03;
wire [RVX_LPARA_05-1:0] rvx_signal_09;
wire rvx_signal_13;
wire rvx_signal_14;
wire rvx_signal_00;

localparam  RVX_LPARA_08 = 2;
localparam  RVX_LPARA_03 = 0;
localparam  RVX_LPARA_04 = 1;

localparam  RVX_LPARA_10 = 1<<RVX_LPARA_03;
localparam  RVX_LPARA_01 = 1<<RVX_LPARA_04;

reg [RVX_LPARA_08-1:0] rvx_signal_04;

localparam  RVX_LPARA_02 = 2;
localparam  RVX_LPARA_06 = 0;
localparam  RVX_LPARA_00 = 1;

localparam  RVX_LPARA_09 = 1<<RVX_LPARA_06;
localparam  RVX_LPARA_07 = 1<<RVX_LPARA_00;

reg [RVX_LPARA_02-1:0] rvx_signal_23; 

reg rvx_signal_17;
wire rvx_signal_07;
wire rvx_signal_05;
wire rvx_signal_18;

reg rvx_signal_19;

assign {rvx_signal_12,rvx_signal_25,rvx_signal_08,rvx_signal_22,rvx_signal_10,rvx_signal_01,rvx_signal_02} = rvx_port_14;

assign rvx_signal_16 = rvx_port_37 & rvx_port_09;
assign rvx_signal_24 = rvx_port_32 & rvx_port_19;
assign rvx_signal_21 = rvx_port_34 & rvx_port_17;
assign rvx_signal_15 = rvx_port_20 & rvx_port_23;
assign rvx_signal_20 = rvx_port_35 & rvx_port_22;

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_05)
)
i_rvx_instance_0
(
	.clk(rvx_port_03),
  .rstnn(rvx_port_31),
	.enable(rvx_port_39 & (~EXCLUSIVE_SUPPORTED)),
	.init(rvx_signal_11),
	.up(rvx_signal_06),
	.down(rvx_signal_03),
	.value(rvx_signal_09),
	.is_first_count(rvx_signal_13),
	.is_last_count(rvx_signal_14)
);

assign rvx_signal_11 = rvx_port_24;
assign rvx_signal_06 = rvx_signal_21 | rvx_signal_16;
assign rvx_signal_03 = rvx_signal_20 | (rvx_signal_24&rvx_port_28);
assign rvx_signal_00 = EXCLUSIVE_SUPPORTED | (~rvx_signal_14);

always@(posedge rvx_port_03, negedge rvx_port_31)
begin
  if(rvx_port_31==0)
    rvx_signal_04 <= RVX_LPARA_10;
  else if(rvx_port_24)
    rvx_signal_04 <= RVX_LPARA_10;
  else if(rvx_port_39 & (~EXCLUSIVE_SUPPORTED))
  begin
    if(rvx_signal_13)
    begin
      if(rvx_signal_16|rvx_signal_21)
      begin
        rvx_signal_04[RVX_LPARA_03] <= rvx_signal_16;
        rvx_signal_04[RVX_LPARA_04] <= rvx_signal_21;
      end
    end
  end
end

always@(posedge rvx_port_03, negedge rvx_port_31)
begin
  if(rvx_port_31==0)
    rvx_signal_23 <= RVX_LPARA_09;
  else if(rvx_port_24)
    rvx_signal_23 <= RVX_LPARA_09;
  else if(rvx_port_39 & WRITE_SUPPORTED)
  begin
    if(rvx_signal_21)
      rvx_signal_23 <= RVX_LPARA_07;
    else if(rvx_signal_15&rvx_port_18)
      rvx_signal_23 <= RVX_LPARA_09;
  end
end

always@(*)
begin
  rvx_signal_17 = 0;
  if(WRITE_SUPPORTED)
  begin
    if(EXCLUSIVE_SUPPORTED)
      rvx_signal_17 = rvx_signal_23[RVX_LPARA_06];
    else if(rvx_signal_13|(rvx_signal_04[RVX_LPARA_04]&rvx_signal_00))
      rvx_signal_17 = rvx_signal_23[RVX_LPARA_06];
  end
end

assign rvx_signal_07 = WRITE_SUPPORTED & rvx_signal_23[RVX_LPARA_00];
assign rvx_signal_05 = READ_SUPPORTED & (EXCLUSIVE_SUPPORTED|rvx_signal_13|(rvx_signal_04[RVX_LPARA_03]&rvx_signal_00));
assign rvx_signal_18 = rvx_signal_12? (rvx_signal_07&rvx_port_23) : (rvx_signal_05&rvx_port_09);

assign rvx_port_21[1] = 0;
assign rvx_port_21[0] = rvx_signal_18;

assign rvx_port_44 = 0;
assign rvx_port_05 = rvx_signal_02;
assign rvx_port_00 = rvx_signal_25;
assign rvx_port_02 = rvx_signal_08;
assign rvx_port_04 = rvx_signal_22;
assign rvx_port_34 = rvx_signal_17 & rvx_port_27 & rvx_signal_12;

assign rvx_port_30 = 0;
assign rvx_port_25 = rvx_signal_01;
assign rvx_port_06 = rvx_signal_10;
assign rvx_port_18 = rvx_port_16;
assign rvx_port_20 = rvx_signal_07 & rvx_port_27;

assign rvx_port_38 = 0;
assign rvx_port_33 = rvx_signal_02;
assign rvx_port_43 = rvx_signal_25;
assign rvx_port_36 = rvx_signal_08;
assign rvx_port_08 = rvx_signal_22;
assign rvx_port_37 = rvx_signal_05 & rvx_port_27 & (~rvx_signal_12);

assign rvx_port_22 = WRITE_SUPPORTED & rvx_signal_04[RVX_LPARA_04] & rvx_port_40[0];
assign rvx_port_19 = READ_SUPPORTED & rvx_signal_04[RVX_LPARA_03] & rvx_port_40[0];

always@(*)
begin
  rvx_signal_19 = 0;
  if(WRITE_SUPPORTED)
  begin
    if(EXCLUSIVE_SUPPORTED)
      rvx_signal_19 = 1;
    else
      rvx_signal_19 = rvx_signal_04[RVX_LPARA_04] & (~rvx_signal_13);
  end
end

assign rvx_port_12 = rvx_port_35 | rvx_port_32;
assign rvx_port_07 = 0;
assign rvx_port_42 = rvx_signal_19? 1'b 1 : rvx_port_28;
assign rvx_port_26 = {rvx_signal_19, (rvx_signal_19? rvx_port_13 : rvx_port_10), rvx_port_11};

endmodule
