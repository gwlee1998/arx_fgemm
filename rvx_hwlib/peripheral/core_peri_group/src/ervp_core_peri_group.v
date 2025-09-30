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
`include "rvx_include_16.vh"
`include "rvx_include_06.vh"
`include "platform_info.vh"



module ERVP_CORE_PERI_GROUP
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

	allows_holds,
	
	tick_1us,
	delay_notice,
	plic_interrupt,
	core_interrupt_vector,

	lock_status_list,
	global_tag_list,

	tcu_spsel,
	tcu_spenable,
	tcu_spaddr,
	tcu_spwrite,
	tcu_spwdata,
	tcu_sprdata,
	tcu_spready,
	tcu_spslverr,

  florian_spsel,
	florian_spenable,
	florian_spaddr,
	florian_spwrite,
	florian_spwdata,
	florian_sprdata,
	florian_spready,
	florian_spslverr
);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter PROCESS_ID = -1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_LOCK = 8;
parameter NUM_GLOBAL_TAG = 8;

localparam  RVX_LPARA_1 = `RVX_GDEF_327;
localparam  RVX_LPARA_0 = `RVX_GDEF_389-1;
localparam  RVX_LPARA_2 = `RVX_GDEF_310;

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

input wire allows_holds;

input wire tick_1us;
output wire delay_notice;
input wire plic_interrupt;
output wire [31:0] core_interrupt_vector;

input wire [NUM_LOCK-1:0] lock_status_list;
input wire [NUM_GLOBAL_TAG-1:0] global_tag_list;

output wire tcu_spsel;
output wire tcu_spenable;
output wire [BW_ADDR-1:0] tcu_spaddr;
output wire tcu_spwrite;
output wire [BW_DATA-1:0] tcu_spwdata;
input wire [BW_DATA-1:0] tcu_sprdata;
input wire tcu_spready;
input wire tcu_spslverr;

output wire florian_spsel;
output wire florian_spenable;
output wire [BW_ADDR-1:0] florian_spaddr;
output wire florian_spwrite;
output wire [BW_DATA-1:0] florian_spwdata;
input wire [BW_DATA-1:0] florian_sprdata;
input wire florian_spready;
input wire florian_spslverr;

genvar i;

wire [RVX_LPARA_1*BW_ADDR-1:0] rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_28;
wire [RVX_LPARA_1-1:0] rvx_signal_22;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_26;
wire [RVX_LPARA_1-1:0] rvx_signal_12;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_13;
wire [RVX_LPARA_1*BW_DATA-1:0] rvx_signal_09;
wire [RVX_LPARA_1-1:0] rvx_signal_16;
wire [RVX_LPARA_1-1:0] rvx_signal_25;

