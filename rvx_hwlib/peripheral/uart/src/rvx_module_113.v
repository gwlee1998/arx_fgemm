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





module RVX_MODULE_113 (
	rvx_port_00, 
	rvx_port_01, 
	rvx_port_12, 
	rvx_port_14, 
	rvx_port_03, 
	rvx_port_11, 
	rvx_port_06, 
	rvx_port_08, 
	rvx_port_10, 
	rvx_port_02, 
	rvx_port_07, 
	rvx_port_13, 
	rvx_port_04, 
	rvx_port_05, 
	rvx_port_09
);





input wire rvx_port_01;
input wire rvx_port_00;
input wire [7:0] rvx_port_12;
input wire rvx_port_14;
input wire rvx_port_03;
input wire rvx_port_11;
input wire rvx_port_13;
input wire rvx_port_04;

`include "rvx_include_17.vh"

output reg [9:0] rvx_port_06;
output wire [FIFO_COUNTER_W-1:0] rvx_port_08;
output wire [`UART_FIFO_REC_WIDTH-1:0] rvx_port_10;
output wire rvx_port_07;
output wire rvx_port_02;
output reg [3:0] rvx_port_05;
output wire rvx_port_09;

reg	[3:0]	rvx_signal_06;
reg	[2:0]	rvx_signal_00;
reg	[7:0]	rvx_signal_10;			
reg		rvx_signal_14;		
reg		rvx_signal_07;
reg		rvx_signal_11;		
reg		rvx_signal_03;
reg		rvx_signal_15;
reg	[7:0]	rvx_signal_17;	
reg   rvx_signal_05;

reg	[`UART_FIFO_REC_WIDTH-1:0]	rvx_signal_13;
reg				rvx_signal_08;
wire 				break_error = (rvx_signal_17 == 0);

RVX_MODULE_109 #(`UART_FIFO_REC_WIDTH) i_rvx_instance_0(
	.rvx_port_08(rvx_port_01), 
	.rvx_port_06(rvx_port_00),
	.rvx_port_00(rvx_signal_13),
	.rvx_port_05(rvx_port_10),
	.rvx_port_01(rvx_port_09),
	.rvx_port_09(rvx_port_14),
	.rvx_port_10(rvx_port_07),
	.rvx_port_02(rvx_port_08),
	.rvx_port_07(rvx_port_02),
	.rvx_port_03(rvx_port_13),
	.rvx_port_04(rvx_port_04)
);

