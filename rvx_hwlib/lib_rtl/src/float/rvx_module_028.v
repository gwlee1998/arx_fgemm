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
`include "fpir_define.vh"





module RVX_MODULE_028
(
	rvx_port_0,
  rvx_port_3,
  rvx_port_6,

  rvx_port_4,
  rvx_port_2,
  rvx_port_1,
	rvx_port_5
);





`include "rvx_include_11.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_0 = 0;
localparam  RVX_LPARA_1 = 0; 

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(BW_SIGNIFICAND_EXTENDED);

input wire [BW_FPIR_VALUE-1:0] rvx_port_0;
input wire [BW_FPIR_VALUE-1:0] rvx_port_3;
input wire rvx_port_6;

output wire [BW_FPIR_VALUE-1:0] rvx_port_4;
output wire [BW_FPIR_VALUE-1:0] rvx_port_2;
output wire rvx_port_1;
output wire [BW_FPIR_VALUE-1:0] rvx_port_5;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_15;
wire rvx_signal_13;
wire [BW_EXPONENT-1:0] rvx_signal_07;
wire [BW_SIGNIFICAND-1:0] rvx_signal_04;
wire [BW_GUARD-1:0] rvx_signal_06;
wire [BW_OVERFLOW-1:0] rvx_signal_41;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_05;
wire rvx_signal_21;
wire [BW_EXPONENT-1:0] rvx_signal_39;
wire [BW_SIGNIFICAND-1:0] rvx_signal_44;
wire [BW_GUARD-1:0] rvx_signal_40;
wire [BW_OVERFLOW-1:0] rvx_signal_01;

wire [BW_GUARD-1:0] rvx_signal_02;
wire [BW_GUARD-1:0] rvx_signal_23;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_20;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_22;

wire rvx_signal_12;
reg rvx_signal_26;
reg rvx_signal_35;

wire [BW_EXPONENT-1:0] rvx_signal_18;
wire [BW_EXPONENT-1:0] rvx_signal_14;
wire rvx_signal_32;
wire rvx_signal_25;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_16;
wire [RVX_LPARA_0-1:0] rvx_signal_00;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_37;

