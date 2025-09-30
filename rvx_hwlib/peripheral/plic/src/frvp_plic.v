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
`include "rvx_include_15.vh"
`include "rvx_include_09.vh"



module FRVP_PLIC
(
	clk,
	rstnn,

	uart_interrupts,
	spi_interrupt,
	i2c_interrupts,
	i2s_interrupt,
	gpio_interrupts,
	wifi_interrupt,
	hbc1_interrupt,
	user_interrupts,
	plic_interrupt,

	rpslverr,
	rpready,
	rprdata,
	rpwdata,
	rpenable,
	rpsel,
	rpwrite,
	rpaddr
);



parameter NUM_UART = 1;
parameter NUM_SPI = 1;
parameter NUM_I2C = 1;
parameter NUM_GPIO = 1;

localparam  RVX_LPARA_4 = 32;
localparam  RVX_LPARA_2 = 32'h 0c000000;

input wire clk;
input wire rstnn;

input wire [31:0] uart_interrupts;
input wire spi_interrupt;
input wire [31:0] i2c_interrupts;
input wire i2s_interrupt;
input wire [31:0] gpio_interrupts;
input wire wifi_interrupt;
input wire hbc1_interrupt;
input wire [31:0] user_interrupts;
output wire plic_interrupt;

output wire rpslverr;
output wire rpready;
output wire [31:0] rprdata;
input wire [31:0] rpwdata;
input wire rpenable;
input wire rpsel;
input wire rpwrite;
input wire [31:0] rpaddr;

genvar i;

localparam  RVX_LPARA_0 = 28;
localparam  RVX_LPARA_1 = 32;
localparam  RVX_LPARA_3 = 10;
localparam  RVX_LPARA_6 = 2;
localparam  RVX_LPARA_5 = 1;

wire rvx_signal_37;
wire rvx_signal_25;
wire [2:0] rvx_signal_22;
wire [2:0] rvx_signal_13;
wire [RVX_LPARA_6-1:0] rvx_signal_26;
wire [RVX_LPARA_3-1:0] rvx_signal_14;
wire [RVX_LPARA_0-1:0] rvx_signal_24;
wire [`BW_AXI_WSTRB(RVX_LPARA_1)-1:0] rvx_signal_28;
wire [RVX_LPARA_1-1:0] rvx_signal_36;

wire rvx_signal_39;
wire rvx_signal_35;
wire [2:0] rvx_signal_15;
wire [1:0] rvx_signal_02;
wire [RVX_LPARA_6-1:0] rvx_signal_00;
wire [RVX_LPARA_3-1:0] rvx_signal_21;
wire [RVX_LPARA_0-1:0] rvx_signal_20;
wire [`BW_AXI_WSTRB(RVX_LPARA_1)-1:0] rvx_signal_33;
wire [RVX_LPARA_1-1:0] rvx_signal_16;

wire rvx_signal_12;
wire rvx_signal_08;
wire [2:0] rvx_signal_41;
wire [2:0] rvx_signal_03;
wire [RVX_LPARA_6-1:0] rvx_signal_38;
wire [RVX_LPARA_3-1:0] rvx_signal_05;
wire [RVX_LPARA_0-1:0] rvx_signal_09;
wire [RVX_LPARA_1-1:0] rvx_signal_06;
wire rvx_signal_30;

wire rvx_signal_11;
wire rvx_signal_10;
wire [2:0] rvx_signal_04;
wire [1:0] rvx_signal_27;
wire [RVX_LPARA_6-1:0] rvx_signal_40;
wire [RVX_LPARA_3-1:0] rvx_signal_31;
wire rvx_signal_07;
wire [RVX_LPARA_5-1:0] rvx_signal_01;
wire [RVX_LPARA_1-1:0] rvx_signal_29;
wire rvx_signal_34;

wire rvx_signal_32;
wire rvx_signal_18;
wire rvx_signal_17;

