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
`include "rvx_include_03.vh"





module RVX_MODULE_077
(
	rvx_port_15,
	rvx_port_16,

	rvx_port_14,
	rvx_port_12,
	rvx_port_09,
	rvx_port_10,
	rvx_port_11,
	rvx_port_08,
	rvx_port_24,
	rvx_port_23,

	rvx_port_02,
	rvx_port_04,
	rvx_port_17,
	rvx_port_27,
	rvx_port_00,
	rvx_port_07,
	rvx_port_19,
	rvx_port_29,
	rvx_port_25,
	rvx_port_30,
	rvx_port_22,
	rvx_port_13,
	rvx_port_20,
	rvx_port_21,
	rvx_port_26,
	rvx_port_01,
	rvx_port_06,
	rvx_port_28,
	rvx_port_05,
	rvx_port_18,
	rvx_port_31,
	rvx_port_03
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_15, rvx_port_16;
input wire rvx_port_14;
input wire rvx_port_12;
input wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_11;
output wire [RVX_GPARA_0-1:0] rvx_port_08;
output reg rvx_port_24;
output reg rvx_port_23;

input wire rvx_port_02;

output wire rvx_port_04;
output wire [8-1:0] rvx_port_17;

output wire rvx_port_27;
input wire [5-1:0] rvx_port_00;

output wire [8-1:0] rvx_port_07;

output wire rvx_port_13;
output wire rvx_port_20;
output wire [RVX_GPARA_0-1:0] rvx_port_21;
output wire rvx_port_19;
output wire rvx_port_29;
output wire [RVX_GPARA_0-1:0] rvx_port_25;
input wire rvx_port_30;
output wire [32-1:0] rvx_port_22;

output wire rvx_port_26;
output wire rvx_port_01;
output wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire rvx_port_28;
output wire rvx_port_05;
output wire [RVX_GPARA_0-1:0] rvx_port_18;
input wire rvx_port_31;
input wire [32-1:0] rvx_port_03;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_05;
reg [RVX_GPARA_0-1:0] rvx_signal_19;
wire rvx_signal_09;
wire rvx_signal_50;
wire rvx_signal_26;

wire [`RVX_GDEF_016-1:0] paddr_offset = rvx_port_09;
wire [`RVX_GDEF_016-1:0] rvx_signal_37;
wire [RVX_GPARA_2-1:0] rvx_signal_13;
wire [`RVX_GDEF_004-1:0] rvx_signal_45;
wire [`RVX_GDEF_004-1:0] addr_unused = 0;
reg rvx_signal_25;
wire [8-1:0] rvx_signal_01;
reg rvx_signal_42;
wire [8-1:0] rvx_signal_56;
wire rvx_signal_00;
reg rvx_signal_03;
wire [5-1:0] rvx_signal_53;
reg rvx_signal_49;
wire [5-1:0] rvx_signal_51;
wire rvx_signal_06;
reg rvx_signal_23;
wire [8-1:0] rvx_signal_34;
reg rvx_signal_02;
wire [8-1:0] rvx_signal_21;
wire rvx_signal_24;
reg [8-1:0] rvx_signal_38;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_47;
reg rvx_signal_35;
wire [32-1:0] rvx_signal_52;
wire rvx_signal_44;
wire rvx_signal_30;
wire rvx_signal_48;
wire rvx_signal_39;
wire [32-1:0] rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_60;
wire rvx_signal_33;
wire rvx_signal_54;
wire rvx_signal_29;
wire [32-1:0] rvx_signal_27;
wire [RVX_GPARA_0-1:0] rvx_signal_20;
reg rvx_signal_46;
wire [32-1:0] rvx_signal_59;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_17;
wire rvx_signal_41;
wire rvx_signal_40;
wire rvx_signal_11;
wire rvx_signal_36;
wire [32-1:0] rvx_signal_12;
wire [RVX_GPARA_0-1:0] rvx_signal_32;
wire rvx_signal_07;
wire rvx_signal_58;
wire rvx_signal_43;
wire [32-1:0] rvx_signal_31;
wire [RVX_GPARA_0-1:0] rvx_signal_18;
reg rvx_signal_57;
wire [7-1:0] rvx_signal_14;
reg rvx_signal_08;
wire [7-1:0] rvx_signal_28;
wire rvx_signal_15;

assign rvx_signal_05 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_11);
assign rvx_port_08 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_19);
assign {rvx_signal_13,rvx_signal_45} = paddr_offset;
assign rvx_signal_37 = {rvx_signal_13,addr_unused};
assign rvx_signal_26 = (rvx_signal_45==0);
assign rvx_signal_09 = rvx_port_14 & rvx_port_12 & rvx_signal_26 & (~rvx_port_10);
assign rvx_signal_50 = rvx_port_14 & rvx_port_12 & rvx_signal_26 & rvx_port_10;

assign rvx_signal_56 = $unsigned(rvx_port_11);
assign rvx_signal_51 = $unsigned(rvx_port_11);
assign rvx_signal_21 = $unsigned(rvx_port_11);
assign rvx_signal_52 = $unsigned(rvx_port_11);
assign rvx_signal_17 = $unsigned(rvx_port_11);
assign rvx_signal_28 = $unsigned(rvx_port_11);

always@(*)
begin
	rvx_port_23 = 0;
	rvx_signal_19 = 0;
	rvx_port_24 = 1;

	rvx_signal_25 = 0;
	rvx_signal_42 = 0;

	rvx_signal_03 = 0;
	rvx_signal_49 = 0;

	rvx_signal_23 = 0;
	rvx_signal_02 = 0;

	rvx_signal_04 = 0;
	rvx_signal_35 = 0;

	rvx_signal_46 = 0;
	rvx_signal_16 = 0;

	rvx_signal_57 = 0;
	rvx_signal_08 = 0;

	if(rvx_port_14==1'b 1)
	begin
		case(rvx_signal_37)
			`RVX_GDEF_312:
			begin
				rvx_signal_25 = rvx_signal_09;
				rvx_signal_42 = rvx_signal_50;
				rvx_signal_19 = $unsigned(rvx_signal_01);
				rvx_port_24 = rvx_signal_00;
			end
			`RVX_GDEF_252:
			begin
				rvx_signal_03 = rvx_signal_09;
				rvx_signal_49 = rvx_signal_50;
				rvx_signal_19 = $unsigned(rvx_signal_53);
				rvx_port_24 = rvx_signal_06;
			end
			`RVX_GDEF_299:
			begin
				rvx_signal_23 = rvx_signal_09;
				rvx_signal_02 = rvx_signal_50;
				rvx_signal_19 = $unsigned(rvx_signal_34);
				rvx_port_24 = rvx_signal_24;
			end
			`RVX_GDEF_253:
			begin
				rvx_signal_04 = rvx_signal_09;
				rvx_signal_35 = rvx_signal_50;
				rvx_signal_19 = $unsigned(rvx_signal_47);
				rvx_port_24 = rvx_signal_44;
			end
			`RVX_GDEF_437:
			begin
				rvx_signal_46 = rvx_signal_09;
				rvx_signal_16 = rvx_signal_50;
				rvx_signal_19 = $unsigned(rvx_signal_59);
				rvx_port_24 = rvx_signal_41;
			end
			`RVX_GDEF_286:
			begin
				rvx_signal_57 = rvx_signal_09;
				rvx_signal_08 = rvx_signal_50;
				rvx_signal_19 = $unsigned(rvx_signal_14);
				rvx_port_24 = rvx_signal_15;
			end
			default:
				rvx_port_23 = 1;
		endcase
	end
end

always@(posedge rvx_port_15, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_38 <= `RVX_GDEF_056;
	else if (rvx_signal_02==1'b 1)
		rvx_signal_38 <= rvx_signal_21;
end
assign rvx_signal_34 = rvx_signal_38;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_15),
	.rstnn(rvx_port_16),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_30),
	.wfull(rvx_signal_48),
	.wrequest(rvx_signal_39),
	.wdata(rvx_signal_10),
	.wnum(rvx_signal_60),
	.rready(rvx_signal_33),
	.rempty(rvx_signal_54),
	.rrequest(rvx_signal_29),
	.rdata(rvx_signal_27),
	.rnum(rvx_signal_20)
);
assign rvx_port_13 = rvx_signal_30;
assign rvx_port_20 = rvx_signal_48;
assign rvx_port_21 = rvx_signal_60;
assign rvx_port_19 = rvx_signal_33;
assign rvx_port_29 = rvx_signal_54;
assign rvx_port_25 = rvx_signal_20;
assign rvx_signal_39 = rvx_signal_35;
assign rvx_signal_10 = rvx_signal_52;
assign rvx_signal_47 = rvx_signal_60;
assign rvx_signal_29 = rvx_port_30;
assign rvx_port_22 = rvx_signal_27;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_15),
	.rstnn(rvx_port_16),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_40),
	.wfull(rvx_signal_11),
	.wrequest(rvx_signal_36),
	.wdata(rvx_signal_12),
	.wnum(rvx_signal_32),
	.rready(rvx_signal_07),
	.rempty(rvx_signal_58),
	.rrequest(rvx_signal_43),
	.rdata(rvx_signal_31),
	.rnum(rvx_signal_18)
);
assign rvx_port_28 = rvx_signal_40;
assign rvx_port_05 = rvx_signal_11;
assign rvx_port_18 = rvx_signal_32;
assign rvx_port_26 = rvx_signal_07;
assign rvx_port_01 = rvx_signal_58;
assign rvx_port_06 = rvx_signal_18;
assign rvx_signal_36 = rvx_port_31;
assign rvx_signal_12 = rvx_port_03;
assign rvx_signal_43 = rvx_signal_46;
assign rvx_signal_59 = rvx_signal_31;
assign rvx_signal_14 = rvx_signal_18;
assign rvx_signal_01 = 0;
assign rvx_port_04 = rvx_signal_42;
assign rvx_port_17 = rvx_signal_56;
assign rvx_signal_00 = 1;
assign rvx_port_27 = rvx_signal_03;
assign rvx_signal_53 = rvx_port_00;
assign rvx_signal_06 = 1;
assign rvx_port_07 = rvx_signal_38;
assign rvx_signal_24 = 1;
assign rvx_signal_44 = 1;
assign rvx_signal_41 = 1;
assign rvx_signal_15 = 1;

endmodule
