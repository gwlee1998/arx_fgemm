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
`include "rvx_include_21.vh"
`include "platform_info.vh"



module ERVP_COMMON_PERI_GROUP
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
	
	lock_status_list,
	real_clock,
	global_tag_list,
	system_tick_config,
	core_tick_config
);



parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_LOCK = 1;
parameter NUM_AUTO_ID = 1;
parameter NUM_GLOBAL_TAG = 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_1 = `RVX_GDEF_321;
localparam  RVX_LPARA_8 = `RVX_GDEF_171-1;
localparam  RVX_LPARA_0 = `RVX_GDEF_015;

localparam  RVX_LPARA_3 = 8;
localparam  RVX_LPARA_7 = 64;

localparam  RVX_LPARA_4 = (`DIVIDERU(`SYSTEM_CLK_HZ, `TICK_HZ)<<1) + 1;
localparam  RVX_LPARA_2 = (`DIVIDERU(`CORE_CLK_HZ, `TICK_HZ)<<1) + 1;

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

output wire [NUM_LOCK-1:0] lock_status_list;
input wire [RVX_LPARA_7-1:0] real_clock;
output wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
output wire [11-1:0] system_tick_config;
output wire [11-1:0] core_tick_config;

genvar i;

wire [RVX_LPARA_1*BW_ADDR-1:0] rvx_signal_21;
wire [RVX_LPARA_1-1:0] rvx_signal_37;
wire [RVX_LPARA_1-1:0] rvx_signal_15;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_23;
wire [RVX_LPARA_1-1:0] rvx_signal_00;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_29;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_20;
wire [RVX_LPARA_1-1:0] rvx_signal_11;
wire [RVX_LPARA_1-1:0] rvx_signal_04;

wire [BW_ADDR-1:0] rvx_signal_22 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_13;
wire [RVX_LPARA_1-1:0] rvx_signal_27;
wire [BW_ADDR-1:0] rvx_signal_10 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_24;
wire [BW_DATA-1:0] rvx_signal_05 [RVX_LPARA_1-1:0];
wire [BW_DATA-1:0] rvx_signal_16 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_03;
wire [RVX_LPARA_1-1:0] rvx_signal_32;

wire [NUM_LOCK-1:0] rvx_signal_09;
reg [NUM_LOCK-1:0] rvx_signal_31;
reg [NUM_LOCK-1:0] rvx_signal_33;
wire [NUM_LOCK-1:0] rvx_signal_28;

reg [NUM_AUTO_ID-1:0] rvx_signal_25;
reg [NUM_AUTO_ID-1:0] rvx_signal_12;
wire [RVX_LPARA_3-1:0] rvx_signal_14 [NUM_AUTO_ID-1:0];
wire [NUM_AUTO_ID-1:0] rvx_signal_34;

wire [RVX_LPARA_3*NUM_AUTO_ID-1:0] rvx_signal_35;
wire [RVX_LPARA_3-1:0] rvx_signal_08;

wire rvx_signal_18;
wire [8-1:0] rvx_signal_30;
wire rvx_signal_36;
wire [8-1:0] rvx_signal_06;
wire [11-1:0] rvx_signal_01;
wire [11-1:0] rvx_signal_17;

reg rvx_signal_26;
wire rvx_signal_07;
reg [RVX_LPARA_7-1:0] rvx_signal_19;
wire [RVX_LPARA_7-1:0] rvx_signal_02;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_1),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_8),
	.BW_SEL_INDEX(RVX_LPARA_0)
)
i_rvx_instance_3
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
	.rpbaseaddr_list(rvx_signal_21),

	.spsel_list(rvx_signal_37),
	.spenable_list(rvx_signal_15),
	.spaddr_list(rvx_signal_23),
	.spwrite_list(rvx_signal_00),
	.spwdata_list(rvx_signal_29),
	.sprdata_list(rvx_signal_20),
	.spready_list(rvx_signal_11),
	.spslverr_list(rvx_signal_04)
);

generate
	for(i=0; i<RVX_LPARA_1; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_21[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_22[i];
		assign rvx_signal_13[i] = rvx_signal_37[i];
		assign rvx_signal_27[i] = rvx_signal_15[i];
		assign rvx_signal_10[i] = rvx_signal_23[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_24[i] = rvx_signal_00[i];
		assign rvx_signal_05[i] = rvx_signal_29[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_20[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_16[i];
		assign rvx_signal_11[i] = rvx_signal_03[i];
		assign rvx_signal_04[i] = rvx_signal_32[i];
	end
endgenerate

assign rvx_signal_22[`RVX_GDEF_051] = `RVX_GDEF_142;
assign rvx_signal_22[`RVX_GDEF_127] = `RVX_GDEF_205;
assign rvx_signal_22[`RVX_GDEF_025] = `RVX_GDEF_347;
assign rvx_signal_22[`RVX_GDEF_359] = `RVX_GDEF_426;
assign rvx_signal_22[`RVX_GDEF_065] = `RVX_GDEF_262;

`ifdef INCLUDE_IROM

