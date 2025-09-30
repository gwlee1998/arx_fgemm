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


`include "ervp_uart_defines.vh"




module RVX_MODULE_100 (
	rvx_port_12, 
	rvx_port_07,
	rvx_port_13, 
	rvx_port_02, 
	rvx_port_06, 
	rvx_port_00, 
	rvx_port_03, 

	rvx_port_05, 
	rvx_port_01,

	rvx_port_09,
	rvx_port_10, 
	rvx_port_08, 
	rvx_port_04, 
	rvx_port_11

	);




`include "rvx_include_17.vh"

input wire rvx_port_12;
input wire rvx_port_07;
input wire [`BW_UART_REG_INDEX-1:0] rvx_port_13;
input wire [7:0] rvx_port_02;
output reg [7:0] rvx_port_06;
input wire rvx_port_00;
input wire rvx_port_03;

output wire rvx_port_05;
input wire rvx_port_01;

input wire [3:0] rvx_port_09;
output wire rvx_port_10;
output wire rvx_port_08;
output reg rvx_port_04;
output wire rvx_port_11;

reg						rvx_signal_049;

reg 					rvx_signal_051;

assign rvx_port_11 = rvx_signal_051; 

wire 					rvx_signal_095;

reg 	[3:0] 			rvx_signal_048;
reg 	[3:0] 			rvx_signal_028;
reg 	[1:0] 			rvx_signal_007;  
reg 	[4:0] 			rvx_signal_061;
reg 	[7:0] 			rvx_signal_038;
reg 	[7:0] 			rvx_signal_091;
reg 	[15:0]			rvx_signal_076;  
reg 	[7:0] 			rvx_signal_082; 
reg 					rvx_signal_058; 
reg 					rvx_signal_011; 
reg 					rvx_signal_047; 
reg 	[15:0] 			rvx_signal_052;  

reg		 [3:0] 			rvx_signal_037; 
reg 					rvx_signal_014;
reg 					rvx_signal_002;

wire 					rvx_signal_036;			   
wire 					rvx_signal_023, rvx_signal_000, rvx_signal_040, rvx_signal_005; 
wire 					rvx_signal_059;		   
wire 					rvx_signal_019, rvx_signal_010, rvx_signal_032, rvx_signal_039;	   
wire                    rvx_signal_060, rvx_signal_034, rvx_signal_081, rvx_signal_017; 

wire [7:0] 				rvx_signal_069;
wire 					rvx_signal_077, rvx_signal_096, rvx_signal_018, rvx_signal_042, rvx_signal_092, rvx_signal_063, rvx_signal_024, rvx_signal_043;
reg						rvx_signal_025, rvx_signal_067, rvx_signal_030, rvx_signal_033, rvx_signal_065, rvx_signal_066, rvx_signal_097, rvx_signal_046;
wire 					rvx_signal_041; 

reg						rvx_signal_088, rvx_signal_099;

wire 					rvx_signal_078;  
wire 					rvx_signal_101;  
wire 					rvx_signal_022;   
wire					rvx_signal_085; 
wire 					rvx_signal_087;   

reg 					rvx_signal_054;
reg		[7:0]			rvx_signal_050;
reg 					rvx_signal_029;
wire [`UART_FIFO_REC_WIDTH-1:0] 	rvx_signal_016;
wire 								rvx_signal_004; 
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_021;
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_075;
wire [2:0] 				rvx_signal_073;
wire [3:0] 				rvx_signal_062;
wire [9:0] 				rvx_signal_015;

wire					rvx_signal_102; 
reg  	[7:0]			rvx_signal_093;   
reg  	[7:0]			rvx_signal_035; 

wire					rvx_signal_083;
wire					rvx_signal_006;

wire rvx_signal_012;

assign rvx_signal_069[7:0] = { rvx_signal_046, rvx_signal_097, rvx_signal_066, rvx_signal_065, rvx_signal_033, rvx_signal_030, rvx_signal_067, rvx_signal_025 };

