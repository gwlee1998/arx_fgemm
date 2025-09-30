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
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_038
(
	rvx_port_35,
	rvx_port_06,

	rvx_port_07,
	rvx_port_31,
	rvx_port_17,
	rvx_port_15,
	rvx_port_22,
	rvx_port_33,
	rvx_port_03,
	rvx_port_01,

	rvx_port_23,
	rvx_port_08,
	rvx_port_10,
	rvx_port_19,
	rvx_port_16,
	rvx_port_32,
	rvx_port_04,
	rvx_port_34,
	rvx_port_02,
	rvx_port_28,
	rvx_port_00,
	rvx_port_27,
	rvx_port_25,
	rvx_port_09,
	rvx_port_05,
	rvx_port_18,
	rvx_port_12,
	rvx_port_20,
	rvx_port_29,
	rvx_port_21,
	rvx_port_14,
	rvx_port_30,
	rvx_port_11,
	rvx_port_26,
	rvx_port_36,
	rvx_port_13,
	rvx_port_24
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_35, rvx_port_06;
input wire rvx_port_07;
input wire rvx_port_31;
input wire [RVX_GPARA_0-1:0] rvx_port_17;
input wire rvx_port_15;
input wire [RVX_GPARA_2-1:0] rvx_port_22;
output wire [RVX_GPARA_2-1:0] rvx_port_33;
output reg rvx_port_03;
output reg rvx_port_01;

input wire rvx_port_23;

output wire [1-1:0] rvx_port_08;
output wire [1-1:0] rvx_port_10;
input wire [1-1:0] rvx_port_19;
output wire rvx_port_16;

output wire [1-1:0] rvx_port_32;
output wire [1-1:0] rvx_port_04;
input wire [1-1:0] rvx_port_34;
output wire rvx_port_02;

output wire [1-1:0] rvx_port_28;
output wire [1-1:0] rvx_port_00;
input wire [1-1:0] rvx_port_27;
output wire rvx_port_25;

output wire [1-1:0] rvx_port_09;
output wire [1-1:0] rvx_port_05;
input wire [1-1:0] rvx_port_18;
output wire rvx_port_12;

output wire [1-1:0] rvx_port_20;

output wire [1-1:0] rvx_port_29;

output wire [1-1:0] rvx_port_21;

output wire rvx_port_14;

output wire [1-1:0] rvx_port_30;

output wire [32-1:0] rvx_port_11;

output wire [32-1:0] rvx_port_26;

output wire rvx_port_36;
output wire [32-1:0] rvx_port_13;

output wire [4-1:0] rvx_port_24;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_69;
reg [RVX_GPARA_2-1:0] rvx_signal_81;
wire rvx_signal_29;
wire rvx_signal_43;
wire rvx_signal_67;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_17;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_18;
wire [RVX_GPARA_0-1:0] rvx_signal_23;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_76;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_70;
wire [RVX_GPARA_2-1:0] rvx_signal_80;
reg rvx_signal_64;
wire [RVX_GPARA_2-1:0] rvx_signal_61;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
wire rvx_signal_12;
reg rvx_signal_09;
wire [RVX_GPARA_2-1:0] rvx_signal_74;
reg rvx_signal_16;
wire [RVX_GPARA_2-1:0] rvx_signal_37;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
wire rvx_signal_33;
reg rvx_signal_50;
wire [RVX_GPARA_2-1:0] rvx_signal_68;
reg rvx_signal_19;
wire [RVX_GPARA_2-1:0] rvx_signal_04;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
wire rvx_signal_17;
reg rvx_signal_51;
wire [RVX_GPARA_2-1:0] rvx_signal_54;
reg rvx_signal_59;
wire [RVX_GPARA_2-1:0] rvx_signal_13;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
wire rvx_signal_39;
reg rvx_signal_44;
wire [1-1:0] rvx_signal_36;
reg rvx_signal_28;
wire [1-1:0] rvx_signal_32;
wire rvx_signal_02;
reg [1-1:0] rvx_signal_58;
reg rvx_signal_38;
wire [1-1:0] rvx_signal_06;
reg rvx_signal_40;
wire [1-1:0] rvx_signal_83;
wire rvx_signal_75;
reg [1-1:0] rvx_signal_47;
reg rvx_signal_71;
wire [1-1:0] rvx_signal_21;
reg rvx_signal_60;
wire [1-1:0] rvx_signal_45;
wire rvx_signal_25;
reg [1-1:0] rvx_signal_65;
reg rvx_signal_82;
wire [1-1:0] rvx_signal_05;
reg rvx_signal_49;
wire [1-1:0] rvx_signal_14;
wire rvx_signal_57;
reg rvx_signal_73;
wire [1-1:0] rvx_signal_79;
reg rvx_signal_63;
wire [1-1:0] rvx_signal_30;
wire rvx_signal_55;
reg [1-1:0] rvx_signal_01;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_85;
reg rvx_signal_78;
wire [32-1:0] rvx_signal_03;
wire rvx_signal_15;
reg [32-1:0] rvx_signal_53;
reg rvx_signal_62;
wire [32-1:0] rvx_signal_08;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_84;
wire rvx_signal_26;
reg [32-1:0] rvx_signal_20;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_52;
reg rvx_signal_72;
wire [32-1:0] rvx_signal_48;
wire rvx_signal_24;
reg rvx_signal_46;
wire [4-1:0] rvx_signal_35;
reg rvx_signal_42;
wire [4-1:0] rvx_signal_11;
wire rvx_signal_34;
reg [4-1:0] rvx_signal_00;

assign rvx_signal_69 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_22);
assign rvx_port_33 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_81);
assign {rvx_signal_23,rvx_signal_76} = paddr_offset;
assign rvx_signal_18 = {rvx_signal_23,addr_unused};
assign rvx_signal_67 = (rvx_signal_76==0);
assign rvx_signal_29 = rvx_port_07 & rvx_port_31 & rvx_signal_67 & (~rvx_port_15);
assign rvx_signal_43 = rvx_port_07 & rvx_port_31 & rvx_signal_67 & rvx_port_15;

