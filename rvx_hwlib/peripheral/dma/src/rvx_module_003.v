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
`include "rvx_include_08.vh"




module RVX_MODULE_003
(
	rvx_port_14,
	rvx_port_01,

	rvx_port_04,
	rvx_port_10,
	rvx_port_06,
	rvx_port_11,

	rvx_port_08,
	rvx_port_12,
	rvx_port_13,

	rvx_port_07,
	rvx_port_09,
	rvx_port_03,
	rvx_port_05,
	rvx_port_00,
	rvx_port_02
);




parameter RVX_GPARA_0 = 32;
parameter BW_AXI_DATA = 32;

`include "rvx_include_05.vh"
`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_2 = 16;
localparam  RVX_LPARA_4 = AXI_SIZE_BYTE * (MAX_AXI_LENGTH + 1);	
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_UNSIGNED(MAX_AXI_LENGTH);
localparam  RVX_LPARA_3 = AXI_SIZE;
localparam  RVX_LPARA_0 = RVX_LPARA_2 - RVX_LPARA_1 - RVX_LPARA_3;

input wire rvx_port_14;
input wire rvx_port_01;

input wire [RVX_GPARA_0-1:0] rvx_port_04;
input wire [BW_LINE_SIZE-1:0] rvx_port_10;
input wire [BW_NUM_LINES-1:0] rvx_port_06;
input wire [RVX_GPARA_0-1:0] rvx_port_11;

input wire rvx_port_08;
input wire rvx_port_12;
output wire rvx_port_13;

output wire [RVX_GPARA_0-1:0] rvx_port_07;
output wire rvx_port_09;
output reg [`BW_AXI_ALEN-1:0] rvx_port_03;
output reg [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_05;
output wire rvx_port_00;
input wire rvx_port_02;

reg [RVX_GPARA_0-1:0] rvx_signal_04;
reg [RVX_GPARA_0-1:0] rvx_signal_08;

reg [RVX_LPARA_2-1:0] rvx_signal_03;

`define RVX_LDEF_5	3
`define RVX_LDEF_3    	0
`define RVX_LDEF_1   	1
`define RVX_LDEF_0	2
`define RVX_LDEF_4		3
`define RVX_LDEF_2		4

reg [`RVX_LDEF_5-1:0] rvx_signal_01;

wire rvx_signal_10;
wire rvx_signal_13;
wire rvx_signal_11;

reg [BW_NUM_LINES-1:0] rvx_signal_14;

wire [RVX_LPARA_0-1:0] rvx_signal_02;
wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire [RVX_LPARA_1-1:0] rvx_signal_16;
wire [RVX_LPARA_3-1:0] rvx_signal_12;
wire rvx_signal_09;
reg rvx_signal_06;
reg rvx_signal_00;

wire rvx_signal_15;
wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_signal_05;

assign {rvx_signal_02, rvx_signal_07, rvx_signal_12} = rvx_port_10;
assign rvx_signal_16 = rvx_signal_07 - 1;

assign rvx_port_07 = rvx_signal_08;

assign rvx_signal_15 = (rvx_signal_01 != `RVX_LDEF_3) & (rvx_signal_01 != `RVX_LDEF_1);
assign rvx_port_00 = rvx_signal_15 & (~rvx_port_12);
assign rvx_signal_10 = rvx_port_00 & rvx_port_02;

assign rvx_signal_13 = (rvx_signal_03 > rvx_port_10);
assign rvx_signal_11 = (rvx_signal_14 == rvx_port_06);

assign rvx_port_09 = ((rvx_signal_01 == `RVX_LDEF_0) || (rvx_signal_01 == `RVX_LDEF_4));
assign rvx_signal_09 = (rvx_signal_01==`RVX_LDEF_3) & rvx_port_08;
assign rvx_signal_05 = $unsigned((1 << rvx_signal_12) - 1);

always@(*)
begin
	rvx_signal_06 = 0;
	case(rvx_signal_01)
		`RVX_LDEF_0:
			if(rvx_signal_13 & (rvx_signal_07 == 0) & (rvx_signal_12 == 0))
				rvx_signal_06 = 1;
		`RVX_LDEF_4:
			if(rvx_signal_12 == 0)
				rvx_signal_06= 1;
		`RVX_LDEF_2:
			rvx_signal_06 = 1;
	endcase
end

assign rvx_port_13 = rvx_signal_10 & rvx_signal_11 & rvx_signal_06;

always@(*)
begin
	rvx_signal_00 = 0;
	case(rvx_signal_01)
		`RVX_LDEF_3,
		`RVX_LDEF_1:
			rvx_signal_00 = 1;
		`RVX_LDEF_0,
		`RVX_LDEF_4,
		`RVX_LDEF_2:
			rvx_signal_00 = rvx_signal_10;
	endcase
end

always@(posedge rvx_port_14, negedge rvx_port_01)
begin
	if(rvx_port_01==0)
	begin
		rvx_signal_01 <= `RVX_LDEF_3;
		rvx_port_03 <= 0;
		rvx_signal_14 <= 0;
		rvx_port_05 <= 0;
	end
	else if(rvx_port_13)
	begin
		rvx_signal_01 <= `RVX_LDEF_3;
		rvx_signal_14 <= 0;
	end
	else if(rvx_signal_00)
	begin
		case(rvx_signal_01)
			`RVX_LDEF_3:
				if(rvx_signal_09)
					rvx_signal_01 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
			begin
				rvx_signal_14 <= rvx_signal_14 + 1;
				if(rvx_signal_02 > 0)
				begin
					rvx_signal_01 <= `RVX_LDEF_0;
					rvx_port_03 <= MAX_AXI_LENGTH;
					rvx_port_05 <= `ALL_ONE;
				end
				else if(rvx_signal_07 > 0)
				begin
					rvx_signal_01 <= `RVX_LDEF_4;
					rvx_port_03 <= rvx_signal_16;
					rvx_port_05 <= `ALL_ONE;
				end
				else if(rvx_signal_12 > 0)
				begin
					rvx_signal_01 <= `RVX_LDEF_2;
					rvx_port_03 <= `AXI_LENGTH_01;
					rvx_port_05 <= rvx_signal_05;
				end
				else
					rvx_signal_01 <= `RVX_LDEF_3;
			end
			`RVX_LDEF_0:
				if(rvx_port_12 == 0)
				begin
					if(rvx_signal_13)
					begin
						if(rvx_signal_07 > 0)
						begin
							rvx_signal_01 <= `RVX_LDEF_4;
							rvx_port_03 <= rvx_signal_16;
							rvx_port_05 <= `ALL_ONE;
						end
						else if(rvx_signal_12 > 0)
						begin
							rvx_signal_01 <= `RVX_LDEF_2;
							rvx_port_03 <= `AXI_LENGTH_01;
							rvx_port_05 <= rvx_signal_05;
						end
						else if(!rvx_signal_11)
							rvx_signal_01 <= `RVX_LDEF_1;
					end
				end
			`RVX_LDEF_4:
				if(rvx_port_12 == 0)
				begin
					if(rvx_signal_12 > 0)
					begin
						rvx_signal_01 <= `RVX_LDEF_2;
						rvx_port_03 <= `AXI_LENGTH_01;
						rvx_port_05 <= rvx_signal_05;
					end
					else if(!rvx_signal_11)
						rvx_signal_01 <= `RVX_LDEF_1;
				end
			`RVX_LDEF_2:
				if(rvx_port_12 == 0)
				begin
					if(!rvx_signal_11)
						rvx_signal_01 <= `RVX_LDEF_1;
				end
		endcase
	end
end

always @(posedge rvx_port_14 or negedge rvx_port_01)
begin
	if(rvx_port_01 == 0)
	begin
		rvx_signal_08 <= 0;
		rvx_signal_04 <= 0;
		rvx_signal_03 <= 0;
	end
	else if(rvx_signal_01 == `RVX_LDEF_1)
	begin
		if(rvx_signal_14==0)
		begin
			rvx_signal_08 <= rvx_port_04;

			rvx_signal_04 <= rvx_port_04;
		end
		else
		begin
			rvx_signal_08 <= rvx_signal_04 + rvx_port_11;
			rvx_signal_04 <= rvx_signal_04 + rvx_port_11;
		end
		rvx_signal_03 <= RVX_LPARA_4 * 2;
	end
	else if(rvx_port_12 == 0)
	begin
		case(rvx_signal_01)
			`RVX_LDEF_0:
			begin
				if(rvx_signal_10)
				begin
					rvx_signal_08 <= rvx_signal_08 + RVX_LPARA_4;
					rvx_signal_03 <= rvx_signal_03 + RVX_LPARA_4;
				end
			end
			`RVX_LDEF_4:
			begin
				if(rvx_signal_10)
				begin
					rvx_signal_08 <= rvx_signal_08 + (rvx_signal_07 << AXI_SIZE);
				end
			end
		endcase
	end
end

endmodule
