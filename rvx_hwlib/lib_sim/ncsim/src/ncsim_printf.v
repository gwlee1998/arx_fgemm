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

`include "timescale.vh"


module NCSIM_PRINTF
(
	uart_rx,
	uart_tx,
	core_finish
);


parameter UART_CLK_HZ = 1000;
parameter SAMPLING_RATE = 4;

input wire uart_rx;
output wire uart_tx;
output reg core_finish;

localparam  RVX_LPARA_07 = 115200;
localparam integer RVX_LPARA_10 = (1.0)*UART_CLK_HZ/(16*RVX_LPARA_07);
localparam integer RVX_LPARA_12 = (RVX_LPARA_10<=1)? 1 : RVX_LPARA_10;
localparam  RVX_LPARA_06 = UART_CLK_HZ/(16*RVX_LPARA_12);
localparam  RVX_LPARA_16 = (RVX_LPARA_06<=1)? 1 : RVX_LPARA_06;
localparam  RVX_LPARA_03 = ((1000000.0/(RVX_LPARA_16/1000))/2.0);
localparam  RVX_LPARA_09 = (RVX_LPARA_03/SAMPLING_RATE);	

localparam  RVX_LPARA_01 = 4'h0;
localparam  RVX_LPARA_08 = 4'h1;
localparam  RVX_LPARA_13 = 4'h2;
localparam  RVX_LPARA_02 = 4'h3;
localparam  RVX_LPARA_14 = 4'h4;
localparam  RVX_LPARA_05 = 4'h5;
localparam  RVX_LPARA_15 = 4'h6;
localparam  RVX_LPARA_11 = 4'h7;
localparam  RVX_LPARA_04 = 4'h8;
localparam  RVX_LPARA_00 = 4'h9;

reg rvx_signal_6;

reg	[3:0]	rvx_signal_7;
reg	[7:0]	rvx_signal_0;

reg	[7:0]	rvx_signal_5;
reg	rvx_signal_2;

reg	[SAMPLING_RATE-2:0]	rvx_signal_1;
wire rvx_signal_4;

wire rvx_signal_3;

integer result_file;

`ifdef PRINTF_BOTH_OUT
	`define RVX_LDEF_2
	`define RVX_LDEF_0
`else
	`ifdef PRINTF_FILE_OUT_ONLY
		`define RVX_LDEF_2
	`else
		`define RVX_LDEF_0
	`endif
`endif

initial rvx_signal_6 <= 0;
always #(RVX_LPARA_09) rvx_signal_6 <= ~rvx_signal_6;

always @(posedge rvx_signal_6)
begin
	rvx_signal_1 <= {rvx_signal_1, uart_rx};
end

assign rvx_signal_4 = (rvx_signal_1==0) ? 1'b0 : 1'b1;
assign rvx_signal_3 = (rvx_signal_0==(SAMPLING_RATE-1));

initial begin
	rvx_signal_7 <= RVX_LPARA_01;
	rvx_signal_0	<= 0;
	rvx_signal_5 <= 0;
end

always @(posedge rvx_signal_6)
begin
	case(rvx_signal_7)
	RVX_LPARA_01: begin
		if(rvx_signal_4 == 0) begin
			
			rvx_signal_7 <= RVX_LPARA_08;
			rvx_signal_0 <= 0;
		end
	end
	RVX_LPARA_08: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_13; 
			rvx_signal_0			<= 0;
			rvx_signal_5[0]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_13: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_02; 
			rvx_signal_0			<= 0;
			rvx_signal_5[1]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_02: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_14; 
			rvx_signal_0			<= 0;
			rvx_signal_5[2]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_14: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_05; 
			rvx_signal_0			<= 0;
			rvx_signal_5[3]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_05: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_15; 
			rvx_signal_0			<= 0;
			rvx_signal_5[4]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_15: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_11; 
			rvx_signal_0			<= 0;
			rvx_signal_5[5]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_11: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_04; 
			rvx_signal_0			<= 0;
			rvx_signal_5[6]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_04: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_00; 
			rvx_signal_0			<= 0;
			rvx_signal_5[7]	<= rvx_signal_4;
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	RVX_LPARA_00: begin
		if(rvx_signal_3==1) begin
			rvx_signal_7			<= RVX_LPARA_01; 
			rvx_signal_0			<= 0;
			rvx_signal_2 <= rvx_signal_4;			
		end
		else rvx_signal_0 <= rvx_signal_0 + 1;
	end
	endcase
end

initial
begin
	core_finish = 0;
	`ifdef RVX_LDEF_2
	result_file = $fopen("result.dat", "w");
	`endif
	while(1)
	begin
		wait(rvx_signal_7==RVX_LPARA_01);
		wait(rvx_signal_7==RVX_LPARA_00);
		wait(rvx_signal_3==1);
		if(rvx_signal_5==4)
		begin
			`ifdef RVX_LDEF_2
			$fclose(result_file);
			`endif
			core_finish = 1;			
		end
		else
		begin
			if($unsigned(rvx_signal_5)!=13)
			begin
				`ifdef RVX_LDEF_0
				$write("%c", rvx_signal_5);
				`endif
				`ifdef RVX_LDEF_2
				$fwrite(result_file, "%c", rvx_signal_5);
				`endif				
			end
		end
	end
end

assign uart_tx = 1;

`ifdef PRINTF_BOTH_OUT
	`undef RVX_LDEF_2
	`undef RVX_LDEF_0
`else
	`ifdef PRINTF_FILE_OUT_ONLY
		`undef RVX_LDEF_2
	`else
		`undef RVX_LDEF_0
	`endif
`endif

endmodule