assign rvx_signal_61 = $unsigned(rvx_port_22);
assign rvx_signal_37 = $unsigned(rvx_port_22);
assign rvx_signal_04 = $unsigned(rvx_port_22);
assign rvx_signal_13 = $unsigned(rvx_port_22);
assign rvx_signal_32 = $unsigned(rvx_port_22);
assign rvx_signal_83 = $unsigned(rvx_port_22);
assign rvx_signal_45 = $unsigned(rvx_port_22);
assign rvx_signal_14 = $unsigned(rvx_port_22);
assign rvx_signal_30 = $unsigned(rvx_port_22);
assign rvx_signal_03 = $unsigned(rvx_port_22);
assign rvx_signal_84 = $unsigned(rvx_port_22);
assign rvx_signal_48 = $unsigned(rvx_port_22);
assign rvx_signal_11 = $unsigned(rvx_port_22);

always@(*)
begin
	rvx_port_01 = 0;
	rvx_signal_81 = 0;
	rvx_port_03 = 1;

	rvx_signal_70 = 0;
	rvx_signal_64 = 0;

	rvx_signal_09 = 0;
	rvx_signal_16 = 0;

	rvx_signal_50 = 0;
	rvx_signal_19 = 0;

	rvx_signal_51 = 0;
	rvx_signal_59 = 0;

	rvx_signal_44 = 0;
	rvx_signal_28 = 0;

	rvx_signal_38 = 0;
	rvx_signal_40 = 0;

	rvx_signal_71 = 0;
	rvx_signal_60 = 0;

	rvx_signal_82 = 0;
	rvx_signal_49 = 0;

	rvx_signal_73 = 0;
	rvx_signal_63 = 0;

	rvx_signal_41 = 0;
	rvx_signal_78 = 0;

	rvx_signal_62 = 0;
	rvx_signal_10 = 0;

	rvx_signal_56 = 0;
	rvx_signal_72 = 0;

	rvx_signal_46 = 0;
	rvx_signal_42 = 0;

	if(rvx_port_07==1'b 1)
	begin
		case(rvx_signal_18)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_70 = rvx_signal_29;
				rvx_signal_64 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_80);
				rvx_port_03 = rvx_signal_12;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_09 = rvx_signal_29;
				rvx_signal_16 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_74);
				rvx_port_03 = rvx_signal_33;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_50 = rvx_signal_29;
				rvx_signal_19 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_68);
				rvx_port_03 = rvx_signal_17;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_51 = rvx_signal_29;
				rvx_signal_59 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_54);
				rvx_port_03 = rvx_signal_39;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_44 = rvx_signal_29;
				rvx_signal_28 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_36);
				rvx_port_03 = rvx_signal_02;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_38 = rvx_signal_29;
				rvx_signal_40 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_06);
				rvx_port_03 = rvx_signal_75;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_71 = rvx_signal_29;
				rvx_signal_60 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_21);
				rvx_port_03 = rvx_signal_25;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_82 = rvx_signal_29;
				rvx_signal_49 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_05);
				rvx_port_03 = rvx_signal_57;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_73 = rvx_signal_29;
				rvx_signal_63 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_79);
				rvx_port_03 = rvx_signal_55;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_ACTIVE_LOW:
			begin
				rvx_signal_41 = rvx_signal_29;
				rvx_signal_78 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_85);
				rvx_port_03 = rvx_signal_15;
			end
			`MMAP_OFFSET_SPIO_SPI_SELECT:
			begin
				rvx_signal_62 = rvx_signal_29;
				rvx_signal_10 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_08);
				rvx_port_03 = rvx_signal_26;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_56 = rvx_signal_29;
				rvx_signal_72 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_52);
				rvx_port_03 = rvx_signal_24;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_46 = rvx_signal_29;
				rvx_signal_42 = rvx_signal_43;
				rvx_signal_81 = $unsigned(rvx_signal_35);
				rvx_port_03 = rvx_signal_34;
			end
			default:
				rvx_port_01 = 1;
		endcase
	end
end

ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_2),
	.BW_GPIO(1)
)
i_rvx_instance_0
(
	.clk(rvx_port_35),
	.rstnn(rvx_port_06),
	.rwenable(rvx_signal_64),
	.rwdata(rvx_signal_61),
	.rrenable(rvx_signal_70),
	.rrdata(rvx_signal_80),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_16),
	.tick_gpio(rvx_port_23),
	.gpio_soe(rvx_port_08),
	.gpio_soval(rvx_port_10),
	.gpio_sival(rvx_port_19)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_2),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_35),
	.rstnn(rvx_port_06),
	.rwenable(rvx_signal_16),
	.rwdata(rvx_signal_37),
	.rrenable(rvx_signal_09),
	.rrdata(rvx_signal_74),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_02),
	.tick_gpio(rvx_port_23),
	.gpio_soe(rvx_port_32),
	.gpio_soval(rvx_port_04),
	.gpio_sival(rvx_port_34)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_2),
	.BW_GPIO(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_35),
	.rstnn(rvx_port_06),
	.rwenable(rvx_signal_19),
	.rwdata(rvx_signal_04),
	.rrenable(rvx_signal_50),
	.rrdata(rvx_signal_68),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_25),
	.tick_gpio(rvx_port_23),
	.gpio_soe(rvx_port_28),
	.gpio_soval(rvx_port_00),
	.gpio_sival(rvx_port_27)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_2),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_35),
	.rstnn(rvx_port_06),
	.rwenable(rvx_signal_59),
	.rwdata(rvx_signal_13),
	.rrenable(rvx_signal_51),
	.rrdata(rvx_signal_54),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_12),
	.tick_gpio(rvx_port_23),
	.gpio_soe(rvx_port_09),
	.gpio_soval(rvx_port_05),
	.gpio_sival(rvx_port_18)
);
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_58 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_28==1'b 1)
		rvx_signal_58 <= rvx_signal_32;
end
assign rvx_signal_36 = rvx_signal_58;
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_47 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_40==1'b 1)
		rvx_signal_47 <= rvx_signal_83;
end
assign rvx_signal_06 = rvx_signal_47;
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_65 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_60==1'b 1)
		rvx_signal_65 <= rvx_signal_45;
end
assign rvx_signal_21 = rvx_signal_65;
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_01 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_63==1'b 1)
		rvx_signal_01 <= rvx_signal_30;
end
assign rvx_signal_79 = rvx_signal_01;
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_53 <= `SPIO_SPI_CS_ACTIVE_LOW_DEFAULT_VALUE;
	else if (rvx_signal_78==1'b 1)
		rvx_signal_53 <= rvx_signal_03;
end
assign rvx_signal_85 = rvx_signal_53;
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_20 <= `SPIO_SPI_SELECT_DEFAULT_VALUE;
	else if (rvx_signal_10==1'b 1)
		rvx_signal_20 <= rvx_signal_84;
end
assign rvx_signal_08 = rvx_signal_20;
always@(posedge rvx_port_35, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_00 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_42==1'b 1)
		rvx_signal_00 <= rvx_signal_11;
end
assign rvx_signal_35 = rvx_signal_00;
assign rvx_signal_12 = 1;
assign rvx_signal_33 = 1;
assign rvx_signal_17 = 1;
assign rvx_signal_39 = 1;
assign rvx_port_20 = rvx_signal_58;
assign rvx_signal_02 = 1;
assign rvx_port_29 = rvx_signal_47;
assign rvx_signal_75 = 1;
assign rvx_port_21 = rvx_signal_65;
assign rvx_signal_25 = 1;
assign rvx_port_14 = rvx_signal_49;
assign rvx_signal_05 = 0;
assign rvx_signal_57 = 1;
assign rvx_port_30 = rvx_signal_01;
assign rvx_signal_55 = 1;
assign rvx_port_11 = rvx_signal_53;
assign rvx_signal_15 = 1;
assign rvx_port_26 = rvx_signal_20;
assign rvx_signal_26 = 1;
assign rvx_signal_52 = 0;
assign rvx_port_36 = rvx_signal_72;
assign rvx_port_13 = rvx_signal_48;
assign rvx_signal_24 = 1;
assign rvx_port_24 = rvx_signal_00;
assign rvx_signal_34 = 1;

endmodule
