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
`include "ervp_external_peri_group_memorymap_offset.vh"
`include "platform_info.vh"



module ERVP_EXTERNAL_PERI_GROUP
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,

	tick_1us,
	tick_gpio,

	uart_interrupts,
	spi_interrupt,
	i2c_interrupts,
	gpio_interrupts,
	wifi_interrupt,

	oled_sdcsel_oe,
	oled_sdcsel_oval,
	oled_sdcsel_ival,
	oled_srstnn_oe,
	oled_srstnn_oval,
	oled_srstnn_ival,
	oled_svbat_oe,
	oled_svbat_oval,
	oled_svbat_ival,
	oled_svdd_oe,
	oled_svdd_oval,
	oled_svdd_ival,

	wifi_sitr,
	wifi_srstnn,
	wifi_swp,
	wifi_shibernate,

	spi_common_sclk,
	spi_common_sdq0

`ifdef INCLUDE_GPIO
  ,
  user_pinout_list,
  user_pinin_list
`endif

`ifdef INCLUDE_AIOIF
	,
	aioif_type_list
`endif

`ifdef INCLUDE_UART
	,
	uart_srx_list,
	uart_stx_list
`endif

`ifdef INCLUDE_SPI
	,	
	spi_sclk_list,
	spi_scs_list,
	spi_sdq0_list,
	spi_sdq1_list
`endif

`ifdef INCLUDE_I2C
	,
	i2c_sclk_ival_list,
	i2c_sclk_oval_list,
	i2c_sclk_od_list,
	i2c_sdata_ival_list,
	i2c_sdata_oval_list,
	i2c_sdata_od_list
`endif

`ifdef INCLUDE_GPIO
	,
	gpio_swenable_list,
	gpio_swdata_list,
	gpio_srenable_list,
	gpio_srdata_list,
  gpio_suser_pinout_list,
  gpio_suser_pinin_list,
	gpio_sinterrupt_list
`endif

);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;

parameter NUM_UART = 1;
parameter NUM_SPI = 1;
parameter NUM_I2C = 1;
parameter NUM_GPIO = 1;
parameter NUM_AIOIF = 1;

localparam  RVX_LPARA_0 = 15;

localparam  RVX_LPARA_5 = 4;
localparam  RVX_LPARA_4 = 4;