wire 		rcounter16_eq_7 = (rvx_signal_06 == 4'd7);
wire		rcounter16_eq_0 = (rvx_signal_06 == 4'd0);
wire		rcounter16_eq_1 = (rvx_signal_06 == 4'd1);

wire [3:0] rcounter16_minus_1 = rvx_signal_06 - 1'b1;

parameter  RVX_GPARA_07 					= 4'd0;
parameter  RVX_GPARA_06 			= 4'd1;
parameter  RVX_GPARA_04 				= 4'd2;
parameter  RVX_GPARA_09			= 4'd3;
parameter  RVX_GPARA_02 				= 4'd4;
parameter  RVX_GPARA_05 		= 4'd5;
parameter  RVX_GPARA_10 			= 4'd6;
parameter  RVX_GPARA_01				= 4'd7;
parameter  RVX_GPARA_00	      = 4'd8;
parameter  RVX_GPARA_03 					= 4'd9;
parameter  RVX_GPARA_08 					= 4'd10;

always @(posedge rvx_port_01 or posedge rvx_port_00)
begin
  if (rvx_port_00)
  begin
	rvx_port_05 			<=  RVX_GPARA_07;
	rvx_signal_03 				<=  1'b0;
	rvx_signal_06 			<=  0;
	rvx_signal_00 		<=  0;
	rvx_signal_15 		<=  1'b0;
	rvx_signal_11 	<=  1'b0;
	rvx_signal_07 		<=  1'b0;
	rvx_signal_14 				<=  1'b0;
	rvx_signal_10 				<=  0;
	rvx_signal_08 				<=  1'b0;
	rvx_signal_13 			<=  0;
  end
  else
  if (rvx_port_11)
  begin
	case (rvx_port_05)
	RVX_GPARA_07 : begin
			rvx_signal_08 			  <=  1'b0;
			rvx_signal_13 	  <=  0;
			rvx_signal_06 	  <=  4'b1110;
			if (rvx_port_03==1'b0 & ~break_error)   
			begin
				rvx_port_05 		  <=  RVX_GPARA_06;
			end
		end
	RVX_GPARA_06 :	begin
  			rvx_signal_08 			  <=  1'b0;
				if (rcounter16_eq_7)    
					if (rvx_port_03==1'b1)   
						rvx_port_05 <=  RVX_GPARA_07;
					else            
						rvx_port_05 <=  RVX_GPARA_10;
				rvx_signal_06 <=  rcounter16_minus_1;
			end
	RVX_GPARA_10:begin
				case (rvx_port_12[1:0])  
				2'b00 : rvx_signal_00 <=  3'b100;
				2'b01 : rvx_signal_00 <=  3'b101;
				2'b10 : rvx_signal_00 <=  3'b110;
				2'b11 : rvx_signal_00 <=  3'b111;
				endcase
				if (rcounter16_eq_0)
				begin
					rvx_port_05		<=  RVX_GPARA_04;
					rvx_signal_06	<=  4'b1110;
					rvx_signal_10		<=  0;
				end
				else
					rvx_port_05 <=  RVX_GPARA_10;
				rvx_signal_06 <=  rcounter16_minus_1;
			end
	RVX_GPARA_04 :	begin
				if (rcounter16_eq_0)
					rvx_port_05 <=  RVX_GPARA_01;
				if (rcounter16_eq_7) 
					case (rvx_port_12[1:0])  
					2'b00 : rvx_signal_10[4:0]  <=  {rvx_port_03, rvx_signal_10[4:1]};
					2'b01 : rvx_signal_10[5:0]  <=  {rvx_port_03, rvx_signal_10[5:1]};
					2'b10 : rvx_signal_10[6:0]  <=  {rvx_port_03, rvx_signal_10[6:1]};
					2'b11 : rvx_signal_10[7:0]  <=  {rvx_port_03, rvx_signal_10[7:1]};
					endcase
				rvx_signal_06 <=  rcounter16_minus_1;
			end
	RVX_GPARA_01 :   begin
				if (rvx_signal_00==3'b0) 
					if (rvx_port_12[`UART_LC_PE]) 
						rvx_port_05 <=  RVX_GPARA_09;
					else
					begin
						rvx_port_05 <=  RVX_GPARA_02;
						rvx_signal_07 <=  1'b0;  
					end
				else		
				begin
					rvx_port_05 <=  RVX_GPARA_04;
					rvx_signal_00 <=  rvx_signal_00 - 1'b1;
				end
				rvx_signal_06 <=  4'b1110;
			end
	RVX_GPARA_09: begin
				if (rcounter16_eq_7)	
				begin
					rvx_signal_14 <=  rvx_port_03;
					rvx_port_05 <=  RVX_GPARA_00;
				end
				rvx_signal_06 <=  rcounter16_minus_1;
			end
	RVX_GPARA_00 : begin    
				rvx_signal_06  <=  rcounter16_minus_1;
				rvx_signal_15 <=  ^{rvx_signal_10,rvx_signal_14}; 
				rvx_port_05      <=  RVX_GPARA_05;
			  end
	RVX_GPARA_05: begin	  
				case ({rvx_port_12[`UART_LC_EP],rvx_port_12[`UART_LC_SP]})
					2'b00: rvx_signal_07 <=   rvx_signal_15 == 0;  
					2'b01: rvx_signal_07 <=  ~rvx_signal_14;      
					2'b10: rvx_signal_07 <=   rvx_signal_15 == 1;   
					2'b11: rvx_signal_07 <=   rvx_signal_14;	  
				endcase
				rvx_signal_06 <=  rcounter16_minus_1;
				rvx_port_05 <=  RVX_GPARA_03;
			  end
	RVX_GPARA_03 :	if (rcounter16_eq_0)
			begin
				rvx_port_05 <=  RVX_GPARA_02;
				rvx_signal_06 <=  4'b1110;
			end
			else
				rvx_signal_06 <=  rcounter16_minus_1;
	RVX_GPARA_02 :	begin
				if (rcounter16_eq_7)	
				begin
					rvx_signal_11 <=  !rvx_port_03; 
					rvx_port_05 <=  RVX_GPARA_08;
				end
				rvx_signal_06 <=  rcounter16_minus_1;
			end
	RVX_GPARA_08 :	begin
        if(rvx_port_03 | break_error)
          begin
            if(break_error)
        		  rvx_signal_13 	<=  {8'b0, 3'b100}; 
            else
        			rvx_signal_13  <=  {rvx_signal_10, 1'b0, rvx_signal_07, rvx_signal_11};
      		  rvx_signal_08 		  <=  1'b1;
    				rvx_port_05        <=  RVX_GPARA_07;
          end
        else if(~rvx_signal_11)  
          begin
       			rvx_signal_13  <=  {rvx_signal_10, 1'b0, rvx_signal_07, rvx_signal_11};
      		  rvx_signal_08 		  <=  1'b1;
      			rvx_signal_06 	  <=  4'b1110;
    				rvx_port_05 		  <=  RVX_GPARA_06;
          end
                      
			end
	default : rvx_port_05 <=  RVX_GPARA_07;
	endcase
  end  
end 

always @ (posedge rvx_port_01 or posedge rvx_port_00)
begin
  if(rvx_port_00)
    rvx_signal_05 <= 0;
  else
    rvx_signal_05 <=  rvx_signal_08;
end

assign rvx_port_09 = rvx_signal_08 & ~rvx_signal_05;

  

reg 	[9:0]	rvx_signal_01; 

always @(rvx_port_12)
	case (rvx_port_12[3:0])
		4'b0000										: rvx_signal_01 = 447; 
		4'b0100										: rvx_signal_01 = 479; 
		4'b0001,	4'b1000							: rvx_signal_01 = 511; 
		4'b1100										: rvx_signal_01 = 543; 
		4'b0010, 4'b0101, 4'b1001				: rvx_signal_01 = 575; 
		4'b0011, 4'b0110, 4'b1010, 4'b1101	: rvx_signal_01 = 639; 
		4'b0111, 4'b1011, 4'b1110				: rvx_signal_01 = 703; 
		4'b1111										: rvx_signal_01 = 767; 
	endcase 

wire [7:0] 	rvx_signal_09; 
assign 		rvx_signal_09 = rvx_signal_01[9:2]; 

always @(posedge rvx_port_01 or posedge rvx_port_00)
begin
	if (rvx_port_00)
		rvx_signal_17 <=  8'd159;
	else
	if (rvx_port_03)
		rvx_signal_17 <=  rvx_signal_09; 
	else
	if(rvx_port_11 & rvx_signal_17 != 8'b0)            
		rvx_signal_17 <=  rvx_signal_17 - 1;  
end 

always @(posedge rvx_port_01 or posedge rvx_port_00)
begin
	if (rvx_port_00)
		rvx_port_06 <=  10'd639; 
	else
		if(rvx_port_09 || rvx_port_14 || rvx_port_08 == 0) 
			rvx_port_06 <=  rvx_signal_01;
		else
		if (rvx_port_11 && rvx_port_06 != 10'b0)  
			rvx_port_06 <=  rvx_port_06 - 1;		
end
	
endmodule