reg [32-1:0] rvx_signal_19;
wire [32-1:0] rvx_signal_23;

RVX_MODULE_063
#(
	.RVX_GPARA_3(32),
	.RVX_GPARA_6(32),
	.RVX_GPARA_5(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_LPARA_1),
	.RVX_GPARA_4(RVX_LPARA_3),
	.RVX_GPARA_1(RVX_LPARA_6),
	.RVX_GPARA_2(RVX_LPARA_5),
	.RVX_GPARA_7(RVX_LPARA_2),
	.RVX_GPARA_8(22)
)
i_rvx_instance_0
(
	.rvx_port_03(clk),
	.rvx_port_28(rstnn),

	.rvx_port_07(rpsel),
	.rvx_port_14(rpenable),
	.rvx_port_08(rpaddr),
	.rvx_port_25(rpwrite),
	.rvx_port_40(rpwdata),
	.rvx_port_18(rprdata),
	.rvx_port_26(rpready),
	.rvx_port_09(rpslverr),

	.rvx_port_41(rvx_signal_37),
	.rvx_port_30(rvx_signal_25),
	.rvx_port_36(rvx_signal_22),
	.rvx_port_35(rvx_signal_13),
	.rvx_port_43(rvx_signal_26),
	.rvx_port_12(rvx_signal_14),
	.rvx_port_29(rvx_signal_24),
	.rvx_port_22(rvx_signal_28),
	.rvx_port_13(rvx_signal_36),
	.rvx_port_19(rvx_signal_39),
	.rvx_port_47(rvx_signal_35),
	.rvx_port_01(rvx_signal_15),
	.rvx_port_17(rvx_signal_02),
	.rvx_port_42(rvx_signal_00),
	.rvx_port_20(rvx_signal_21),
	.rvx_port_49(rvx_signal_20),
	.rvx_port_32(rvx_signal_33),
	.rvx_port_38(rvx_signal_16),
	.rvx_port_24(rvx_signal_12),
	.rvx_port_23(rvx_signal_08),
	.rvx_port_00(rvx_signal_41),
	.rvx_port_04(rvx_signal_03),
	.rvx_port_44(rvx_signal_38),
	.rvx_port_45(rvx_signal_05),
	.rvx_port_31(rvx_signal_09),
	.rvx_port_21(rvx_signal_06),
	.rvx_port_27(rvx_signal_30),
	.rvx_port_05(rvx_signal_11),
	.rvx_port_06(rvx_signal_10),
	.rvx_port_16(rvx_signal_04),
	.rvx_port_48(rvx_signal_27),
	.rvx_port_46(rvx_signal_40),
	.rvx_port_11(rvx_signal_31),
	.rvx_port_33(rvx_signal_07),
	.rvx_port_10(rvx_signal_01),
	.rvx_port_39(rvx_signal_29),
	.rvx_port_15(rvx_signal_34),
	.rvx_port_02(rvx_signal_32),
	.rvx_port_34(rvx_signal_18),
	.rvx_port_37(rvx_signal_17)
);