localparam  RVX_LPARA_1 = `NUM_ERVP_EXTERNAL_PERI_GROUP_SUBMODULE;
localparam  RVX_LPARA_2 = `BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1;
localparam  RVX_LPARA_3 = `BW_SEL_ERVP_EXTERNAL_PERI_GROUP_SUBMODULE;

input wire clk;
input wire rstnn;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

input wire tick_1us;
output wire tick_gpio;

output wire [31:0] uart_interrupts;
output wire spi_interrupt;
output wire [31:0] i2c_interrupts;
output wire [31:0] gpio_interrupts;
output wire wifi_interrupt;

output wire [1-1:0] oled_sdcsel_oe;
output wire [1-1:0] oled_sdcsel_oval;
input wire [1-1:0] oled_sdcsel_ival;

output wire [1-1:0] oled_srstnn_oe;
output wire [1-1:0] oled_srstnn_oval;
input wire [1-1:0] oled_srstnn_ival;

output wire [1-1:0] oled_svbat_oe;
output wire [1-1:0] oled_svbat_oval;
input wire [1-1:0] oled_svbat_ival;

output wire [1-1:0] oled_svdd_oe;
output wire [1-1:0] oled_svdd_oval;
input wire [1-1:0] oled_svdd_ival;

input wire wifi_sitr;
output wire wifi_srstnn;
output wire wifi_swp;
output wire wifi_shibernate;

output wire	spi_common_sclk;
output wire spi_common_sdq0;

`ifdef INCLUDE_GPIO
input wire [`BW_GPIO_VALUE*NUM_GPIO-1:0] user_pinout_list;
output wire [`BW_GPIO_VALUE*NUM_GPIO-1:0] user_pinin_list;
`endif

`ifdef INCLUDE_AIOIF
output wire [`BW_AIOIF_TYPE*NUM_AIOIF-1:0] aioif_type_list;
`endif

`ifdef INCLUDE_UART
input wire [NUM_UART-1:0] uart_srx_list;
output wire [NUM_UART-1:0] uart_stx_list;
`endif

`ifdef INCLUDE_SPI
output wire	[NUM_SPI-1:0] spi_sclk_list;
output wire	[NUM_SPI-1:0] spi_scs_list;
output wire [NUM_SPI-1:0] spi_sdq0_list;
input wire [NUM_SPI-1:0] spi_sdq1_list;
`endif

`ifdef INCLUDE_I2C
input wire [NUM_I2C-1:0] i2c_sclk_ival_list;
output wire [NUM_I2C-1:0] i2c_sclk_oval_list;
output wire [NUM_I2C-1:0] i2c_sclk_od_list;
input wire [NUM_I2C-1:0] i2c_sdata_ival_list;
output wire [NUM_I2C-1:0] i2c_sdata_oval_list;
output wire [NUM_I2C-1:0] i2c_sdata_od_list;
`endif

`ifdef INCLUDE_GPIO
output wire [NUM_GPIO-1:0] gpio_swenable_list;
output wire [BW_DATA*NUM_GPIO-1:0] gpio_swdata_list;
output wire [NUM_GPIO-1:0] gpio_srenable_list;
input wire [BW_DATA*NUM_GPIO-1:0] gpio_srdata_list;
output wire [`BW_GPIO_VALUE*NUM_GPIO-1:0] gpio_suser_pinout_list;
input wire [`BW_GPIO_VALUE*NUM_GPIO-1:0] gpio_suser_pinin_list;
input wire [NUM_GPIO-1:0] gpio_sinterrupt_list;
`endif

genvar i;

wire [RVX_LPARA_1*BW_ADDR-1:0] rvx_signal_30;
wire [RVX_LPARA_1-1:0] rvx_signal_31;
wire [RVX_LPARA_1-1:0] rvx_signal_68;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_64;
wire [RVX_LPARA_1-1:0] rvx_signal_79;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_39;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_10;
wire [RVX_LPARA_1-1:0] rvx_signal_54;
wire [RVX_LPARA_1-1:0] rvx_signal_04;

wire [BW_ADDR-1:0] rvx_signal_77 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_14;
wire [RVX_LPARA_1-1:0] rvx_signal_62;
wire [BW_ADDR-1:0] rvx_signal_15 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_24;
wire [BW_DATA-1:0] rvx_signal_56 [RVX_LPARA_1-1:0];
wire [BW_DATA-1:0] rvx_signal_06 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_20;

wire [16-1:0] rvx_signal_19;
wire rvx_signal_01;
wire [RVX_LPARA_0-1:0] rvx_signal_28;

`ifdef INCLUDE_UART
wire [NUM_UART-1:0] rvx_signal_81;
wire [NUM_UART-1:0] rvx_signal_85;
wire [NUM_UART-1:0] rvx_signal_02;
wire [NUM_UART-1:0] rvx_signal_23;
wire [NUM_UART-1:0] rvx_signal_87;
wire [NUM_UART-1:0] rvx_signal_09;
wire [NUM_UART-1:0] rvx_signal_27;
wire [NUM_UART-1:0] rvx_signal_35;
`endif

`ifdef INCLUDE_SPI
wire rvx_signal_13;
wire rvx_signal_59;

wire rvx_signal_57;
wire rvx_signal_53;
wire rvx_signal_49;
wire rvx_signal_40;
wire rvx_signal_34;
wire rvx_signal_50;
wire rvx_signal_43;
wire rvx_signal_63;
wire rvx_signal_25;
wire rvx_signal_08;
wire rvx_signal_65;
wire rvx_signal_32;

wire [NUM_SPI-1:0] rvx_signal_55;
wire [NUM_SPI-1:0] rvx_signal_71;
wire [NUM_SPI-1:0] rvx_signal_67;
wire [NUM_SPI-1:0] rvx_signal_82;
wire [NUM_SPI-1:0] rvx_signal_44;
wire [NUM_SPI-1:0] rvx_signal_61;
wire [NUM_SPI-1:0] rvx_signal_05;
wire [NUM_SPI-1:0] rvx_signal_47;
wire [NUM_SPI-1:0] rvx_signal_69;
wire [NUM_SPI-1:0] rvx_signal_21;
wire [NUM_SPI-1:0] rvx_signal_75;
wire [NUM_SPI-1:0] rvx_signal_84;

`endif

wire [16-1:0] rvx_signal_66;
wire [(32)*(16)-1:0] rvx_signal_17;
wire [16-1:0] rvx_signal_46;
wire [(32)*(16)-1:0] rvx_signal_48;

wire [1-1:0] rvx_signal_76;
wire [1-1:0] rvx_signal_16;
wire [1-1:0] rvx_signal_36;
wire rvx_signal_26;

wire [1-1:0] rvx_signal_37;
wire [1-1:0] rvx_signal_18;
wire [1-1:0] rvx_signal_22;
wire rvx_signal_42;

wire [1-1:0] rvx_signal_52;
wire [1-1:0] rvx_signal_80;
wire [1-1:0] rvx_signal_86;
wire rvx_signal_11;

wire [1-1:0] rvx_signal_03;
wire [1-1:0] rvx_signal_70;
wire [1-1:0] rvx_signal_29;
wire rvx_signal_83;

wire [1-1:0] rvx_signal_72;

wire [1-1:0] rvx_signal_12;

wire [1-1:0] rvx_signal_58;

wire rvx_signal_73;

wire [1-1:0] rvx_signal_38;

wire [32-1:0] rvx_signal_00;

wire [32-1:0] rvx_signal_41;

wire rvx_signal_74;
wire [32-1:0] rvx_signal_45;

wire [4-1:0] rvx_signal_78;

`ifdef INCLUDE_AIOIF
reg [`BW_AIOIF_TYPE-1:0] rvx_signal_33[NUM_AIOIF-1:0];
`endif

`ifdef INCLUDE_WIFI
wire [`BW_ERVP_TRIGGER_COND-1:0] rvx_signal_51;
wire rvx_signal_60;
`endif

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_1),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_2),
	.BW_SEL_INDEX(RVX_LPARA_3)
)
i_rvx_instance_00
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rpsel),
	.rpenable(rpenable),
	.rpaddr(rpaddr),
	.rpwrite(rpwrite),
	.rpwdata(rpwdata),
	.rprdata(rprdata),
	.rpready(rpready),
	.rpslverr(rpslverr),
	.rpbaseaddr_list(rvx_signal_30),

	.spsel_list(rvx_signal_31),
	.spenable_list(rvx_signal_68),
	.spaddr_list(rvx_signal_64),
	.spwrite_list(rvx_signal_79),
	.spwdata_list(rvx_signal_39),
	.sprdata_list(rvx_signal_10),
	.spready_list(rvx_signal_54),
	.spslverr_list(rvx_signal_04)
);

