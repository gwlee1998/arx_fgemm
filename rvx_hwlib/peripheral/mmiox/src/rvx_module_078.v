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
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_078
(
  rvx_port_28,
  rvx_port_14,
  rvx_port_08,
  rvx_port_27,

  
  rvx_port_10,
  rvx_port_30,
  rvx_port_20,
  rvx_port_24,
  rvx_port_12,
  rvx_port_09,
  rvx_port_03,
	rvx_port_11,
	rvx_port_23,
	rvx_port_50,
  rvx_port_38,
  rvx_port_41,
  rvx_port_31,
  rvx_port_36,
  rvx_port_16,
  rvx_port_47,
  rvx_port_33,
  rvx_port_00,
  rvx_port_07,
  rvx_port_35,
  rvx_port_48,
  rvx_port_44,
  rvx_port_49,
  rvx_port_01,
  rvx_port_05,
  rvx_port_46,
  rvx_port_06,
  rvx_port_51,
  rvx_port_17,
  rvx_port_13,
  rvx_port_34,
  rvx_port_25,

  
  rvx_port_18,
  rvx_port_21,
  rvx_port_52,
  rvx_port_32,
  rvx_port_15,
  rvx_port_45,
  rvx_port_02,
  rvx_port_22,
  rvx_port_37,
  rvx_port_19,
  rvx_port_39,
  rvx_port_40,
  rvx_port_42,
  rvx_port_26,
  rvx_port_29,
  rvx_port_04,
  rvx_port_43
);





parameter RVX_GPARA_4 = 32;

parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_7 = 32;
parameter RVX_GPARA_5 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_6 = 32;
parameter RVX_GPARA_3 = 32;

parameter RVX_GPARA_1 = 0;
parameter MMIOX1_FIFO_PARA = 0;

input wire rvx_port_28;
input wire rvx_port_14;
input wire rvx_port_08;
input wire rvx_port_27;

input wire rvx_port_10;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_30;
input wire rvx_port_20;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_24;
input wire rvx_port_12;
output wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_09;
input wire rvx_port_03;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_11;
input wire rvx_port_23;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_50;
input wire rvx_port_38;
output wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_41;
output wire rvx_port_31;
input wire rvx_port_36;
input wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_16;
output wire rvx_port_47;
output wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_33;
input wire rvx_port_00;
input wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_07;
output wire rvx_port_35;
input wire rvx_port_48;
output wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_44;
output wire rvx_port_49;
output wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_01;
input wire rvx_port_05;
input wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_46;
output wire rvx_port_06;
input wire rvx_port_51;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_17;
input wire rvx_port_13;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_34;

output wire [32-1:0] rvx_port_25;

output wire [RVX_GPARA_2-1:0] rvx_port_18;
input wire [RVX_GPARA_7-1:0] rvx_port_21;
output wire rvx_port_52;
input wire rvx_port_32;

output wire rvx_port_15;
input wire rvx_port_45;
input wire [RVX_GPARA_5-1:0] rvx_port_02;

output wire rvx_port_22;
output wire [RVX_GPARA_0-1:0] rvx_port_37;
input wire rvx_port_19;
input wire rvx_port_39;

output wire rvx_port_40;
output wire [RVX_GPARA_6-1:0] rvx_port_42;
input wire rvx_port_26;

output wire rvx_port_29;
input wire rvx_port_04;
input wire [RVX_GPARA_3-1:0] rvx_port_43;

wire rvx_signal_017;
wire rvx_signal_100;
wire rvx_signal_056;
wire rvx_signal_066;
wire rvx_signal_040;
wire rvx_signal_069;
wire rvx_signal_080;
wire rvx_signal_008;
wire rvx_signal_093;

localparam  RVX_LPARA_20 = 16;

`include "rvx_include_00.vh"
`include "rvx_include_19.vh"

localparam  RVX_LPARA_07 = RVX_GPARA_5;
localparam  RVX_LPARA_12 = RVX_GPARA_5;
localparam  RVX_LPARA_08 = RVX_GPARA_4;
localparam  RVX_LPARA_10 = LOG_FIFO_DEPTH;

wire rvx_signal_072;
wire rvx_signal_050;
wire rvx_signal_043;
wire rvx_signal_049;
wire rvx_signal_071;
wire rvx_signal_091;
wire rvx_signal_098;
wire [RVX_LPARA_12-1:0] rvx_signal_038;