wire [BW_ADDR-1:0] rvx_signal_06 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_02;
wire [RVX_LPARA_1-1:0] rvx_signal_17;
wire [BW_ADDR-1:0] rvx_signal_00 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_03;
wire [BW_DATA-1:0] rvx_signal_24 [RVX_LPARA_1-1:0];
wire [BW_DATA-1:0] rvx_signal_15 [RVX_LPARA_1-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_27;
wire [RVX_LPARA_1-1:0] rvx_signal_29;

wire rvx_signal_11;

wire rvx_signal_14;
wire [`RVX_GDEF_309-1:0] rvx_signal_21;
wire rvx_signal_32;
wire [`RVX_GDEF_030-1:0] rvx_signal_30;
wire rvx_signal_18;
wire [`RVX_GDEF_120-1:0] rvx_signal_05;
wire rvx_signal_01;

reg [31:0] rvx_signal_33; 

wire [NUM_LOCK-1:0] rvx_signal_19;
wire [NUM_LOCK-1:0] rvx_signal_23;

reg [NUM_GLOBAL_TAG-1:0] rvx_signal_10;
wire [NUM_GLOBAL_TAG-1:0] rvx_signal_31;
reg [NUM_GLOBAL_TAG-1:0] rvx_signal_20;
wire rvx_signal_08;

wire rvx_signal_04;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_1),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_0),
	.BW_SEL_INDEX(RVX_LPARA_2)
)
i_rvx_instance_0
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
	.rpbaseaddr_list(rvx_signal_07),

	.spsel_list(rvx_signal_28),
	.spenable_list(rvx_signal_22),
	.spaddr_list(rvx_signal_26),
	.spwrite_list(rvx_signal_12),
	.spwdata_list(rvx_signal_13),
	.sprdata_list(rvx_signal_09),
	.spready_list(rvx_signal_16),
	.spslverr_list(rvx_signal_25)
);

generate
	for(i=0; i<RVX_LPARA_1; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_07[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_06[i];
		assign rvx_signal_02[i] = rvx_signal_28[i];
		assign rvx_signal_17[i] = rvx_signal_22[i];
		assign rvx_signal_00[i] = rvx_signal_26[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_03[i] = rvx_signal_12[i];
		assign rvx_signal_24[i] = rvx_signal_13[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_09[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_15[i];
		assign rvx_signal_16[i] = rvx_signal_27[i];
		assign rvx_signal_25[i] = rvx_signal_29[i];
	end
endgenerate

assign rvx_signal_06[`RVX_GDEF_159] = `RVX_GDEF_382;
assign rvx_signal_06[`RVX_GDEF_410] = `RVX_GDEF_343;
assign rvx_signal_06[`RVX_GDEF_063] = `RVX_GDEF_413;
assign rvx_signal_06[`RVX_GDEF_131] = `RVX_GDEF_231;
assign rvx_signal_06[`RVX_GDEF_026] = `RVX_GDEF_085;
assign rvx_signal_06[`RVX_GDEF_296] = `RVX_GDEF_351;

always@(*)
begin
	rvx_signal_33 = 0;
	rvx_signal_33[`RVX_GDEF_219] = plic_interrupt;
	rvx_signal_33[`RVX_GDEF_409] = rvx_signal_11;
end

assign core_interrupt_vector = rvx_signal_33;

`ifdef INCLUDE_TIMER

ERVP_TIMER
#(
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.ENDIAN_TYPE(ENDIAN_TYPE)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_02[`RVX_GDEF_159]),
	.rpenable(rvx_signal_17[`RVX_GDEF_159]),
	.rpaddr(rvx_signal_00[`RVX_GDEF_159]),
	.rpwrite(rvx_signal_03[`RVX_GDEF_159]),
	.rpwdata(rvx_signal_24[`RVX_GDEF_159]),
	.rprdata(rvx_signal_15[`RVX_GDEF_159]),
	.rpready(rvx_signal_27[`RVX_GDEF_159]),
	.rpslverr(rvx_signal_29[`RVX_GDEF_159]),

	.tick_1us(tick_1us),
	.delay_notice(delay_notice),
	.timer_interrupt(rvx_signal_11)
);

`else

assign rvx_signal_11 = 0;
assign rvx_signal_27[`RVX_GDEF_159] = 0;
assign rvx_signal_15[`RVX_GDEF_159] = 0;
assign rvx_signal_29[`RVX_GDEF_159] = 1;

`endif

`ifdef INCLUDE_MULTICORE

RVX_MODULE_043
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(BW_DATA)
)
i_rvx_instance_3
(
	.rvx_port_13(clk),
	.rvx_port_09(rstnn),

	.rvx_port_02(rvx_signal_02[`RVX_GDEF_410]),
	.rvx_port_08(rvx_signal_17[`RVX_GDEF_410]),
	.rvx_port_15(rvx_signal_00[`RVX_GDEF_410]),
	.rvx_port_04(rvx_signal_03[`RVX_GDEF_410]),
	.rvx_port_11(rvx_signal_24[`RVX_GDEF_410]),
	.rvx_port_03(rvx_signal_15[`RVX_GDEF_410]),
	.rvx_port_01(rvx_signal_27[`RVX_GDEF_410]),
	.rvx_port_12(rvx_signal_29[`RVX_GDEF_410]),

	.rvx_port_06(1'b 0),
	.rvx_port_00(rvx_signal_14),
	.rvx_port_17(rvx_signal_21),
	.rvx_port_10(rvx_signal_32),
	.rvx_port_05(rvx_signal_30),
	.rvx_port_16(rvx_signal_18),
	.rvx_port_07(rvx_signal_05),
	.rvx_port_14(rvx_signal_01)
);

assign rvx_signal_21 = PROCESS_ID;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_GLOBAL_TAG)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(global_tag_list),
	.synch_value(rvx_signal_31)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_10 <= 0;
		rvx_signal_20 <= 0;
	end
	else if(rvx_signal_32)
	begin
		rvx_signal_10 <= rvx_signal_30;
		rvx_signal_20 <= rvx_signal_31;
	end