assign {rvx_signal_023, rvx_signal_000, rvx_signal_040, rvx_signal_005} = rvx_port_09;
assign {rvx_signal_019, rvx_signal_010, rvx_signal_032, rvx_signal_039} = ~{rvx_signal_023,rvx_signal_000,rvx_signal_040,rvx_signal_005};

assign {rvx_signal_060, rvx_signal_034, rvx_signal_081, rvx_signal_017} = rvx_signal_059 ? {rvx_signal_061[`UART_MC_RTS],rvx_signal_061[`UART_MC_DTR],rvx_signal_061[`UART_MC_OUT1],rvx_signal_061[`UART_MC_OUT2]} :	{rvx_signal_023,rvx_signal_000,rvx_signal_040,rvx_signal_005};

assign rvx_signal_036 = rvx_signal_038[`UART_LC_DL];
assign rvx_signal_059 = rvx_signal_061[4];

assign rvx_port_10 = rvx_signal_061[`UART_MC_RTS];
assign rvx_port_08 = rvx_signal_061[`UART_MC_DTR];

RVX_MODULE_094 i_rvx_instance_0(
	.rvx_port_08(rvx_port_12), 
	.rvx_port_05(rvx_port_07), 
	.rvx_port_06(rvx_signal_038), 
	.rvx_port_02(rvx_signal_054), 
	.rvx_port_09(rvx_signal_050), 
	.rvx_port_10(rvx_signal_051), 
	.rvx_port_07(rvx_signal_012), 
	.rvx_port_01(rvx_signal_073), 
	.rvx_port_03(rvx_signal_075), 
	.rvx_port_00(rvx_signal_002), 
	.rvx_port_04(rvx_signal_041)
);

always @ (posedge rvx_port_12 or posedge rvx_port_07)
begin
	if (rvx_port_12) begin
		rvx_signal_088 <= 1'b1;
		rvx_signal_099 <= 1'b1;
	end
	else begin
		rvx_signal_088 <= rvx_port_01;    
		rvx_signal_099 <= rvx_signal_088;    
	end
end

assign rvx_signal_095 = (rvx_signal_049 == 0) ? 1'b1 : rvx_signal_099;

wire 	serial_in	= rvx_signal_059 ? rvx_signal_012 : rvx_signal_095;
assign	rvx_port_05 	= (rvx_signal_059 || (rvx_signal_049 == 0)) ? 1'b1 : rvx_signal_012;

RVX_MODULE_113 i_rvx_instance_1(
	.rvx_port_00(rvx_port_12), 
	.rvx_port_01(rvx_port_07), 
	.rvx_port_12(rvx_signal_038), 
	.rvx_port_14(rvx_signal_029), 
	.rvx_port_03(serial_in), 
	.rvx_port_11(rvx_signal_051), 
	.rvx_port_06(rvx_signal_015), 
	.rvx_port_08(rvx_signal_021), 
	.rvx_port_10(rvx_signal_016), 
	.rvx_port_02(rvx_signal_004), 
	.rvx_port_07(rvx_signal_083), 
	.rvx_port_13(rvx_signal_014), 
	.rvx_port_04(rvx_signal_041), 
	.rvx_port_05(rvx_signal_062), 
	.rvx_port_09(rvx_signal_006)
);

always @*
begin
	case (rvx_port_13)
	`UART_REG_RB   	: rvx_port_06 = rvx_signal_036 ? rvx_signal_076[7:0] : rvx_signal_016[10:3];
	`UART_REG_IE	: rvx_port_06 = rvx_signal_036 ? rvx_signal_076[15:8] : rvx_signal_048;
	`UART_REG_II	: rvx_port_06 = {4'b1100,rvx_signal_028};
	`UART_REG_LC	: rvx_port_06 = rvx_signal_038;
	`UART_REG_LS	: rvx_port_06 = rvx_signal_069;
	`UART_REG_MS	: rvx_port_06 = rvx_signal_091;
	`UART_REG_SR	: rvx_port_06 = rvx_signal_082;
	`UART_REG_EN	: rvx_port_06 = {7'b0, rvx_signal_049};
	`UART_REG_TC	: rvx_port_06 = {{(8-FIFO_COUNTER_W){1'b0}}, rvx_signal_075};
	default			: rvx_port_06 = 8'b0; 
	endcase
end 

always @(posedge rvx_port_12 or posedge rvx_port_07)
begin
	if (rvx_port_12) begin
		rvx_signal_049 <=  0; 
	end
	else begin
		if(rvx_port_00 && (rvx_port_13==`UART_REG_EN)) begin
			rvx_signal_049 <= rvx_port_02[0];
		end
	end
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_029 <=  0; 
	else
	if (rvx_signal_029)	
		rvx_signal_029 <=  0;
	else
	if (rvx_port_03 && (rvx_port_13 == `UART_REG_RB) && !rvx_signal_036)
		rvx_signal_029 <=  1; 
end

wire 	rvx_signal_100;
wire 	rvx_signal_068;
wire  	rvx_signal_089;
wire	rvx_signal_090;
wire	rvx_signal_013;

assign rvx_signal_100 = (rvx_port_03 && (rvx_port_13 == `UART_REG_LS) && !rvx_signal_036);
assign rvx_signal_068 	= (rvx_port_03 && (rvx_port_13 == `UART_REG_II) && !rvx_signal_036);
assign rvx_signal_089 	= (rvx_port_03 && (rvx_port_13 == `UART_REG_MS) && !rvx_signal_036);
assign rvx_signal_090 	= (rvx_port_03 && (rvx_port_13 == `UART_REG_RB) && !rvx_signal_036);
assign rvx_signal_013 	= (rvx_port_00 && (rvx_port_13 == `UART_REG_TR) && !rvx_signal_036);

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_011 <=  0;
	else 
		rvx_signal_011 <=  rvx_signal_100;
end

assign rvx_signal_041 = rvx_signal_100 && ~rvx_signal_011;

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_047 <=  1;
	else
	if (rvx_signal_047)
		rvx_signal_047 <=  0;
	else
	if (rvx_signal_089)
		rvx_signal_047 <=  1; 
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_038 <=  8'b00000011; 
	else
	if (rvx_port_00 && (rvx_port_13==`UART_REG_LC))
		rvx_signal_038 <=  rvx_port_02;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
	begin
		rvx_signal_048 <=  4'b0000; 
		rvx_signal_076[15:8] <=  8'b0;
	end
	else
	if (rvx_port_00 && (rvx_port_13==`UART_REG_IE))
		if (rvx_signal_036)
		begin
			rvx_signal_076[15:8] <=  rvx_port_02;
		end
		else
			rvx_signal_048 <=  rvx_port_02[3:0]; 
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) begin
		rvx_signal_007 <=  2'b11; 
		rvx_signal_014 <=  0;
		rvx_signal_002 <=  0;
	end else
	if (rvx_port_00 && (rvx_port_13==`UART_REG_FC)) begin
		rvx_signal_007 <=  rvx_port_02[7:6];
		rvx_signal_014 <=  rvx_port_02[1];
		rvx_signal_002 <=  rvx_port_02[2];
	end else begin
		rvx_signal_014 <=  0;
		rvx_signal_002 <=  0;
	end
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_061 <=  5'b0; 
	else
	if (rvx_port_00 && (rvx_port_13==`UART_REG_MC))
			rvx_signal_061 <=  rvx_port_02[4:0];
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_082 <=  0; 
	else
	if (rvx_port_00 && (rvx_port_13==`UART_REG_SR))
		rvx_signal_082 <=  rvx_port_02;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
	begin
		rvx_signal_076[7:0]  	<=  8'b0;
		rvx_signal_054   	<=  1'b0;
		rvx_signal_058 	<=  1'b0;
		rvx_signal_050	<= 0;
	end
	else
	if (rvx_port_00 && (rvx_port_13==`UART_REG_TR))
		if (rvx_signal_036)
		begin
			rvx_signal_076[7:0] <=  rvx_port_02;
			rvx_signal_058 <=  1'b1; 
			rvx_signal_054 <=  1'b0;
		end
		else
		begin
			rvx_signal_054   <=  1'b1;
			rvx_signal_058 <=  1'b0;
			rvx_signal_050 <= rvx_port_02;
		end 
	else
	begin
		rvx_signal_058 <=  1'b0;
		rvx_signal_054   <=  1'b0;
	end 
end

always @(rvx_signal_007)
begin
	case (rvx_signal_007[`UART_FC_TL])
		2'b00 : rvx_signal_037 = 1;
		2'b01 : rvx_signal_037 = 4;
		2'b10 : rvx_signal_037 = 8;
		2'b11 : rvx_signal_037 = 14;
	endcase 
end
	

reg [3:0] rvx_signal_053;
always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
	  begin
  		rvx_signal_091 <=  0;
	  	rvx_signal_053[3:0] <=  0;
	  end
	else begin
		rvx_signal_091[`UART_MS_DDCD:`UART_MS_DCTS] <=  rvx_signal_047 ? 4'b0 :
			rvx_signal_091[`UART_MS_DDCD:`UART_MS_DCTS] | ({rvx_signal_039, rvx_signal_032, rvx_signal_010, rvx_signal_019} ^ rvx_signal_053[3:0]);
		rvx_signal_091[`UART_MS_CDCD:`UART_MS_CCTS] <=  {rvx_signal_017, rvx_signal_081, rvx_signal_034, rvx_signal_060};
		rvx_signal_053[3:0] <=  {rvx_signal_039, rvx_signal_032, rvx_signal_010, rvx_signal_019};
	end
end

assign rvx_signal_077 = (rvx_signal_021==0 && rvx_signal_006);  
assign rvx_signal_096 = rvx_signal_083;     
assign rvx_signal_018 = rvx_signal_016[1]; 
assign rvx_signal_042 = rvx_signal_016[0]; 
assign rvx_signal_092 = rvx_signal_016[2]; 
assign rvx_signal_063 = ((rvx_signal_075==5'b0) && rvx_signal_102);  
assign rvx_signal_024 = ((rvx_signal_075==5'b0) && rvx_signal_102 && (rvx_signal_073 ==  0)); 
assign rvx_signal_043 = rvx_signal_004 | rvx_signal_083;

reg 	 rvx_signal_031;

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_031 <=  0;
	else rvx_signal_031 <=  rvx_signal_077;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_025 <=  0;
	else rvx_signal_025 <=  (rvx_signal_021==1 && rvx_signal_029 && !rvx_signal_006 || rvx_signal_014) ? 0 : 
					  rvx_signal_025 || (rvx_signal_077 && ~rvx_signal_031); 
end

reg rvx_signal_044; 

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_044 <=  0;
	else rvx_signal_044 <=  rvx_signal_096;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_067 <=  0;
	else	rvx_signal_067 <= 	rvx_signal_041 ? 0 : rvx_signal_067 || (rvx_signal_096 && ~rvx_signal_044); 
end

reg rvx_signal_094; 

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_094 <=  0;
	else rvx_signal_094 <=  rvx_signal_018;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_030 <=  0;
	else rvx_signal_030 <=  rvx_signal_041 ? 0 : rvx_signal_030 || (rvx_signal_018 && ~rvx_signal_094); 
end

reg rvx_signal_003; 

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_003 <=  0;
	else rvx_signal_003 <=  rvx_signal_042;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_033 <=  0;
	else rvx_signal_033 <=  rvx_signal_041 ? 0 : rvx_signal_033 || (rvx_signal_042 && ~rvx_signal_003); 
end

reg rvx_signal_009; 

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_009 <=  0;
	else rvx_signal_009 <=  rvx_signal_092;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_065 <=  0;
	else rvx_signal_065 <=  rvx_signal_041 ? 0 : rvx_signal_065 || (rvx_signal_092 && ~rvx_signal_009);
end

reg rvx_signal_020;

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_020 <=  1;
	else rvx_signal_020 <=  rvx_signal_063;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_066 <=  1;
	else rvx_signal_066 <=  (rvx_signal_013) ? 0 :  rvx_signal_066 || (rvx_signal_063 && ~rvx_signal_020);
end

reg rvx_signal_098;

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_098 <=  1;
	else rvx_signal_098 <=  rvx_signal_024;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_097 <=  1;
	else rvx_signal_097 <=  (rvx_signal_013) ? 0 : rvx_signal_097 || (rvx_signal_024 && ~rvx_signal_098);
end

reg rvx_signal_071;

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_071 <=  0;
	else rvx_signal_071 <=  rvx_signal_043;
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_046 <=  0;
	else rvx_signal_046 <=  rvx_signal_041 ? 0 : rvx_signal_046 || (rvx_signal_043 && ~rvx_signal_071);
end

always @(posedge rvx_port_07 or posedge rvx_port_12) 
begin
	if (rvx_port_12)
		rvx_signal_052 <=  0;
	else
		if (rvx_signal_058 | ~ (|rvx_signal_052))
  			rvx_signal_052 <=  rvx_signal_076 - 1;               
		else
			rvx_signal_052 <=  rvx_signal_052 - 1;              
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_051 <=  1'b0;
	else
		if (|rvx_signal_076 & ~(|rvx_signal_052))     
			rvx_signal_051 <=  1'b1;
		else
			rvx_signal_051 <=  1'b0;
end

always @(rvx_signal_038)
begin
  case (rvx_signal_038[3:0])
    4'b0000                             : rvx_signal_035 =  95; 
    4'b0100                             : rvx_signal_035 = 103; 
    4'b0001, 4'b1000                    : rvx_signal_035 = 111; 
    4'b1100                             : rvx_signal_035 = 119; 
    4'b0010, 4'b0101, 4'b1001           : rvx_signal_035 = 127; 
    4'b0011, 4'b0110, 4'b1010, 4'b1101  : rvx_signal_035 = 143; 
    4'b0111, 4'b1011, 4'b1110           : rvx_signal_035 = 159; 
    4'b1111                             : rvx_signal_035 = 175; 
  endcase 
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
  if (rvx_port_12)
    rvx_signal_093 <=  8'd0;
  else
  if(rvx_signal_066 & rvx_signal_013)  
    rvx_signal_093 <=  rvx_signal_035;
  else
  if (rvx_signal_051 & rvx_signal_093 != 8'b0)  
    rvx_signal_093 <=  rvx_signal_093 - 1;  
end 

assign rvx_signal_102 = ~(|rvx_signal_093);

assign rvx_signal_078  = rvx_signal_048[`UART_IE_RLS] && (rvx_signal_069[`UART_LS_OE] || rvx_signal_069[`UART_LS_PE] || rvx_signal_069[`UART_LS_FE] || rvx_signal_069[`UART_LS_BI]);
assign rvx_signal_101  = rvx_signal_048[`UART_IE_RDA] && (rvx_signal_021 >= {1'b0,rvx_signal_037});
assign rvx_signal_085 = rvx_signal_048[`UART_IE_THRE] && rvx_signal_069[`UART_LS_TFE];
assign rvx_signal_087   = rvx_signal_048[`UART_IE_MS] && (| rvx_signal_091[3:0]);
assign rvx_signal_022   = rvx_signal_048[`UART_IE_RDA] && (rvx_signal_015 == 10'b0) && (|rvx_signal_021);

reg 	 rvx_signal_079;
reg 	 rvx_signal_026;
reg 	 rvx_signal_045;
reg 	 rvx_signal_086;
reg 	 rvx_signal_064;

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_079 <=  0;
	else rvx_signal_079 <=  rvx_signal_078;
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_064 <=  0;
	else rvx_signal_064 <=  rvx_signal_101;
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_026 <=  0;
	else rvx_signal_026 <=  rvx_signal_085;
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_045 <=  0;
	else rvx_signal_045 <=  rvx_signal_087;
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_086 <=  0;
	else rvx_signal_086 <=  rvx_signal_022;
end

wire 	 rvx_signal_084;
wire 	 rvx_signal_070;
wire 	 rvx_signal_027;
wire 	 rvx_signal_057;
wire 	 rvx_signal_055;

assign rvx_signal_055    = rvx_signal_101 & ~rvx_signal_064;
assign rvx_signal_084 	  = rvx_signal_078 & ~rvx_signal_079;
assign rvx_signal_070   = rvx_signal_085 & ~rvx_signal_026;
assign rvx_signal_027 	  = rvx_signal_087 & ~rvx_signal_045;
assign rvx_signal_057 	  = rvx_signal_022 & ~rvx_signal_086;

reg 	rvx_signal_074;
reg		rvx_signal_056;
reg 	rvx_signal_001;
reg 	rvx_signal_008;
reg 	rvx_signal_080;

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_074 <=  0; 
	else 
		rvx_signal_074 <=  rvx_signal_041 ? 0 :  						
							rvx_signal_084 ? 1 :						
							rvx_signal_074 && rvx_signal_048[`UART_IE_RLS];	
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_056 <=  0; 
	else 
		rvx_signal_056 <=  ((rvx_signal_021 == {1'b0,rvx_signal_037}) && rvx_signal_090) ? 0 :  	
							rvx_signal_055 ? 1 :						
							rvx_signal_056 && rvx_signal_048[`UART_IE_RDA];	
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_001 <=  0; 
	else 
		rvx_signal_001 <=  rvx_signal_013 || (rvx_signal_068 & ~rvx_signal_028[`UART_II_IP] & rvx_signal_028[`UART_II_II] == `UART_II_THRE)? 0 : 
							rvx_signal_070 ? 1 :
							rvx_signal_001 && rvx_signal_048[`UART_IE_THRE];
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_008 <=  0; 
	else 
		rvx_signal_008 <=  rvx_signal_089 ? 0 : 
							rvx_signal_027 ? 1 :
							rvx_signal_008 && rvx_signal_048[`UART_IE_MS];
end

always  @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12) rvx_signal_080 <=  0; 
	else 
		rvx_signal_080 <=  rvx_signal_090 ? 0 : 
							rvx_signal_057 ? 1 :
							rvx_signal_080 && rvx_signal_048[`UART_IE_RDA];
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)	
		rvx_port_04 <=  1'b0;
	else
		rvx_port_04 <= rvx_signal_074? ~rvx_signal_041 : (rvx_signal_056? 1 : (rvx_signal_080? ~rvx_signal_090 : (rvx_signal_001? !(rvx_signal_013 & rvx_signal_068) : (rvx_signal_008? ~rvx_signal_089 : 0))));
end

always @(posedge rvx_port_07 or posedge rvx_port_12)
begin
	if (rvx_port_12)
		rvx_signal_028 <=  1;
	else
	if (rvx_signal_074)  
	begin
		rvx_signal_028[`UART_II_II] <=  `UART_II_RLS;	
		rvx_signal_028[`UART_II_IP] <=  1'b0;		
	end else 
	if (rvx_signal_101)
	begin
		rvx_signal_028[`UART_II_II] <=  `UART_II_RDA;
		rvx_signal_028[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_080)
	begin
		rvx_signal_028[`UART_II_II] <=  `UART_II_TI;
		rvx_signal_028[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_001)
	begin
		rvx_signal_028[`UART_II_II] <=  `UART_II_THRE;
		rvx_signal_028[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_008)
	begin
		rvx_signal_028[`UART_II_II] <=  `UART_II_MS;
		rvx_signal_028[`UART_II_IP] <=  1'b0;
	end else	
	begin
		rvx_signal_028[`UART_II_II] <=  0;
		rvx_signal_028[`UART_II_IP] <=  1'b1;
	end
end

endmodule