ERVP_IROM_APB
#(
	.BW_ADDR(BW_ADDR)
)
i_rvx_instance_5
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_13[`RVX_GDEF_051]),
	.rpenable(rvx_signal_27[`RVX_GDEF_051]),
	.rpaddr(rvx_signal_10[`RVX_GDEF_051]),
	.rpwrite(rvx_signal_24[`RVX_GDEF_051]),
	.rpwdata(rvx_signal_05[`RVX_GDEF_051]),
	.rprdata(rvx_signal_16[`RVX_GDEF_051]),
	.rpready(rvx_signal_03[`RVX_GDEF_051]),
	.rpslverr(rvx_signal_32[`RVX_GDEF_051])
);

`else

assign rvx_signal_03[`RVX_GDEF_051] = 0;
assign rvx_signal_16[`RVX_GDEF_051] = -1;
assign rvx_signal_32[`RVX_GDEF_051] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_LOCK; i=i+1)
	begin : i_generate_lock
		RVX_MODULE_118
		i_rvx_instance_2
		(
			.rvx_port_1(clk),
			.rvx_port_5(rstnn),
			.rvx_port_4(rvx_signal_31[i]),
			.rvx_port_3(rvx_signal_33[i]),
			.rvx_port_0(rvx_signal_28[i]),
			.rvx_port_2(lock_status_list[i])
		);
	end
endgenerate

assign rvx_signal_09 = rvx_signal_10[`RVX_GDEF_127][`RVX_GDEF_246-1:`RVX_GDEF_064];

always@(*)
begin
	rvx_signal_31 = 0;
	rvx_signal_33 = 0;
	if(rvx_signal_13[`RVX_GDEF_127] && rvx_signal_27[`RVX_GDEF_127])
	begin
		if(rvx_signal_24[`RVX_GDEF_127])
			rvx_signal_33 = rvx_signal_09;
		else
			rvx_signal_31 = rvx_signal_09;
	end
end

