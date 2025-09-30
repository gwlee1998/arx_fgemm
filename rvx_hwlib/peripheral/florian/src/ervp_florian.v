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
`include "fpir_define.vh"



module ERVP_FLORIAN
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
	rpslverr
);



`include "rvx_include_22.vh"
`include "rvx_include_23.vh"

parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter SUPPORT_DOUBLE = 0;
parameter INCLUDE_DIVIDER = 1;

input wire clk, rstnn;
input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

localparam  RVX_LPARA_03 = (SUPPORT_DOUBLE? BW_IEEEDP_EXPONENT : BW_IEEESP_EXPONENT) + 1;
localparam  RVX_LPARA_00 = (SUPPORT_DOUBLE? BW_IEEEDP_SIGNIFICAND : BW_IEEESP_SIGNIFICAND);
localparam  RVX_LPARA_02 = `MAX((48-RVX_LPARA_00),3);
localparam  RVX_LPARA_10 = 2;

localparam  RVX_LPARA_04 = `BW_FPIR_TYPE + 1 + RVX_LPARA_03 + RVX_LPARA_00 + RVX_LPARA_02 + RVX_LPARA_10;

localparam  RVX_LPARA_13 = RVX_LPARA_00 + RVX_LPARA_02;
localparam  RVX_LPARA_06 = RVX_LPARA_03 + RVX_LPARA_10;

wire rvx_signal_080;
wire rvx_signal_067;
wire rvx_signal_021;
wire [BW_DATA-1:0] rvx_signal_087;
wire rvx_signal_043;
wire rvx_signal_046;
wire [BW_DATA-1:0] rvx_signal_013;
reg  rvx_signal_023;
wire [32-1:0] rvx_signal_112;
wire rvx_signal_062;

wire rvx_signal_095;
wire rvx_signal_089;
wire rvx_signal_000;
wire [BW_DATA-1:0] rvx_signal_063;
wire rvx_signal_048;
wire rvx_signal_027;
wire [BW_DATA-1:0] rvx_signal_110;
reg  rvx_signal_103;
reg  [32-1:0] rvx_signal_032;
wire rvx_signal_061;

reg [`RVX_GDEF_001-1:0] rvx_signal_007;
reg [`RVX_GDEF_133-1:0] rvx_signal_060;
reg [`RVX_GDEF_360-1:0] rvx_signal_086;
reg [`RVX_GDEF_360-1:0] rvx_signal_056;
wire rvx_signal_090;
wire rvx_signal_104;
wire rvx_signal_024;
wire rvx_signal_053;
reg  rvx_signal_070;
wire rvx_signal_041;
wire rvx_signal_066;

localparam  RVX_LPARA_12 = 4;

wire rvx_signal_059;
wire rvx_signal_009;
wire [RVX_LPARA_12-1:0] rvx_signal_073;
reg [RVX_LPARA_12-1:0] rvx_signal_069;
reg [RVX_LPARA_12-1:0] rvx_signal_077;

reg [32-1:0] rvx_signal_101;
reg rvx_signal_045;
reg [32-1:0] rvx_signal_039;
reg rvx_signal_047;
reg rvx_signal_017;
wire rvx_signal_001;

localparam  RVX_LPARA_05 = 32;

wire rvx_signal_020;
wire [RVX_LPARA_05-1:0] rvx_signal_091;

wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_044;
wire [2*BW_IEEESP_SIGNIFICAND-1:0] rvx_signal_036;

wire [RVX_LPARA_04-1:0] rvx_signal_078;
wire [RVX_LPARA_04-1:0] rvx_signal_106;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_030;
wire rvx_signal_037;
wire [RVX_LPARA_03-1:0] rvx_signal_022;
wire [RVX_LPARA_00-1:0] rvx_signal_115;
wire [RVX_LPARA_02-1:0] rvx_signal_051;
wire [RVX_LPARA_10-1:0] rvx_signal_002;

wire [24-1:0] rvx_signal_058;

reg [RVX_LPARA_04-1:0] rvx_signal_065;
reg rvx_signal_098;

reg [RVX_LPARA_04-1:0] rvx_signal_003;
reg rvx_signal_094;

localparam  RVX_LPARA_07 = RVX_LPARA_13 + 1;

reg [RVX_LPARA_07-1:0] rvx_signal_096;
reg [RVX_LPARA_07-1:0] rvx_signal_093;
reg rvx_signal_075;
wire [RVX_LPARA_07-1:0] rvx_signal_042;

wire [RVX_LPARA_04-1:0] rvx_signal_052;
wire [RVX_LPARA_04-1:0] rvx_signal_099;
wire rvx_signal_079;
wire [RVX_LPARA_04-1:0] rvx_signal_092;
wire [RVX_LPARA_04-1:0] rvx_signal_055;
wire rvx_signal_057;
wire [RVX_LPARA_04-1:0] rvx_signal_084;
wire [RVX_LPARA_07-1:0] rvx_signal_107;
wire [RVX_LPARA_07-1:0] rvx_signal_072;
wire rvx_signal_035;
wire [RVX_LPARA_07-1:0] rvx_signal_031;
wire [RVX_LPARA_04-1:0] rvx_signal_083;
wire rvx_signal_054;

localparam  RVX_LPARA_08 = RVX_LPARA_00;
localparam  RVX_LPARA_01 = RVX_LPARA_00;
localparam  RVX_LPARA_09 = 2*RVX_LPARA_00;

wire [RVX_LPARA_04-1:0] rvx_signal_081;
wire [RVX_LPARA_04-1:0] rvx_signal_010;
wire rvx_signal_068;
wire [RVX_LPARA_08-1:0] rvx_signal_085;
wire [RVX_LPARA_08-1:0] rvx_signal_097;
wire [2*RVX_LPARA_08-1:0] rvx_signal_038;
wire [RVX_LPARA_01-1:0] rvx_signal_100;
wire [RVX_LPARA_01-1:0] rvx_signal_071;
wire [RVX_LPARA_09-1:0] rvx_signal_019;
wire [RVX_LPARA_07-1:0] rvx_signal_008;
wire [RVX_LPARA_07-1:0] rvx_signal_040;
wire rvx_signal_015;
wire [RVX_LPARA_07-1:0] rvx_signal_050;
wire [RVX_LPARA_04-1:0] rvx_signal_005;

wire rvx_signal_025;
wire rvx_signal_105;
wire [RVX_LPARA_00-1:0] rvx_signal_111;
wire [RVX_LPARA_00-1:0] rvx_signal_016;
wire rvx_signal_033;
wire rvx_signal_034;
wire [RVX_LPARA_09-1:0] rvx_signal_113;

wire [RVX_LPARA_04-1:0] rvx_signal_082;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_102;
wire rvx_signal_029;
wire [RVX_LPARA_03-1:0] rvx_signal_049;
wire [RVX_LPARA_00-1:0] rvx_signal_074;
wire [RVX_LPARA_02-1:0] rvx_signal_076;
wire [RVX_LPARA_10-1:0] rvx_signal_064;

wire [RVX_LPARA_04-1:0] rvx_signal_088;
wire [RVX_LPARA_04-1:0] rvx_signal_012;

wire [RVX_LPARA_04-1:0] rvx_signal_108;
wire [RVX_LPARA_04-1:0] rvx_signal_026;

reg [RVX_LPARA_04-1:0] rvx_signal_028;
reg [RVX_LPARA_04-1:0] rvx_signal_114;
reg [RVX_LPARA_04-1:0] rvx_signal_109;
wire [BW_IEEESP_VALUE-1:0] rvx_signal_014;
wire [BW_IEEEDP_VALUE-1:0] rvx_signal_011;

localparam  RVX_LPARA_11 = RVX_LPARA_12;

reg [RVX_LPARA_11*BW_DATA-1:0] rvx_signal_006;

wire [32-1:0] rvx_signal_018;
reg  [32-1:0] rvx_signal_004;

RVX_MODULE_060
#(
  .RVX_GPARA_1(BW_ADDR),
  .RVX_GPARA_0(BW_DATA),
  .RVX_GPARA_2(ENDIAN_TYPE)
)
i_rvx_instance_00
(
	.rvx_port_21(clk),
	.rvx_port_24(rstnn),

	.rvx_port_26(rpsel),
	.rvx_port_06(rpenable),
	.rvx_port_01(rpaddr),
	.rvx_port_00(rpwrite),
	.rvx_port_27(rpwdata),
	.rvx_port_05(rprdata),
	.rvx_port_16(rpready),
	.rvx_port_09(rpslverr),

	.rvx_port_30(1'b 0),
  .rvx_port_18(rvx_signal_080),
	.rvx_port_15(rvx_signal_043),
	.rvx_port_12(rvx_signal_046),
	.rvx_port_19(rvx_signal_013),
	.rvx_port_17(rvx_signal_023),
	.rvx_port_04(rvx_signal_112),
	.rvx_port_28(rvx_signal_067),
	.rvx_port_07(rvx_signal_021),
	.rvx_port_08(rvx_signal_087),
	.rvx_port_22(rvx_signal_062),
	.rvx_port_20(rvx_signal_095),
	.rvx_port_29(rvx_signal_089),
	.rvx_port_14(rvx_signal_000),
	.rvx_port_13(rvx_signal_063),
	.rvx_port_25(rvx_signal_048),
	.rvx_port_03(rvx_signal_027),
	.rvx_port_10(rvx_signal_110),
	.rvx_port_02(rvx_signal_103),
	.rvx_port_23(rvx_signal_032),
	.rvx_port_11(rvx_signal_061)
);

assign rvx_signal_080 = 0;
assign rvx_signal_062 = ~rvx_signal_021;
assign rvx_signal_095 = 0;
assign rvx_signal_061 = ~rvx_signal_000;

always@(*)
begin
  rvx_signal_023 = 0;
  case(rvx_signal_007)
    `RVX_GDEF_247:
      rvx_signal_023 = 1;
    `RVX_GDEF_112:
      rvx_signal_023 = 1;
  endcase
end

always@(*)
begin
  rvx_signal_103 = 0;
  case(rvx_signal_007)
    `RVX_GDEF_112:
      case(rvx_signal_060)
        `RVX_GDEF_040:
          rvx_signal_103 = rvx_signal_098 | rvx_signal_094;
        `RVX_GDEF_358:
          if(INCLUDE_DIVIDER==0)
            rvx_signal_103 = rvx_signal_098 | rvx_signal_094;
      endcase
    `RVX_GDEF_090:
      rvx_signal_103 = 1;
  endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_11)
)
i_rvx_instance_07
(
	.data_input_list(rvx_signal_006),
	.select(rvx_signal_073[RVX_LPARA_11-1:0]),
	.data_output(rvx_signal_018)
);

always@(*)
begin
  rvx_signal_004 = $unsigned(rvx_signal_058);
  case(rvx_signal_060)
    `RVX_GDEF_040,
    `RVX_GDEF_358:
      rvx_signal_004 = $unsigned(rvx_signal_058);
  endcase
end

always@(*)
begin
  rvx_signal_032 = rvx_signal_018;
  case(rvx_signal_007)
    `RVX_GDEF_112:
      rvx_signal_032 = rvx_signal_004;
    `RVX_GDEF_090:
      rvx_signal_032 = rvx_signal_018;
  endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_007 <= `RVX_GDEF_247;
  else
    case(rvx_signal_007)
      `RVX_GDEF_247:
        if(rvx_signal_104)
          rvx_signal_007 <= `RVX_GDEF_112;
      `RVX_GDEF_112:
        if(rvx_signal_053)
          rvx_signal_007 <= `RVX_GDEF_135;
      `RVX_GDEF_135:
        if(rvx_signal_070)
          rvx_signal_007 <= `RVX_GDEF_141;
      `RVX_GDEF_141:
        rvx_signal_007 <= `RVX_GDEF_305;
      `RVX_GDEF_305:
        rvx_signal_007 <= `RVX_GDEF_090;
      `RVX_GDEF_090:
        if(rvx_signal_066)
          rvx_signal_007 <= `RVX_GDEF_247;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  {rvx_signal_060,rvx_signal_086,rvx_signal_056} <= 0;
  else if(rvx_signal_104)
    {rvx_signal_060,rvx_signal_086,rvx_signal_056} <= rvx_signal_112;
end

assign rvx_signal_090 = rvx_signal_043 & rvx_signal_023;
assign rvx_signal_104 = (rvx_signal_007==`RVX_GDEF_247) & rvx_signal_090;
assign rvx_signal_024 = (rvx_signal_007==`RVX_GDEF_112) & rvx_signal_090;

always@(*)
begin
  rvx_signal_070 = 0;
  case(rvx_signal_007)
    `RVX_GDEF_135:
      if(rvx_signal_060==`RVX_GDEF_358)
      begin
        if(INCLUDE_DIVIDER)
          rvx_signal_070 = rvx_signal_033;
        else
          rvx_signal_070 = 1;
      end
      else
        rvx_signal_070 = 1;
  endcase
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_12)
)
i_rvx_instance_06
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(1'b 1),
	.init(rvx_signal_059),
  .count(rvx_signal_009),
	.value(rvx_signal_073),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_059 = rvx_signal_053 | rvx_signal_066;
assign rvx_signal_009 = rvx_signal_024 | rvx_signal_041;

always@(*)
begin
  rvx_signal_069 = ((1'b 1) << 0);
  case(rvx_signal_060)
    `RVX_GDEF_232:
      rvx_signal_069 = ((1'b 1) << 0);
    `RVX_GDEF_212,
    `RVX_GDEF_200:
      rvx_signal_069 = ((1'b 1) << 1);
    `RVX_GDEF_040:
      rvx_signal_069 = ((1'b 1) << 3);
    `RVX_GDEF_358:
      if(INCLUDE_DIVIDER)
        rvx_signal_069 = ((1'b 1) << 1);
      else
        rvx_signal_069 = ((1'b 1) << 3);
  endcase
end

assign rvx_signal_041 = (rvx_signal_007==`RVX_GDEF_090) & rvx_signal_103;
assign rvx_signal_053 = rvx_signal_024 & (rvx_signal_073==rvx_signal_069);

always@(*)
begin
  rvx_signal_077 = ((1'b 1) << 0);
  case(rvx_signal_056)
    `RVX_GDEF_249:
      rvx_signal_077 = ((1'b 1) << 1);
  endcase
end

assign rvx_signal_066 = rvx_signal_041 & (rvx_signal_073==rvx_signal_077);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_101 <= 0;
  else if(rvx_signal_045)
    rvx_signal_101 <= rvx_signal_112;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_039 <= 0;
  else if(rvx_signal_047)
    rvx_signal_039 <= rvx_signal_112;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_017 <= 0;
  else if(rvx_signal_001)
    case(rvx_signal_086)
      `RVX_GDEF_019:
        rvx_signal_017 <= rvx_signal_112[32-1];
      default:
        rvx_signal_017 <= 0;
    endcase
end
assign rvx_signal_001 = rvx_signal_045 | rvx_signal_047;

assign rvx_signal_020 = rvx_signal_017;
assign rvx_signal_091 = rvx_signal_020? ((~rvx_signal_101)+1'b 1) : rvx_signal_101;
assign rvx_signal_044 = {rvx_signal_039,rvx_signal_101};
assign rvx_signal_036 = {rvx_signal_039,rvx_signal_101};

RVX_MODULE_027
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_08
(
	.rvx_port_6(clk),
	.rvx_port_5(rstnn),
	.rvx_port_1(1'b 1),

	.rvx_port_4(rvx_signal_043 & (rvx_signal_007==`RVX_GDEF_112)),
	.rvx_port_0(rvx_signal_112),
  .rvx_port_2(),
	.rvx_port_3(rvx_signal_078)	
);

assign rvx_signal_106 = rvx_signal_012;

assign {rvx_signal_030, rvx_signal_037, rvx_signal_022, rvx_signal_115, rvx_signal_051, rvx_signal_002} = rvx_signal_106;

RVX_MODULE_115
#(
  .RVX_GPARA_1(RVX_LPARA_13),
  .RVX_GPARA_0(24)
)
i_rvx_instance_01
(
	.rvx_port_0({rvx_signal_115,rvx_signal_051}),
	.rvx_port_1(rvx_signal_058)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_065 <= 0;
  else if(rvx_signal_098)
    rvx_signal_065 <= rvx_signal_106;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_003 <= 0;
  else if(rvx_signal_094)
    rvx_signal_003 <= rvx_signal_106;
end

always@(*)
begin
  rvx_signal_045 = 0;
  rvx_signal_047 = 0;
  rvx_signal_098 = 0;
  rvx_signal_094 = 0;
  if(rvx_signal_024)
    case(rvx_signal_060)
      `RVX_GDEF_232:
      begin
        rvx_signal_045 = rvx_signal_073[0];
        rvx_signal_047 = rvx_signal_073[1];
      end
      `RVX_GDEF_212,
      `RVX_GDEF_200:
      begin
        rvx_signal_098 = rvx_signal_073[0];
        rvx_signal_094 = rvx_signal_073[1];
      end
      `RVX_GDEF_040,
      `RVX_GDEF_358:
      begin
        rvx_signal_098 = rvx_signal_073[0];
        rvx_signal_094 = rvx_signal_073[1];
        rvx_signal_045 = rvx_signal_073[2];
        rvx_signal_047 = rvx_signal_073[3];
      end
    endcase
end

always@(*)
begin
  rvx_signal_096 = rvx_signal_107;
  rvx_signal_093 = rvx_signal_072;
  rvx_signal_075 = rvx_signal_035;
   case(rvx_signal_060)
      `RVX_GDEF_212,
      `RVX_GDEF_200:
      begin
        rvx_signal_096 = rvx_signal_107;
        rvx_signal_093 = rvx_signal_072;
        rvx_signal_075 = rvx_signal_035;
      end
      `RVX_GDEF_040,
      `RVX_GDEF_358:
      begin
        rvx_signal_096 = rvx_signal_008;
        rvx_signal_093 = rvx_signal_040;
        rvx_signal_075 = rvx_signal_015;
      end
   endcase
end

assign rvx_signal_042 = rvx_signal_096 + rvx_signal_093 + rvx_signal_075;

RVX_MODULE_028
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10)
)
i_rvx_instance_02
(
	.rvx_port_0(rvx_signal_052),
  .rvx_port_3(rvx_signal_099),
  .rvx_port_6(rvx_signal_079),

  .rvx_port_4(rvx_signal_092),
  .rvx_port_2(rvx_signal_055),
  .rvx_port_1(rvx_signal_057),
	.rvx_port_5(rvx_signal_084)
);

assign rvx_signal_052 = rvx_signal_065;
assign rvx_signal_099 = rvx_signal_003;
assign rvx_signal_079 = rvx_signal_060[`RVX_GDEF_403];

RVX_MODULE_108
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10),
  .RVX_GPARA_0(RVX_LPARA_07)
)
i_rvx_instance_10
(
  .rvx_port_09(rvx_signal_092),
  .rvx_port_07(rvx_signal_055),
  .rvx_port_03(rvx_signal_057),
	.rvx_port_02(rvx_signal_084),
  
  .rvx_port_00(rvx_signal_107),
  .rvx_port_01(rvx_signal_072),
  .rvx_port_06(rvx_signal_035),
  .rvx_port_04(rvx_signal_031),

  .rvx_port_08(rvx_signal_083),
  .rvx_port_05(rvx_signal_054)
);

assign rvx_signal_031 = rvx_signal_042;

RVX_MODULE_024
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10),
  .RVX_GPARA_1(RVX_LPARA_07),
  .RVX_GPARA_4(RVX_LPARA_08),
  .RVX_GPARA_0(RVX_LPARA_01),
  .RVX_GPARA_2(RVX_LPARA_09),
  .RVX_GPARA_3(0)
)
i_rvx_instance_03
(
	.rvx_port_05(rvx_signal_081),
  .rvx_port_09(rvx_signal_010),
  .rvx_port_01(rvx_signal_068),

  .rvx_port_07(rvx_signal_085),
  .rvx_port_10(rvx_signal_097),
  .rvx_port_03(rvx_signal_038),

  .rvx_port_12(rvx_signal_100),
  .rvx_port_00(rvx_signal_071),
  .rvx_port_08(rvx_signal_019),

  .rvx_port_02(rvx_signal_008),
  .rvx_port_06(rvx_signal_040),
  .rvx_port_13(rvx_signal_015),
  .rvx_port_11(rvx_signal_050),

	.rvx_port_04(rvx_signal_005)
);

assign rvx_signal_081 = rvx_signal_065;
assign rvx_signal_010 = rvx_signal_003;
assign rvx_signal_068 = rvx_signal_060[`RVX_GDEF_157];
assign rvx_signal_050 = rvx_signal_042;
assign rvx_signal_038 = rvx_signal_044;
assign rvx_signal_019 = (INCLUDE_DIVIDER==1)? rvx_signal_113 : rvx_signal_036;

RVX_MODULE_006
#(
  .RVX_GPARA_0(RVX_LPARA_00),
  .RVX_GPARA_1(RVX_LPARA_09)
)
i_rvx_instance_11
(
  .rvx_port_07(clk),
  .rvx_port_03(rstnn),
  .rvx_port_01((INCLUDE_DIVIDER==1)),

  .rvx_port_04(rvx_signal_025),
  .rvx_port_06(rvx_signal_105),
	.rvx_port_09(rvx_signal_111),
	.rvx_port_05(rvx_signal_016),
  .rvx_port_02(rvx_signal_033),
  .rvx_port_00(rvx_signal_034),
	.rvx_port_08(rvx_signal_113),
  .rvx_port_10()
);

assign rvx_signal_025 = (rvx_signal_007==`RVX_GDEF_135) & (rvx_signal_060==`RVX_GDEF_358);
assign rvx_signal_111 = rvx_signal_100;
assign rvx_signal_016 = rvx_signal_071;
assign rvx_signal_034 = 1;

assign rvx_signal_102 = `FPIR_TYPE_NORMAL;
assign rvx_signal_029 = rvx_signal_020;
assign rvx_signal_049 = RVX_LPARA_05-1;
assign rvx_signal_064 = 0;

RVX_MODULE_115
#(
  .RVX_GPARA_1(RVX_LPARA_05),
  .RVX_GPARA_0(RVX_LPARA_13)
)
i_rvx_instance_05
(
	.rvx_port_0(rvx_signal_091),
	.rvx_port_1({rvx_signal_074,rvx_signal_076})
);

assign rvx_signal_082 = {rvx_signal_102, rvx_signal_029, rvx_signal_049, rvx_signal_074, rvx_signal_076, rvx_signal_064};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_114 <= 0;
  else if(rvx_signal_070)
    rvx_signal_114 <= rvx_signal_028;
end

always@(*)
begin
  rvx_signal_028 = 0;
  case(rvx_signal_060)
    `RVX_GDEF_232:
      rvx_signal_028 = rvx_signal_082;
    `RVX_GDEF_212,
    `RVX_GDEF_200:
      rvx_signal_028 = rvx_signal_083;
    `RVX_GDEF_040,
    `RVX_GDEF_358:
      rvx_signal_028 = rvx_signal_005;
  endcase
end

RVX_MODULE_102
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10)
)
i_rvx_instance_04
(
  .rvx_port_1(rvx_signal_088),
  .rvx_port_0(rvx_signal_012)
);

assign rvx_signal_088 = (rvx_signal_007==`RVX_GDEF_112)? rvx_signal_078 : rvx_signal_114;

assign rvx_signal_026 = rvx_signal_012;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_109 <= 0;
  else if(rvx_signal_007==`RVX_GDEF_141)
    rvx_signal_109 <= rvx_signal_026;
end

RVX_MODULE_017
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10),
  .BW_IEEE_EXPONENT(BW_IEEESP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEESP_MANTISSA)
)
i_rvx_instance_09
(
	.rvx_port_6(clk),
	.rvx_port_1(rstnn),
	.rvx_port_4(1'b 1),

	.rvx_port_2(1'b 1),
	.rvx_port_3(rvx_signal_109),
	.rvx_port_5(),
	.rvx_port_0(rvx_signal_014)
);

RVX_MODULE_017
#(
  .BW_EXPONENT(RVX_LPARA_03),
  .BW_SIGNIFICAND(RVX_LPARA_00),
  .BW_GUARD(RVX_LPARA_02),
  .BW_OVERFLOW(RVX_LPARA_10),
  .BW_IEEE_EXPONENT(BW_IEEEDP_EXPONENT),
  .BW_IEEE_MANTISSA(BW_IEEEDP_MANTISSA)
)
i_rvx_instance_12
(
	.rvx_port_6(clk),
	.rvx_port_1(rstnn),
	.rvx_port_4(1'b 1),

	.rvx_port_2(1'b 1),
	.rvx_port_3(rvx_signal_109),
	.rvx_port_5(),
	.rvx_port_0(rvx_signal_011)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_006 <= 0;
  else if(rvx_signal_007==`RVX_GDEF_305)
    case(rvx_signal_056)
      `RVX_GDEF_002:
        rvx_signal_006 <= rvx_signal_014;
      `RVX_GDEF_249:
        rvx_signal_006 <= rvx_signal_011;
    endcase
end

endmodule