wire rvx_signal_010;
wire rvx_signal_094;
wire rvx_signal_033;
wire rvx_signal_021;
wire rvx_signal_070;
wire rvx_signal_081;
wire rvx_signal_058;
wire [RVX_LPARA_08-1:0] rvx_signal_110;

localparam  RVX_LPARA_21 = RVX_GPARA_0;
localparam  RVX_LPARA_13 = RVX_GPARA_4;
localparam  RVX_LPARA_01 = RVX_GPARA_0;
localparam  RVX_LPARA_05 = INST_FIFO_DEPTH;

wire rvx_signal_009;
wire rvx_signal_062;
wire rvx_signal_075;
wire rvx_signal_030;
wire rvx_signal_106;
wire rvx_signal_027;
wire rvx_signal_019;
wire [RVX_LPARA_13-1:0] rvx_signal_065;
wire [RVX_LPARA_20-1:0] rvx_signal_105;

wire rvx_signal_048;
wire rvx_signal_089;
wire rvx_signal_006;
wire rvx_signal_036;
wire rvx_signal_002;
wire rvx_signal_000;
wire rvx_signal_095;
wire [RVX_LPARA_01-1:0] rvx_signal_074;

localparam  RVX_LPARA_00 = 1;
localparam  RVX_LPARA_06 = INST_FIFO_DEPTH;

wire rvx_signal_011;
wire rvx_signal_054;
wire rvx_signal_045;
wire rvx_signal_061;
wire rvx_signal_073;
wire [RVX_LPARA_00-1:0] rvx_signal_022;

wire rvx_signal_020;
wire rvx_signal_039;
wire rvx_signal_060;
wire rvx_signal_047;
wire rvx_signal_041;
wire [RVX_LPARA_00-1:0] rvx_signal_079;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_16 = REQUIRED_BITWIDTH_UNSIGNED(INST_FIFO_DEPTH) + 1;

wire rvx_signal_107;
wire rvx_signal_087;
wire rvx_signal_014;
wire rvx_signal_082;
wire [RVX_LPARA_16-1:0] rvx_signal_063;
wire [RVX_LPARA_16-1:0] rvx_signal_084;

wire rvx_signal_005;
wire [8-1:0] rvx_signal_026;
wire [8-1:0] rvx_signal_090;

localparam  RVX_LPARA_17 = RVX_GPARA_6;
localparam  RVX_LPARA_09 = RVX_GPARA_4;
localparam  RVX_LPARA_18 = RVX_GPARA_6;
localparam  RVX_LPARA_15 = INPUT_FIFO_DEPTH;

wire rvx_signal_016;
wire rvx_signal_067;
wire rvx_signal_023;
wire rvx_signal_034;
wire rvx_signal_052;
wire rvx_signal_044;
wire rvx_signal_051;
wire [RVX_LPARA_09-1:0] rvx_signal_029;
wire [RVX_LPARA_20-1:0] rvx_signal_076;

wire rvx_signal_003;
wire rvx_signal_078;
wire rvx_signal_092;
wire rvx_signal_035;
wire rvx_signal_068;
wire rvx_signal_024;
wire rvx_signal_053;
wire [RVX_LPARA_18-1:0] rvx_signal_097;

localparam  RVX_LPARA_02 = RVX_GPARA_3;
localparam  RVX_LPARA_03 = RVX_GPARA_3;
localparam  RVX_LPARA_14 = RVX_GPARA_4;
localparam  RVX_LPARA_19 = OUTPUT_FIFO_DEPTH;

wire rvx_signal_004;
wire rvx_signal_001;
wire rvx_signal_055;
wire rvx_signal_012;
wire rvx_signal_104;
wire rvx_signal_018;
wire rvx_signal_057;
wire [RVX_LPARA_03-1:0] rvx_signal_031;

wire rvx_signal_059;
wire rvx_signal_102;
wire rvx_signal_108;
wire rvx_signal_085;
wire rvx_signal_028;
wire rvx_signal_015;
wire rvx_signal_088;
wire [RVX_LPARA_14-1:0] rvx_signal_103;
wire [RVX_LPARA_20-1:0] rvx_signal_096;

