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
`include "rvx_include_10.vh"





module RVX_MODULE_060
(
	rvx_port_21,
	rvx_port_24,

	rvx_port_26,
	rvx_port_06,
	rvx_port_01,
	rvx_port_00,
	rvx_port_27,
	rvx_port_05,
	rvx_port_16,
	rvx_port_09,

	rvx_port_30,
	rvx_port_18,
	rvx_port_15,
	rvx_port_12,
	rvx_port_19,
	rvx_port_17,
	rvx_port_04,
	rvx_port_28,
	rvx_port_07,
	rvx_port_08,
	rvx_port_22,
	rvx_port_20,
	rvx_port_29,
	rvx_port_14,
	rvx_port_13,
	rvx_port_25,
	rvx_port_03,
	rvx_port_10,
	rvx_port_02,
	rvx_port_23,
	rvx_port_11
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_21, rvx_port_24;
input wire rvx_port_26;
input wire rvx_port_06;
input wire [RVX_GPARA_1-1:0] rvx_port_01;
input wire rvx_port_00;
input wire [RVX_GPARA_0-1:0] rvx_port_27;
output wire [RVX_GPARA_0-1:0] rvx_port_05;
output reg rvx_port_16;
output reg rvx_port_09;

input wire rvx_port_30;

input wire rvx_port_18;
output wire rvx_port_28;
output wire rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_08;
output wire rvx_port_15;
output wire rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_19;
input wire rvx_port_17;
output wire [32-1:0] rvx_port_04;
input wire rvx_port_22;

input wire rvx_port_20;
output wire rvx_port_29;
output wire rvx_port_14;
output wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire rvx_port_25;
output wire rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_02;
input wire [32-1:0] rvx_port_23;
input wire rvx_port_11;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_19;
reg [RVX_GPARA_0-1:0] rvx_signal_44;
wire rvx_signal_14;
wire rvx_signal_06;
wire rvx_signal_35;

wire [`RVX_GDEF_101-1:0] paddr_offset = rvx_port_01;
wire [`RVX_GDEF_101-1:0] rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_27;
wire [`RVX_GDEF_132-1:0] rvx_signal_46;
wire [`RVX_GDEF_132-1:0] addr_unused = 0;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_15;
wire rvx_signal_43;
wire rvx_signal_13;
wire rvx_signal_08;
wire rvx_signal_23;
wire rvx_signal_28;
wire [32-1:0] rvx_signal_45;
wire [RVX_GPARA_0-1:0] rvx_signal_42;
wire rvx_signal_31;
wire rvx_signal_05;
wire rvx_signal_16;
wire [32-1:0] rvx_signal_32;
wire [RVX_GPARA_0-1:0] rvx_signal_03;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_22;
reg rvx_signal_40;
wire [32-1:0] rvx_signal_41;
wire rvx_signal_38;
wire rvx_signal_26;
wire rvx_signal_39;
wire rvx_signal_01;
wire rvx_signal_09;
wire [32-1:0] rvx_signal_34;
wire [RVX_GPARA_0-1:0] rvx_signal_30;
wire rvx_signal_10;
wire rvx_signal_29;
wire rvx_signal_20;
wire [32-1:0] rvx_signal_25;
wire [RVX_GPARA_0-1:0] rvx_signal_17;
reg rvx_signal_18;
wire [2-1:0] rvx_signal_12;
reg rvx_signal_02;
wire [2-1:0] rvx_signal_07;
wire rvx_signal_33;

assign rvx_signal_19 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_2,rvx_port_27);
assign rvx_port_05 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_2,rvx_signal_44);
assign {rvx_signal_27,rvx_signal_46} = paddr_offset;
assign rvx_signal_21 = {rvx_signal_27,addr_unused};
assign rvx_signal_35 = (rvx_signal_46==0);
assign rvx_signal_14 = rvx_port_26 & rvx_port_06 & rvx_signal_35 & (~rvx_port_00);
assign rvx_signal_06 = rvx_port_26 & rvx_port_06 & rvx_signal_35 & rvx_port_00;

assign rvx_signal_15 = $unsigned(rvx_port_27);
assign rvx_signal_41 = $unsigned(rvx_port_27);
assign rvx_signal_07 = $unsigned(rvx_port_27);

always@(*)
begin
	rvx_port_09 = 0;
	rvx_signal_44 = 0;
	rvx_port_16 = 1;

	rvx_signal_36 = 0;
	rvx_signal_37 = 0;

	rvx_signal_04 = 0;
	rvx_signal_40 = 0;

	rvx_signal_18 = 0;
	rvx_signal_02 = 0;

	if(rvx_port_26==1'b 1)
	begin
		case(rvx_signal_21)
			`RVX_GDEF_028:
			begin
				rvx_signal_36 = rvx_signal_14;
				rvx_signal_37 = rvx_signal_06;
				rvx_signal_44 = $unsigned(rvx_signal_00);
				rvx_port_16 = rvx_signal_43;
			end
			`RVX_GDEF_294:
			begin
				rvx_signal_04 = rvx_signal_14;
				rvx_signal_40 = rvx_signal_06;
				rvx_signal_44 = $unsigned(rvx_signal_22);
				rvx_port_16 = rvx_signal_38;
			end
			`RVX_GDEF_126:
			begin
				rvx_signal_18 = rvx_signal_14;
				rvx_signal_02 = rvx_signal_06;
				rvx_signal_44 = $unsigned(rvx_signal_12);
				rvx_port_16 = rvx_signal_33;
			end
			default:
				rvx_port_09 = 1;
		endcase
	end
end

ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(4),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.clear(rvx_signal_13),
	.wready(rvx_signal_08),
	.wfull(rvx_signal_23),
	.wrequest(rvx_signal_28),
	.wdata(rvx_signal_45),
	.wnum(rvx_signal_42),
	.rready(rvx_signal_31),
	.rempty(rvx_signal_05),
	.rrequest(rvx_signal_16),
	.rdata(rvx_signal_32),
	.rnum(rvx_signal_03)
);
assign rvx_signal_13 = rvx_port_18;
assign rvx_port_28 = rvx_signal_08;
assign rvx_port_07 = rvx_signal_23;
assign rvx_port_08 = rvx_signal_42;
assign rvx_port_15 = rvx_signal_31;
assign rvx_port_12 = rvx_signal_05;
assign rvx_port_19 = rvx_signal_03;
assign rvx_signal_28 = rvx_signal_37;
assign rvx_signal_45 = rvx_signal_15;
assign rvx_signal_00 = rvx_signal_42;
assign rvx_signal_16 = rvx_port_17;
assign rvx_port_04 = rvx_signal_32;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(2),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_21),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.clear(rvx_signal_26),
	.wready(rvx_signal_39),
	.wfull(rvx_signal_01),
	.wrequest(rvx_signal_09),
	.wdata(rvx_signal_34),
	.wnum(rvx_signal_30),
	.rready(rvx_signal_10),
	.rempty(rvx_signal_29),
	.rrequest(rvx_signal_20),
	.rdata(rvx_signal_25),
	.rnum(rvx_signal_17)
);
assign rvx_signal_26 = rvx_port_20;
assign rvx_port_25 = rvx_signal_39;
assign rvx_port_03 = rvx_signal_01;
assign rvx_port_10 = rvx_signal_30;
assign rvx_port_29 = rvx_signal_10;
assign rvx_port_14 = rvx_signal_29;
assign rvx_port_13 = rvx_signal_17;
assign rvx_signal_09 = rvx_port_02;
assign rvx_signal_34 = rvx_port_23;
assign rvx_signal_20 = rvx_signal_04;
assign rvx_signal_22 = rvx_signal_25;
assign rvx_signal_12 = rvx_signal_17;
assign rvx_signal_43 = rvx_port_22;
assign rvx_signal_38 = rvx_port_11;
assign rvx_signal_33 = 1;

endmodule