reg  [`BW_FPIR_TYPE-1:0] rvx_signal_36;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_03;
wire rvx_signal_28;
wire [BW_EXPONENT-1:0] rvx_signal_33;
wire [BW_SIGNIFICAND-1:0] rvx_signal_11;
wire [BW_GUARD-1:0] rvx_signal_17;
wire [BW_OVERFLOW-1:0] rvx_signal_42;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_29;
wire rvx_signal_30;
wire [BW_EXPONENT-1:0] rvx_signal_10;
wire [BW_SIGNIFICAND-1:0] rvx_signal_27;
wire [BW_GUARD-1:0] rvx_signal_24;
wire [BW_OVERFLOW-1:0] rvx_signal_34;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_08;
wire rvx_signal_38;
wire [BW_EXPONENT-1:0] rvx_signal_19;
wire [BW_SIGNIFICAND-1:0] rvx_signal_09;
wire [BW_GUARD-1:0] rvx_signal_43;
reg  [BW_OVERFLOW-1:0] rvx_signal_31;

assign {rvx_signal_15, rvx_signal_13, rvx_signal_07, rvx_signal_04, rvx_signal_06, rvx_signal_41} = rvx_port_0;
assign {rvx_signal_05, rvx_signal_21, rvx_signal_39, rvx_signal_44, rvx_signal_40, rvx_signal_01} = rvx_port_3;
assign rvx_port_4 = {rvx_signal_03, rvx_signal_28, rvx_signal_33, rvx_signal_11, rvx_signal_17, rvx_signal_42};
assign rvx_port_2 = {rvx_signal_29, rvx_signal_30, rvx_signal_10, rvx_signal_27, rvx_signal_24, rvx_signal_34};
assign rvx_port_5 = {rvx_signal_08, rvx_signal_38, rvx_signal_19, rvx_signal_09, rvx_signal_43, rvx_signal_31};

assign rvx_signal_02 = (RVX_GPARA_0==0)? 0 : rvx_signal_06;
assign rvx_signal_23 = (RVX_GPARA_0==0)? 0 : rvx_signal_40;

assign rvx_signal_20 = {rvx_signal_04, rvx_signal_02};
assign rvx_signal_22 = {rvx_signal_44, rvx_signal_23};

always@(*)
begin
	rvx_signal_36 = `FPIR_TYPE_NORMAL;
	if(rvx_signal_15==`FPIR_TYPE_NAN)
    rvx_signal_36 = `FPIR_TYPE_NAN;
	else if(rvx_signal_05==`FPIR_TYPE_NAN)
    rvx_signal_36 = `FPIR_TYPE_NAN;
	else
		case(rvx_signal_15)
			`FPIR_TYPE_MINF:
				case(rvx_signal_05)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_NAN;
            else
              rvx_signal_36 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_MINF;
            else
              rvx_signal_36 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_MZERO:
						rvx_signal_36 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PZERO:
						rvx_signal_36 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_NORMAL:
						rvx_signal_36 = `FPIR_TYPE_MINF;
				endcase
			`FPIR_TYPE_PINF:
				case(rvx_signal_05)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_PINF;
            else
              rvx_signal_36 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_NAN;
            else
              rvx_signal_36 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_36 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_PZERO:
						rvx_signal_36 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_NORMAL:
						rvx_signal_36 = `FPIR_TYPE_PINF;
				endcase
			`FPIR_TYPE_MZERO:
				case(rvx_signal_05)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_PINF;
            else
              rvx_signal_36 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_MINF;
            else
              rvx_signal_36 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_36 = `FPIR_TYPE_MZERO;
					`FPIR_TYPE_PZERO:
						rvx_signal_36 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_PZERO:
				case(rvx_signal_05)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_PINF;
            else
              rvx_signal_36 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_MINF;
            else
              rvx_signal_36 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_36 = `FPIR_TYPE_PZERO;
					`FPIR_TYPE_PZERO:
						rvx_signal_36 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_NORMAL:
				case(rvx_signal_05)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_PINF;
            else
              rvx_signal_36 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_36 = `FPIR_TYPE_MINF;
            else
              rvx_signal_36 = `FPIR_TYPE_PINF;
				endcase
		endcase
end

assign rvx_signal_18 = $signed(rvx_signal_07) - $signed(rvx_signal_39);
assign rvx_signal_32 = rvx_signal_18[BW_EXPONENT-1]; 
assign rvx_signal_14 = (rvx_signal_32)? ((~rvx_signal_18)+1'b 1) : rvx_signal_18;
assign rvx_signal_25 = ($unsigned(rvx_signal_14) >= BW_SIGNIFICAND_EXTENDED);

RVX_MODULE_104
#(
  .RVX_GPARA_3(BW_SIGNIFICAND_EXTENDED),
	.RVX_GPARA_0(RVX_LPARA_0)
)
i_rvx_instance_0
(
  .rvx_port_0(rvx_signal_16),
  .rvx_port_2(rvx_signal_00),
  .rvx_port_1(rvx_signal_37)
);

assign rvx_signal_16 = rvx_signal_32? rvx_signal_20 : rvx_signal_22;
assign rvx_signal_00 = rvx_signal_14;

assign rvx_signal_03 = rvx_signal_36;
assign rvx_signal_28 = rvx_signal_13;
assign rvx_signal_33 = (rvx_signal_32)? rvx_signal_39 : rvx_signal_07;
assign {rvx_signal_11,rvx_signal_17} = rvx_signal_32? rvx_signal_37 : rvx_signal_20;
assign rvx_signal_42 = 0;

assign rvx_signal_29 = rvx_signal_36;
assign rvx_signal_30 = rvx_signal_21 ^ rvx_port_6;
assign rvx_signal_10 = rvx_signal_32? rvx_signal_39 : rvx_signal_07;
assign {rvx_signal_27,rvx_signal_24} = rvx_signal_32? rvx_signal_22 : rvx_signal_37;
assign rvx_signal_34 = 0;

assign rvx_signal_12 = (rvx_signal_36!=`FPIR_TYPE_NORMAL);

always@(*)
begin
	rvx_signal_26 = 0;
	if(rvx_signal_36==`FPIR_TYPE_NORMAL)
		case(rvx_signal_05)
			`FPIR_TYPE_MZERO,
			`FPIR_TYPE_PZERO:
				rvx_signal_26 = 1;
			`FPIR_TYPE_NORMAL:
				if(rvx_signal_25 && (~rvx_signal_32))
					rvx_signal_26 = 1;
		endcase
end

always@(*)
begin
	rvx_signal_35 = 0;
	if(rvx_signal_36==`FPIR_TYPE_NORMAL)
		case(rvx_signal_15)
			`FPIR_TYPE_MZERO,
			`FPIR_TYPE_PZERO:
				rvx_signal_35 = 1;
			`FPIR_TYPE_NORMAL:
				if(rvx_signal_25 && rvx_signal_32)
					rvx_signal_35 = 1;
		endcase
end

assign rvx_port_1 = (rvx_signal_12 | rvx_signal_26 | rvx_signal_35);
assign rvx_signal_08 = rvx_signal_36;
assign rvx_signal_38 = rvx_signal_26? rvx_signal_13 : rvx_signal_30;
assign rvx_signal_19 = rvx_signal_26? rvx_signal_07 : rvx_signal_39;
assign rvx_signal_09 = rvx_signal_26? rvx_signal_04 : rvx_signal_44;
assign rvx_signal_43 = rvx_signal_26? rvx_signal_06 : rvx_signal_40;
always@(*)
begin
  rvx_signal_31 = 0;
  if(rvx_signal_26)
  begin
    if(rvx_signal_07[BW_EXPONENT-1])
      rvx_signal_31 = -1;
  end
  else
  begin
    if(rvx_signal_39[BW_EXPONENT-1])
      rvx_signal_31 = -1;
  end
end

endmodule