end

assign rvx_signal_08 = (((rvx_signal_31 ~^ rvx_signal_20) & rvx_signal_10)!=0);

assign rvx_signal_05 = rvx_signal_08;
assign rvx_signal_01 = allows_holds? (~(rvx_signal_18 & rvx_signal_08)) : 1;

`else

assign rvx_signal_27[`RVX_GDEF_410] = 0;
assign rvx_signal_15[`RVX_GDEF_410] = 0;
assign rvx_signal_29[`RVX_GDEF_410] = 1;

`endif

`ifdef INCLUDE_MULTICORE

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_LOCK)
)
i_rvx_instance_4
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(lock_status_list),
	.synch_value(rvx_signal_19)
);

assign rvx_signal_23 = rvx_signal_00[`RVX_GDEF_063][`RVX_GDEF_338-1:`RVX_GDEF_270];
assign rvx_signal_04 = ((rvx_signal_23 & rvx_signal_19)!=0);
assign rvx_signal_27[`RVX_GDEF_063] = allows_holds? (~rvx_signal_04) : 1;
assign rvx_signal_15[`RVX_GDEF_063] = rvx_signal_04;
assign rvx_signal_29[`RVX_GDEF_063] = 0;

`else

assign rvx_signal_27[`RVX_GDEF_063] = 0;
assign rvx_signal_15[`RVX_GDEF_063] = 0;
assign rvx_signal_29[`RVX_GDEF_063] = 1;

`endif

`ifdef INCLUDE_TCACHING

assign tcu_spsel = rvx_signal_02[`RVX_GDEF_131];
assign tcu_spenable = rvx_signal_17[`RVX_GDEF_131];
assign tcu_spaddr = rvx_signal_00[`RVX_GDEF_131];
assign tcu_spwrite = rvx_signal_03[`RVX_GDEF_131];
assign tcu_spwdata = rvx_signal_24[`RVX_GDEF_131];

`else

assign tcu_spsel = 0;
assign tcu_spenable = 0;
assign tcu_spaddr = 0;
assign tcu_spwrite = 0;
assign tcu_spwdata = 0;

`endif

assign rvx_signal_15[`RVX_GDEF_131] = tcu_sprdata;
assign rvx_signal_27[`RVX_GDEF_131] = tcu_spready;
assign rvx_signal_29[`RVX_GDEF_131] = tcu_spslverr;

`ifdef INCLUDE_FLORIAN

assign florian_spsel = rvx_signal_02[`RVX_GDEF_026];
assign florian_spenable = rvx_signal_17[`RVX_GDEF_026];
assign florian_spaddr = rvx_signal_00[`RVX_GDEF_026];
assign florian_spwrite = rvx_signal_03[`RVX_GDEF_026];
assign florian_spwdata = rvx_signal_24[`RVX_GDEF_026];

`else

assign florian_spsel = 0;
assign florian_spenable = 0;
assign florian_spaddr = 0;
assign florian_spwrite = 0;
assign florian_spwdata = 0;

`endif

assign rvx_signal_15[`RVX_GDEF_026] = florian_sprdata;
assign rvx_signal_27[`RVX_GDEF_026] = florian_spready;
assign rvx_signal_29[`RVX_GDEF_026] = florian_spslverr;

assign rvx_signal_27[`RVX_GDEF_296] = 0;
assign rvx_signal_15[`RVX_GDEF_296] = 0;
assign rvx_signal_29[`RVX_GDEF_296] = 0;

endmodule