localparam  RVX_LPARA_04 = `BW_MMIO_ITR_REQUEST;
localparam  RVX_LPARA_11 = INST_FIFO_DEPTH;

wire rvx_signal_025;
wire rvx_signal_086;
wire rvx_signal_042;
wire rvx_signal_077;
wire [RVX_LPARA_04-1:0] rvx_signal_046;
wire rvx_signal_064;
wire rvx_signal_099;
wire [RVX_LPARA_04-1:0] rvx_signal_109;

reg [RVX_GPARA_4-1:0] rvx_signal_101;
reg [RVX_GPARA_4-1:0] rvx_signal_083;
wire [RVX_GPARA_7-1:0] rvx_signal_007;
wire [RVX_GPARA_2-1:0] rvx_signal_037;

wire [16-1:0] rvx_signal_013;
wire [16-1:0] rvx_signal_032;

ERVP_MMIO_WIDE_REG
#(
  .BW_MMIO(`BW_MMIO_CORE_CONFIG_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_2),
  .DEFAULT_VALUE(RVX_GPARA_1)
)
i_rvx_instance_08
(
  .clk(rvx_port_28),
  .rstnn(rvx_port_14),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_10),
  .mmio_rdata(rvx_port_30),
  .mmio_we(rvx_port_20),
  .mmio_wdata(rvx_port_24),

  .wide_data_out(rvx_signal_037)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_2)
)
i_rvx_instance_09
(
  .clk(rvx_port_08),
  .rstnn(rvx_port_27),
  .enable(1'b 1),
  .asynch_value(rvx_signal_037),
  .synch_value(rvx_port_18)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_7)
)
i_rvx_instance_04
(
  .clk(rvx_port_28),
  .rstnn(rvx_port_14),
  .enable(1'b 1),
  .asynch_value(rvx_port_21),
  .synch_value(rvx_signal_007)
);

ERVP_MMIO_WIDE_READ
#(
  .BW_MMIO(`BW_MMIO_CORE_STATUS_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_7)
)
i_rvx_instance_11
(
  .clk(rvx_port_28),
  .rstnn(rvx_port_14),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_12),
  .mmio_rdata(rvx_port_09),

  .wide_data_in(rvx_signal_007)
);

ERVP_ASYNCH_SF2VR
i_rvx_instance_07
(
	.wclk(rvx_signal_017),
	.wrstnn(rvx_signal_100),
	.wstart(rvx_signal_056),
  .wbusy(rvx_signal_066),
	.wfinish(rvx_signal_040),
	.rclk(rvx_signal_069),
	.rrstnn(rvx_signal_080),
	.rvalid(rvx_signal_008),
	.rready(rvx_signal_093)
);

assign rvx_signal_017 = rvx_port_28;
assign rvx_signal_100 = rvx_port_14;
assign rvx_signal_056 = rvx_port_23;
assign rvx_signal_069 = rvx_port_08;
assign rvx_signal_080 = rvx_port_27;
assign rvx_port_52 = rvx_signal_008;
assign rvx_signal_093 = rvx_port_32;

assign rvx_port_11 = rvx_signal_066;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_07),
  .BW_PARTIAL_WRITE(RVX_LPARA_12),
  .BW_PARTIAL_READ(RVX_LPARA_08),
  .DEPTH(RVX_LPARA_10)
)
i_rvx_instance_06
(
  .wclk(rvx_signal_072),
  .wrstnn(rvx_signal_050),
  .wready(rvx_signal_043),
  .wfull(rvx_signal_049),
  .wstartindex(rvx_signal_071),
  .wlastindex(rvx_signal_091),
  .wrequest(rvx_signal_098),
  .wdata(rvx_signal_038),
  .wnum(),

  .rclk(rvx_signal_010),
  .rrstnn(rvx_signal_094),
  .rready(rvx_signal_033),
  .rempty(rvx_signal_021),
  .rstartindex(rvx_signal_070),
  .rlastindex(rvx_signal_081),
  .rrequest(rvx_signal_058),
  .rdata(rvx_signal_110),
  .rnum()
);

assign rvx_signal_072 = rvx_port_08;
assign rvx_signal_050 = rvx_port_27 & INCLUDE_LOG_FIFO;
assign rvx_port_15 = rvx_signal_043;
assign rvx_signal_098 = rvx_port_45;
assign rvx_signal_038 = rvx_port_02;

assign rvx_signal_010 = rvx_port_28;
assign rvx_signal_094 = rvx_port_14 & INCLUDE_LOG_FIFO;
assign rvx_port_41 = rvx_signal_110;
assign rvx_signal_058 = rvx_port_38;
assign rvx_port_31 = rvx_signal_033;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_21),
  .BW_PARTIAL_WRITE(RVX_LPARA_13),
  .BW_PARTIAL_READ(RVX_LPARA_01),
  .DEPTH(RVX_LPARA_05),
  .BW_NUM_DATA(RVX_LPARA_20)
)
i_rvx_instance_05
(
  .wclk(rvx_signal_009),
  .wrstnn(rvx_signal_062),
  .wready(rvx_signal_075),
  .wfull(rvx_signal_030),
  .wstartindex(rvx_signal_106),
  .wlastindex(rvx_signal_027),
  .wrequest(rvx_signal_019),
  .wdata(rvx_signal_065),
  .wnum(rvx_signal_105),

  .rclk(rvx_signal_048),
  .rrstnn(rvx_signal_089),
  .rready(rvx_signal_006),
  .rempty(rvx_signal_036),
  .rstartindex(rvx_signal_002),
  .rlastindex(rvx_signal_000),
  .rrequest(rvx_signal_095),
  .rdata(rvx_signal_074),
  .rnum()
);

assign rvx_signal_009 = rvx_port_28;
assign rvx_signal_062 = rvx_port_14 & INCLUDE_INST_FIFO;
assign rvx_port_47 = rvx_signal_005 & rvx_signal_075;
assign rvx_signal_019 = rvx_signal_005 & rvx_port_36;
assign rvx_signal_065 = rvx_port_16;

assign rvx_signal_048 = rvx_port_08;
assign rvx_signal_089 = rvx_port_27 & INCLUDE_INST_FIFO;
assign rvx_port_22 = rvx_signal_006;
assign rvx_port_37 = rvx_signal_074;
assign rvx_signal_095 = rvx_port_19;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_00),
  .DEPTH(RVX_LPARA_06)
)
i_rvx_instance_00
(
  .wclk(rvx_signal_011),
  .wrstnn(rvx_signal_054),
  .wready(rvx_signal_045),
  .wfull(rvx_signal_061),
  .wrequest(rvx_signal_073),
  .wdata(rvx_signal_022),  

  .rclk(rvx_signal_020),
  .rrstnn(rvx_signal_039),
  .rready(rvx_signal_060),
  .rempty(rvx_signal_047),
  .rrequest(rvx_signal_041),
  .rdata(rvx_signal_079)
);

assign rvx_signal_011 = rvx_port_08;
assign rvx_signal_054 = rvx_port_27 & INCLUDE_INST_FIFO;
assign rvx_signal_073 = rvx_port_39;
assign rvx_signal_022 = 0;

assign rvx_signal_020 = rvx_port_28;
assign rvx_signal_039 = rvx_port_14 & INCLUDE_INST_FIFO;
assign rvx_signal_041 = rvx_signal_060;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_16)
)
i_rvx_instance_10
(
  .clk(rvx_port_28),
  .rstnn(rvx_port_14),
  .enable(rvx_signal_107),
  .init(rvx_signal_087),
  .up(rvx_signal_014),
  .down(rvx_signal_082),
  .count_amount(rvx_signal_063),
  .value(rvx_signal_084),
  .is_upper_limit(),
  .is_lower_limit()
);

assign rvx_signal_107 = INCLUDE_INST_FIFO;
assign rvx_signal_087 = 0;
assign rvx_signal_014 = rvx_signal_075 & rvx_signal_019 & rvx_signal_027;
assign rvx_signal_082 = rvx_signal_060 & rvx_signal_041;
assign rvx_signal_063 = 1;

assign rvx_signal_005 = ~(rvx_signal_084[RVX_LPARA_16-1]);

assign rvx_signal_026 = ((INCLUDE_INST_FIFO==0)||(~rvx_signal_005))? 0 : ((rvx_signal_105[RVX_LPARA_20-1:8]==0)? rvx_signal_105 : 63);
assign rvx_signal_090 = (rvx_signal_084>63)? 63 : rvx_signal_084;
assign rvx_port_33[`BW_MMIO_INST_STATUS-1:16]  = rvx_signal_033;
assign rvx_port_33[16-1-:8] = rvx_signal_090;
assign rvx_port_33[8-1-:8] = rvx_signal_026;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_17),
  .BW_PARTIAL_WRITE(RVX_LPARA_09),
  .BW_PARTIAL_READ(RVX_LPARA_18),
  .DEPTH(RVX_LPARA_15),
  .BW_NUM_DATA(RVX_LPARA_20)
)
i_rvx_instance_01
(
  .wclk(rvx_signal_016),
  .wrstnn(rvx_signal_067),
  .wready(rvx_signal_023),
  .wfull(rvx_signal_034),
  .wstartindex(rvx_signal_052),
  .wlastindex(rvx_signal_044),
  .wrequest(rvx_signal_051),
  .wdata(rvx_signal_029),
  .wnum(rvx_signal_076),

  .rclk(rvx_signal_003),
  .rrstnn(rvx_signal_078),
  .rready(rvx_signal_092),
  .rempty(rvx_signal_035),
  .rstartindex(rvx_signal_068),
  .rlastindex(rvx_signal_024),
  .rrequest(rvx_signal_053),
  .rdata(rvx_signal_097),
  .rnum()
);