generate
for(i=0; i<RVX_LPARA_1; i=i+1)
begin : i_split_and_merge_submodule
  assign rvx_signal_30[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_77[i];
  assign rvx_signal_14[i] = rvx_signal_31[i];
  assign rvx_signal_62[i] = rvx_signal_68[i];
  assign rvx_signal_15[i] = rvx_signal_64[BW_ADDR*(i+1)-1 -:BW_ADDR];
  assign rvx_signal_24[i] = rvx_signal_79[i];
  assign rvx_signal_56[i] = rvx_signal_39[BW_DATA*(i+1)-1 -:BW_DATA];
  assign rvx_signal_10[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_06[i];
  assign rvx_signal_54[i] = rvx_signal_07[i];
  assign rvx_signal_04[i] = rvx_signal_20[i];
end
endgenerate

assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_UART0;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART1] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_UART1;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART2] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_UART2;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART3] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_UART3;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_I2C0;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C1] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_I2C1;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C2] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_I2C2;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C3] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_I2C3;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_SPI;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_GPIO;
assign rvx_signal_77[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO] = `SUBMODULE_ADDR_ERVP_EXTERNAL_PERI_GROUP_SPIO;

RVX_MODULE_110
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA)
)
i_rvx_instance_03
(
	.rvx_port_02(clk),
	.rvx_port_08(rstnn),

	.rvx_port_07(rvx_signal_14[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_05(rvx_signal_62[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_09(rvx_signal_15[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_00(rvx_signal_24[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_04(rvx_signal_56[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_12(rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_01(rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),
	.rvx_port_06(rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_EPG_MISC]),

	.rvx_port_10(1'b 0),
	.rvx_port_11(rvx_signal_19),
	.rvx_port_03()
);

assign {rvx_signal_28,rvx_signal_01} = rvx_signal_19;

RVX_MODULE_061
#(
	.RVX_GPARA_0(RVX_LPARA_0)
)
i_rvx_instance_05
(
	.rvx_port_2(clk),
	.rvx_port_4(rstnn),
	.rvx_port_5(rvx_signal_01),
	.rvx_port_0(tick_1us),
	.rvx_port_1(rvx_signal_28),
	.rvx_port_3(tick_gpio)
);

`ifdef INCLUDE_UART
generate
for(i=0; i<NUM_UART; i=i+1)
begin : i_gen_valid_uart
  RVX_MODULE_112
  i_rvx_instance_01
  (
    .rvx_port_05(~rstnn),
    .rvx_port_17(clk),
    .rvx_port_12(rvx_signal_15[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_10(rvx_signal_14[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_15(rvx_signal_62[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_16(rvx_signal_24[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_09(rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_03(rvx_signal_56[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_18(rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_08(rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i]),
    .rvx_port_07(rvx_signal_81[i]),
    .rvx_port_19(uart_srx_list[i]),
    .rvx_port_06(uart_stx_list[i]),
    .rvx_port_14(rvx_signal_85[i]),
    .rvx_port_13(rvx_signal_02[i]),
    .rvx_port_02(rvx_signal_23[i]),
    .rvx_port_11(rvx_signal_87[i]),
    .rvx_port_00(rvx_signal_09[i]),
    .rvx_port_04(rvx_signal_27[i]),
    .rvx_port_01(rvx_signal_35[i])
  );
end
endgenerate

assign uart_interrupts[NUM_UART-1:0] = rvx_signal_81[NUM_UART-1:0];
assign uart_interrupts[32-1:NUM_UART] = 0;

`endif

generate
for(i=NUM_UART; i<RVX_LPARA_5; i=i+1)
begin : i_gen_invalid_uart
  assign rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i] = 0;
  assign rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i] = 0;
  assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_UART0+i] = 1;
end
endgenerate

assign rvx_signal_02 = 0;
assign rvx_signal_87 = 0;
assign rvx_signal_09 = 0;
assign rvx_signal_27 = 0;

`ifdef INCLUDE_SPI

FRVP_SPI
i_rvx_instance_08
(
	.clk(clk),
	.rstnn(rstnn),
	.rpaddr(rvx_signal_15[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rpsel(rvx_signal_14[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rpenable(rvx_signal_62[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rpwrite(rvx_signal_24[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rprdata(rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rpwdata(rvx_signal_56[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rpready(rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.rpslverr(rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI]),
	.interrupt(spi_interrupt),
	.spi_clk(rvx_signal_13),
	.spi_cs(rvx_signal_59),
	.spi_dq0_in(rvx_signal_57),
	.spi_dq0_out(rvx_signal_53),
	.spi_dq0_oe(rvx_signal_49),
	.spi_dq1_in(rvx_signal_40),
	.spi_dq1_out(rvx_signal_34),
	.spi_dq1_oe(rvx_signal_50),
	.spi_dq2_in(rvx_signal_43),
	.spi_dq2_out(rvx_signal_63),
	.spi_dq2_oe(rvx_signal_25),
	.spi_dq3_in(rvx_signal_08),
	.spi_dq3_out(rvx_signal_65),
	.spi_dq3_oe(rvx_signal_32)
);

assign rvx_signal_57 = 0;
assign rvx_signal_43 = 0;
assign rvx_signal_08 = 0;

`else

assign rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI] = 0;
assign rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI] = 0;
assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPI] = 1;
assign spi_interrupt = 0;

`endif

`ifdef INCLUDE_I2C
generate
for(i=0; i<NUM_I2C; i=i+1)
begin : i_gen_valid_i2c
  RVX_MODULE_106
  i_rvx_instance_07
  (
    .rvx_port_11(clk),
    .rvx_port_03(rstnn),
    .rvx_port_06(rvx_signal_15[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_16(rvx_signal_14[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_09(rvx_signal_62[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_13(rvx_signal_24[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_01(rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_02(rvx_signal_56[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_00(rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_10(rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i]),
    .rvx_port_05(i2c_interrupts[i]),
    .rvx_port_08(i2c_sclk_ival_list[i]),
    .rvx_port_14(i2c_sclk_oval_list[i]),
    .rvx_port_04(i2c_sclk_od_list[i]),
    .rvx_port_12(i2c_sdata_ival_list[i]),
    .rvx_port_15(i2c_sdata_oval_list[i]),
    .rvx_port_07(i2c_sdata_od_list[i])
  );
end
endgenerate

assign i2c_interrupts[32-1:NUM_I2C] = 0;

generate
for(i=NUM_I2C; i<RVX_LPARA_4; i=i+1)
begin : i_gen_invalid_i2c
  assign rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i] = 0;
  assign rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i] = 0;
  assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i] = 1;
end
endgenerate
`else
generate
for(i=0; i<RVX_LPARA_4; i=i+1)
begin : i_gen_invalid_i2c
  assign rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i] = 0;
  assign rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i] = 0;
  assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_I2C0+i] = 1;
end
endgenerate
assign i2c_interrupts = 0;
`endif

`ifdef INCLUDE_GPIO

RVX_MODULE_023
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA)
)
i_rvx_instance_04
(
	.rvx_port_05(clk),
	.rvx_port_11(rstnn),

	.rvx_port_09(rvx_signal_14[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_08(rvx_signal_62[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_10(rvx_signal_15[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_02(rvx_signal_24[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_06(rvx_signal_56[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_01(rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_14(rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),
	.rvx_port_12(rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO]),

	.rvx_port_07(tick_gpio),
	.rvx_port_03(rvx_signal_66),
	.rvx_port_00(rvx_signal_17),
	.rvx_port_13(rvx_signal_46),
	.rvx_port_04(rvx_signal_48)
);

assign gpio_swenable_list = rvx_signal_46;
assign gpio_swdata_list = rvx_signal_48;
assign gpio_srenable_list = rvx_signal_66;
assign rvx_signal_17 = gpio_srdata_list;

assign gpio_suser_pinout_list = user_pinout_list;
assign user_pinin_list = gpio_suser_pinin_list;

assign gpio_interrupts[NUM_GPIO-1:0] = gpio_sinterrupt_list;
assign gpio_interrupts[32-1:NUM_GPIO] = 0;

`else
assign rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO] = 0;
assign rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO] = 0;
assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_GPIO] = 1;
assign gpio_interrupts = 0;
`endif

RVX_MODULE_038
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA)
)
i_rvx_instance_09
(
	.rvx_port_35(clk),
	.rvx_port_06(rstnn),

	.rvx_port_07(rvx_signal_14[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_31(rvx_signal_62[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_17(rvx_signal_15[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_15(rvx_signal_24[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_22(rvx_signal_56[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_33(rvx_signal_06[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_03(rvx_signal_07[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),
	.rvx_port_01(rvx_signal_20[`SUBMODULE_INDEX_ERVP_EXTERNAL_PERI_GROUP_SPIO]),

	.rvx_port_23(tick_gpio),
	.rvx_port_08(rvx_signal_76),
	.rvx_port_10(rvx_signal_16),
	.rvx_port_19(rvx_signal_36),
	.rvx_port_16(rvx_signal_26),
	.rvx_port_32(rvx_signal_37),
	.rvx_port_04(rvx_signal_18),
	.rvx_port_34(rvx_signal_22),
	.rvx_port_02(rvx_signal_42),
	.rvx_port_28(rvx_signal_52),
	.rvx_port_00(rvx_signal_80),
	.rvx_port_27(rvx_signal_86),
	.rvx_port_25(rvx_signal_11),
	.rvx_port_09(rvx_signal_03),
	.rvx_port_05(rvx_signal_70),
	.rvx_port_18(rvx_signal_29),
	.rvx_port_12(rvx_signal_83),
	.rvx_port_20(rvx_signal_72),
	.rvx_port_29(rvx_signal_12),
	.rvx_port_21(rvx_signal_58),
	.rvx_port_14(rvx_signal_73),
	.rvx_port_30(rvx_signal_38),
	.rvx_port_11(rvx_signal_00),
	.rvx_port_26(rvx_signal_41),
	.rvx_port_36(rvx_signal_74),
  .rvx_port_13(rvx_signal_45),
	.rvx_port_24(rvx_signal_78)
);

`ifdef INCLUDE_AIOIF

generate
for(i=0; i<NUM_AIOIF; i=i+1)
begin : i_gen_aioif_config
  always@(posedge clk, negedge rstnn)
  begin
    if(rstnn==0)
      rvx_signal_33[i] <= 0;
    else if(rvx_signal_74 && rvx_signal_45[16+i])
      rvx_signal_33[i] <= rvx_signal_45;
  end
  assign aioif_type_list[`BW_AIOIF_TYPE*(i+1)-1-:`BW_AIOIF_TYPE] = rvx_signal_33[i];
end
endgenerate

`endif

`ifdef INCLUDE_SPI

assign spi_common_sclk = rvx_signal_78[`SPIO_SERIAL_COMM_CONTROL_INDEX_SPI_CLK_USER_OE]? rvx_signal_78[`SPIO_SERIAL_COMM_CONTROL_INDEX_SPI_CLK_USER_VALUE] : rvx_signal_13;
assign spi_common_sdq0 = rvx_signal_78[`SPIO_SERIAL_COMM_CONTROL_INDEX_SPI_DQ0_USER_OE]? rvx_signal_78[`SPIO_SERIAL_COMM_CONTROL_INDEX_SPI_DQ0_USER_VALUE] : rvx_signal_53;

generate
for(i=0; i<NUM_SPI; i=i+1)
begin : i_gen_sclk
  assign spi_sclk_list[i] = spi_common_sclk;
end
endgenerate

generate
for(i=0; i<NUM_SPI; i=i+1)
begin : i_gen_scs
  assign spi_scs_list[i] = rvx_signal_41[i]? (rvx_signal_00[i]? rvx_signal_59 : ~rvx_signal_59) : rvx_signal_00[i];
end
endgenerate

generate
for(i=0; i<NUM_SPI; i=i+1)
begin : i_gen_sdq0
  assign spi_sdq0_list[i] = spi_common_sdq0;
end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(1),
	.NUM_DATA(NUM_SPI)
)
i_rvx_instance_02
(
	.data_input_list(spi_sdq1_list),
	.select(rvx_signal_41[NUM_SPI-1:0]),
	.data_output(rvx_signal_40)
);

`else

assign spi_common_sclk = 0;
assign spi_common_sdq0 = 0;

`endif

`ifdef INCLUDE_OLED

assign oled_sdcsel_oe = rvx_signal_76;
assign oled_sdcsel_oval = rvx_signal_16;
assign rvx_signal_36 = oled_sdcsel_ival;

assign oled_srstnn_oe = rvx_signal_37;
assign oled_srstnn_oval = rvx_signal_18;
assign rvx_signal_22 = oled_srstnn_ival;

assign oled_svbat_oe = rvx_signal_52;
assign oled_svbat_oval = rvx_signal_80;
assign rvx_signal_86 = oled_svbat_ival;

assign oled_svdd_oe = rvx_signal_03;
assign oled_svdd_oval = rvx_signal_70;
assign rvx_signal_29 = oled_svdd_ival;

`else

assign oled_sdcsel_oe = 0;
assign oled_sdcsel_oval = 0;
assign rvx_signal_36 = 0;

assign oled_srstnn_oe = 0;
assign oled_srstnn_oval = 0;
assign rvx_signal_22 = 0;

assign oled_svbat_oe = 0;
assign oled_svbat_oval = 0;
assign rvx_signal_86 = 0;

assign oled_svdd_oe = 0;
assign oled_svdd_oval = 0;
assign rvx_signal_29 = 0;

`endif

`ifdef INCLUDE_WIFI

assign wifi_srstnn = rvx_signal_72;
assign wifi_swp = rvx_signal_12;
assign wifi_shibernate = rvx_signal_58;

RVX_MODULE_096
#(
  .RVX_GPARA_0(1)
)
i_rvx_instance_06
(
	.rvx_port_5(clk),
	.rvx_port_6(rstnn),
	.rvx_port_7(1'b 1),
	.rvx_port_0(rvx_signal_73),
  .rvx_port_8(1'b 0),
	.rvx_port_3(rvx_signal_51),
	.rvx_port_4(wifi_sitr),
  .rvx_port_1(1'b 0),
	.rvx_port_2(rvx_signal_60)
);

assign rvx_signal_51 = `ERVP_TRIGGER_COND_LOW;
assign wifi_interrupt = rvx_signal_60 & (~rvx_signal_38);
`else

assign wifi_srstnn = 0;
assign wifi_swp = 0;
assign wifi_shibernate = 0;

assign wifi_interrupt = 0;

`endif

endmodule