assign rvx_signal_03[`RVX_GDEF_127] = 1;
assign rvx_signal_16[`RVX_GDEF_127] = rvx_signal_28 & rvx_signal_09;
assign rvx_signal_32[`RVX_GDEF_127] = 0;

`else

assign lock_status_list = 0;
assign rvx_signal_03[`RVX_GDEF_127] = 0;
assign rvx_signal_16[`RVX_GDEF_127] = -1;
assign rvx_signal_32[`RVX_GDEF_127] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_generate_auto_id
		ERVP_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_3),
			.CIRCULAR(0)
		)
		i_rvx_instance_6
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(1'b 1),
			.init(rvx_signal_25[i]),
			.count(rvx_signal_12[i]),
			.value(rvx_signal_14[i]),
			.is_first_count(),
			.is_last_count()
		);
	end
endgenerate

assign rvx_signal_34 = rvx_signal_10[`RVX_GDEF_025][`RVX_GDEF_350-1:`RVX_GDEF_147];

always@(*)
begin
	rvx_signal_25 = 0;
	rvx_signal_12 = 0;
	if(rvx_signal_13[`RVX_GDEF_025] && rvx_signal_27[`RVX_GDEF_025])
	begin
		if(rvx_signal_24[`RVX_GDEF_025])
			rvx_signal_25 = rvx_signal_34;
		else
			rvx_signal_12 = rvx_signal_34;
	end
end

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_concat_auto_id
		assign rvx_signal_35[(i+1)*RVX_LPARA_3-1-:RVX_LPARA_3] = rvx_signal_14[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_LPARA_3),
	.NUM_DATA(NUM_AUTO_ID),
	.ACTIVE_HIGH(1)
)
i_rvx_instance_1
(
	.data_input_list(rvx_signal_35),
	.select(rvx_signal_34),
	.data_output(rvx_signal_08)
);

assign rvx_signal_03[`RVX_GDEF_025] = 1;
assign rvx_signal_16[`RVX_GDEF_025] = rvx_signal_08;
assign rvx_signal_32[`RVX_GDEF_025] = 0;

`else

assign rvx_signal_03[`RVX_GDEF_025] = 0;
assign rvx_signal_16[`RVX_GDEF_025] = -1;
assign rvx_signal_32[`RVX_GDEF_025] = 1;

`endif

RVX_MODULE_126
#(
	.RVX_GPARA_3(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_4(RVX_LPARA_4),
	.RVX_GPARA_2(RVX_LPARA_2)
)
i_rvx_instance_0
(
	.rvx_port_16(clk),
	.rvx_port_04(rstnn),

	.rvx_port_01(rvx_signal_13[`RVX_GDEF_359]),
	.rvx_port_15(rvx_signal_27[`RVX_GDEF_359]),
	.rvx_port_07(rvx_signal_10[`RVX_GDEF_359]),
	.rvx_port_09(rvx_signal_24[`RVX_GDEF_359]),
	.rvx_port_14(rvx_signal_05[`RVX_GDEF_359]),
	.rvx_port_03(rvx_signal_16[`RVX_GDEF_359]),
	.rvx_port_05(rvx_signal_03[`RVX_GDEF_359]),
	.rvx_port_10(rvx_signal_32[`RVX_GDEF_359]),

	.rvx_port_00(1'b 0),
	.rvx_port_08(rvx_signal_18),
	.rvx_port_13(rvx_signal_30),
	.rvx_port_12(rvx_signal_36),
	.rvx_port_02(rvx_signal_06),
	.rvx_port_06(rvx_signal_01),
	.rvx_port_11(rvx_signal_17)
);

`ifdef INCLUDE_MULTICORE

RVX_MODULE_099
#(
	.RVX_GPARA_0(NUM_GLOBAL_TAG)
)
i_rvx_instance_4
(
	.rvx_port_4(clk),
	.rvx_port_3(rstnn),

	.rvx_port_0(global_tag_list),
	.rvx_port_1(rvx_signal_36),
	.rvx_port_2(rvx_signal_06[NUM_GLOBAL_TAG-1:0])
);

assign rvx_signal_30 = global_tag_list;

`else

assign global_tag_list = 0;
assign rvx_signal_30 = -1;

`endif

assign system_tick_config = rvx_signal_01;
assign core_tick_config = rvx_signal_17;

localparam  RVX_LPARA_6 = 0;
localparam  RVX_LPARA_5 = 1;

assign rvx_signal_07 = rvx_signal_13[`RVX_GDEF_065] & rvx_signal_27[`RVX_GDEF_065];
assign rvx_signal_02 = (rvx_signal_26==RVX_LPARA_6)? real_clock : rvx_signal_19; 

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_26 <= RVX_LPARA_6;
	else if(rvx_signal_07)
		rvx_signal_26 <= ~rvx_signal_26;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_19 <= 0;
	else if((rvx_signal_26==RVX_LPARA_6) && rvx_signal_07)
		rvx_signal_19 <= real_clock;
end

assign rvx_signal_03[`RVX_GDEF_065] = 1;
assign rvx_signal_16[`RVX_GDEF_065] = rvx_signal_10[`RVX_GDEF_065][2]? rvx_signal_02[RVX_LPARA_7-1-:BW_DATA] : rvx_signal_02[BW_DATA-1-:BW_DATA];

assign rvx_signal_32[`RVX_GDEF_065] = rvx_signal_24[`RVX_GDEF_065];

endmodule