assign rvx_signal_016 = rvx_port_28;
assign rvx_signal_067 = rvx_port_14 & INCLUDE_INPUT_FIFO;
assign rvx_port_35 = rvx_signal_023;
assign rvx_signal_051 = rvx_port_00;
assign rvx_signal_029 = rvx_port_07;

assign rvx_signal_003 = rvx_port_08;
assign rvx_signal_078 = rvx_port_27 & INCLUDE_INPUT_FIFO;
assign rvx_port_40 = rvx_signal_092;
assign rvx_port_42 = rvx_signal_097;
assign rvx_signal_053 = rvx_port_26;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_02),
  .BW_PARTIAL_WRITE(RVX_LPARA_03),
  .BW_PARTIAL_READ(RVX_LPARA_14),
  .DEPTH(RVX_LPARA_19),
  .BW_NUM_DATA(RVX_LPARA_20)
)
i_rvx_instance_03
(
  .wclk(rvx_signal_004),
  .wrstnn(rvx_signal_001),
  .wready(rvx_signal_055),
  .wfull(rvx_signal_012),
  .wstartindex(rvx_signal_104),
  .wlastindex(rvx_signal_018),
  .wrequest(rvx_signal_057),
  .wdata(rvx_signal_031),
  .wnum(),

  .rclk(rvx_signal_059),
  .rrstnn(rvx_signal_102),
  .rready(rvx_signal_108),
  .rempty(rvx_signal_085),
  .rstartindex(rvx_signal_028),
  .rlastindex(rvx_signal_015),
  .rrequest(rvx_signal_088),
  .rdata(rvx_signal_103),
  .rnum(rvx_signal_096)
);