RVX_MODULE_042
i_rvx_instance_1
(
  .rvx_port_25(clk),
  .rvx_port_41(~rstnn),

  .rvx_port_26(rvx_signal_23[0]),
  .rvx_port_03(rvx_signal_23[1]),
  .rvx_port_30(rvx_signal_23[2]),
  .rvx_port_35(rvx_signal_23[3]),
  .rvx_port_13(rvx_signal_23[4]),
  .rvx_port_19(rvx_signal_23[5]),
  .rvx_port_29(rvx_signal_23[6]),
  .rvx_port_32(rvx_signal_23[7]),
  .rvx_port_28(rvx_signal_23[8]),
  .rvx_port_17(rvx_signal_23[9]),
  .rvx_port_12(rvx_signal_23[10]),
  .rvx_port_48(rvx_signal_23[11]),
  .rvx_port_37(rvx_signal_23[12]),
  .rvx_port_43(rvx_signal_23[13]),
  .rvx_port_01(rvx_signal_23[14]),
  .rvx_port_09(rvx_signal_23[15]),
  .rvx_port_05(rvx_signal_23[16]),
  .rvx_port_08(rvx_signal_23[17]),
  .rvx_port_11(rvx_signal_23[18]),
  .rvx_port_47(rvx_signal_23[19]),
  .rvx_port_15(rvx_signal_23[20]),
  .rvx_port_07(rvx_signal_23[21]),
  .rvx_port_23(rvx_signal_23[22]),
  .rvx_port_36(rvx_signal_23[23]),
  .rvx_port_10(rvx_signal_23[24]),
  .rvx_port_06(rvx_signal_23[25]),
  .rvx_port_20(rvx_signal_23[26]),
  .rvx_port_44(rvx_signal_23[27]),
  .rvx_port_02(rvx_signal_23[28]),
  .rvx_port_00(rvx_signal_23[29]),
  .rvx_port_21(rvx_signal_23[30]),
  .rvx_port_16(rvx_signal_23[31]),
  .rvx_port_22(plic_interrupt),

	.rvx_port_40(rvx_signal_37),
	.rvx_port_34(rvx_signal_25),
	.rvx_port_18(rvx_signal_22),
	.rvx_port_04(rvx_signal_26),
	.rvx_port_42(rvx_signal_14),
	.rvx_port_45(rvx_signal_24),
	.rvx_port_38(rvx_signal_28),
	.rvx_port_33(rvx_signal_36),
	.rvx_port_31(rvx_signal_11),
	.rvx_port_27(rvx_signal_10),
	.rvx_port_39(rvx_signal_04),
	.rvx_port_14(rvx_signal_40),
	.rvx_port_46(rvx_signal_31),
	.rvx_port_24(rvx_signal_29)
);

assign rvx_signal_35 = 0;
assign rvx_signal_15 = 0;
assign rvx_signal_02 = 0;
assign rvx_signal_00 = 0;
assign rvx_signal_21 = 0;
assign rvx_signal_20 = 0;
assign rvx_signal_33 = 0;
assign rvx_signal_16 = 0;

assign rvx_signal_12 = 0;

assign rvx_signal_27 = 0;
assign rvx_signal_07 = 0;
assign rvx_signal_01 = 0;
assign rvx_signal_34 = 0;

assign rvx_signal_32 = 0;

always@(*)
begin
	rvx_signal_19 = 0;
	rvx_signal_19[`RVX_GDEF_222+`RVX_GDEF_039-1:`RVX_GDEF_222] = gpio_interrupts;
	rvx_signal_19[`RVX_GDEF_345+`RVX_GDEF_110-1:`RVX_GDEF_345] = user_interrupts;
	rvx_signal_19[`RVX_GDEF_400+`RVX_GDEF_034-1:`RVX_GDEF_400] = wifi_interrupt;
	rvx_signal_19[`RVX_GDEF_202+`RVX_GDEF_119-1:`RVX_GDEF_202] = spi_interrupt;
	rvx_signal_19[`RVX_GDEF_182+`RVX_GDEF_167-1:`RVX_GDEF_182] = hbc1_interrupt;
	rvx_signal_19[`RVX_GDEF_423+`RVX_GDEF_021-1:`RVX_GDEF_423] = i2s_interrupt;
	rvx_signal_19[`RVX_GDEF_376+`RVX_GDEF_076-1:`RVX_GDEF_376] = i2c_interrupts;
	rvx_signal_19[`RVX_GDEF_239+`RVX_GDEF_094-1:`RVX_GDEF_239] = uart_interrupts;
end

ERVP_SYNCHRONIZER
#(
	.BW_DATA(32)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_19),
	.synch_value(rvx_signal_23)
);

endmodule