assign rvx_signal_004 = rvx_port_08;
assign rvx_signal_001 = rvx_port_27 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_29 = rvx_signal_055;
assign rvx_signal_057 = rvx_port_04;
assign rvx_signal_031 = rvx_port_43;

assign rvx_signal_059 = rvx_port_28;
assign rvx_signal_102 = rvx_port_14 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_44 = rvx_signal_103;
assign rvx_signal_088 = rvx_port_48;
assign rvx_port_49 = rvx_signal_108;

assign rvx_signal_013 = rvx_signal_076[RVX_LPARA_20-1]? 0 : rvx_signal_076;
assign rvx_signal_032 = rvx_signal_096[RVX_LPARA_20-1]? 0 : rvx_signal_096;

assign rvx_port_01[32-1-:16] = rvx_signal_013;
assign rvx_port_01[16-1-:16] = rvx_signal_032;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_04),
  .DEPTH(RVX_LPARA_11)
)
i_rvx_instance_02
(
  .clk(rvx_signal_025),
  .rstnn(rvx_signal_086),
  .enable(1'b 1),
  .clear(1'b 0),
  .wready(rvx_signal_042),
  .wfull(),
  .wrequest(rvx_signal_077),
  .wdata(rvx_signal_046),
  .wnum(),
  .rready(rvx_signal_064),
  .rempty(),
  .rrequest(rvx_signal_099),
  .rdata(rvx_signal_109),
  .rnum()
);

assign rvx_signal_025 = rvx_port_28;
assign rvx_signal_086 = rvx_port_14 & INCLUDE_INST_FIFO;

assign rvx_signal_077 = rvx_signal_005 & rvx_port_05;
assign rvx_signal_046 = rvx_port_46;
assign rvx_port_06 = rvx_signal_005 & rvx_signal_042;
assign rvx_signal_099 = rvx_signal_082; 

always@(posedge rvx_port_28, negedge rvx_port_14)
begin
  if(rvx_port_14==0)
    rvx_signal_101 <= 0;
  else if(rvx_signal_099|rvx_port_13)
    rvx_signal_101 <= rvx_signal_083;
end

always@(*)
begin
  rvx_signal_083 = rvx_signal_101;
  if(rvx_signal_099& rvx_signal_064)
    rvx_signal_083 = rvx_signal_083 | rvx_signal_109;
  if(rvx_port_13)
    rvx_signal_083 = rvx_signal_083 & (~rvx_port_34);
end

assign rvx_port_17 = rvx_signal_101;
assign rvx_port_25 = rvx_signal_101;

endmodule
