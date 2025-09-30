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


`include "i2c_master_defines.v"



module RVX_MODULE_034 (
    input             rvx_port_10,      
    input             rvx_port_01,   
    input             rvx_port_08,      

    input      [15:0] rvx_port_07,  

    input      [ 3:0] rvx_port_12,      
    output reg        rvx_port_14,  
    output reg        rvx_port_09,     
    output reg        rvx_port_02,       

    input             rvx_port_06,
    output reg        rvx_port_15,

    input             rvx_port_13,    
    output            rvx_port_03,    
    output reg        rvx_port_04,  
    input             rvx_port_00,    
    output            rvx_port_05,    
    output reg        rvx_port_11   
);



    
    
    

    reg [ 1:0] rvx_signal_17, rvx_signal_04;      
    reg [ 2:0] rvx_signal_18, rvx_signal_00;      
    reg        rvx_signal_15, rvx_signal_01;      
    reg        rvx_signal_11, rvx_signal_13;      
    reg        rvx_signal_10;        
    reg        rvx_signal_14;         
    reg        rvx_signal_12;          
    reg        rvx_signal_07;      
    reg [15:0] rvx_signal_02;             
    reg [13:0] rvx_signal_06;      

    
    reg [17:0] rvx_signal_08;

    
    
    

    
    
    always @(posedge rvx_port_10)
      rvx_signal_10 <= rvx_port_04;

    
    
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (!rvx_port_01) rvx_signal_07 <= 1'b0;
      else         rvx_signal_07 <= (rvx_port_04 & ~rvx_signal_10 & ~rvx_signal_15) | (rvx_signal_07 & ~rvx_signal_15);

    
    
    wire scl_sync   = rvx_signal_11 & ~rvx_signal_15 & rvx_port_04;

    
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (~rvx_port_01)
      begin
          rvx_signal_02    <= 16'h0;
          rvx_signal_12 <= 1'b1;
      end
      else if ( ~|rvx_signal_02 || !rvx_port_08 || scl_sync)
      begin
          rvx_signal_02    <= rvx_port_07;
          rvx_signal_12 <= 1'b1;
      end
      else if (rvx_signal_07)
      begin
          rvx_signal_02    <= rvx_signal_02;
          rvx_signal_12 <= 1'b0;    
      end
      else
      begin
          rvx_signal_02    <= rvx_signal_02 - 16'h1;
          rvx_signal_12 <= 1'b0;
      end

    

    
    
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (!rvx_port_01)
      begin
          rvx_signal_17 <= 2'b00;
          rvx_signal_04 <= 2'b00;
      end
      else
      begin
          rvx_signal_17 <= {rvx_signal_17[0],rvx_port_13};
          rvx_signal_04 <= {rvx_signal_04[0],rvx_port_00};
      end

    
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if      (!rvx_port_01     ) rvx_signal_06 <= 14'h0;
      else if (!rvx_port_08 ) rvx_signal_06 <= 14'h0;
      else if (~|rvx_signal_06) rvx_signal_06 <= rvx_port_07 >> 2; 
      else                   rvx_signal_06 <= rvx_signal_06 -1;

    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (!rvx_port_01)
      begin
          rvx_signal_18 <= 3'b111;
          rvx_signal_00 <= 3'b111;
      end
      else if (~|rvx_signal_06)
      begin
          rvx_signal_18 <= {rvx_signal_18[1:0],rvx_signal_17[1]};
          rvx_signal_00 <= {rvx_signal_00[1:0],rvx_signal_04[1]};
      end

    
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (~rvx_port_01)
      begin
          rvx_signal_15 <= 1'b1;
          rvx_signal_01 <= 1'b1;

          rvx_signal_11 <= 1'b1;
          rvx_signal_13 <= 1'b1;
      end
      else
      begin
          rvx_signal_15 <= &rvx_signal_18[2:1] | &rvx_signal_18[1:0] | (rvx_signal_18[2] & rvx_signal_18[0]);
          rvx_signal_01 <= &rvx_signal_00[2:1] | &rvx_signal_00[1:0] | (rvx_signal_00[2] & rvx_signal_00[0]);

          rvx_signal_11 <= rvx_signal_15;
          rvx_signal_13 <= rvx_signal_01;
      end

    
    
    reg rvx_signal_09;
    reg rvx_signal_16;
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (~rvx_port_01)
      begin
          rvx_signal_09 <= 1'b0;
          rvx_signal_16 <= 1'b0;
      end
      else
      begin
          rvx_signal_09 <= ~rvx_signal_01 &  rvx_signal_13 & rvx_signal_15;
          rvx_signal_16 <=  rvx_signal_01 & ~rvx_signal_13 & rvx_signal_15;
      end

    
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if      (!rvx_port_01) rvx_port_09 <= 1'b0;
      else              rvx_port_09 <= (rvx_signal_09 | rvx_port_09) & ~rvx_signal_16;

    
    
    
    
    reg rvx_signal_03;
    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (~rvx_port_01)
          rvx_signal_03 <= 1'b0;
      else if (rvx_signal_12)
          rvx_signal_03 <= rvx_port_12 == `I2C_CMD_STOP;

    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (~rvx_port_01)
          rvx_port_02 <= 1'b0;
      else
          rvx_port_02 <= (rvx_signal_14 & ~rvx_signal_01 & rvx_port_11) | (|rvx_signal_08 & rvx_signal_16 & ~rvx_signal_03);

    
    always @(posedge rvx_port_10)
      if (rvx_signal_15 & ~rvx_signal_11) rvx_port_15 <= rvx_signal_01;

    

    
    parameter [17:0] idle    = 18'b0_0000_0000_0000_0000;
    parameter [17:0] start_a = 18'b0_0000_0000_0000_0001;
    parameter [17:0] start_b = 18'b0_0000_0000_0000_0010;
    parameter [17:0] start_c = 18'b0_0000_0000_0000_0100;
    parameter [17:0] start_d = 18'b0_0000_0000_0000_1000;
    parameter [17:0] start_e = 18'b0_0000_0000_0001_0000;
    parameter [17:0] stop_a  = 18'b0_0000_0000_0010_0000;
    parameter [17:0] stop_b  = 18'b0_0000_0000_0100_0000;
    parameter [17:0] stop_c  = 18'b0_0000_0000_1000_0000;
    parameter [17:0] stop_d  = 18'b0_0000_0001_0000_0000;
    parameter [17:0] rd_a    = 18'b0_0000_0010_0000_0000;
    parameter [17:0] rd_b    = 18'b0_0000_0100_0000_0000;
    parameter [17:0] rd_c    = 18'b0_0000_1000_0000_0000;
    parameter [17:0] rd_d    = 18'b0_0001_0000_0000_0000;
    parameter [17:0] wr_a    = 18'b0_0010_0000_0000_0000;
    parameter [17:0] wr_b    = 18'b0_0100_0000_0000_0000;
    parameter [17:0] wr_c    = 18'b0_1000_0000_0000_0000;
    parameter [17:0] wr_d    = 18'b1_0000_0000_0000_0000;

    always @(posedge rvx_port_10 or negedge rvx_port_01)
      if (!rvx_port_01)
      begin
          rvx_signal_08 <= idle;
          rvx_port_14 <= 1'b0;
          rvx_port_04 <= 1'b1;
          rvx_port_11 <= 1'b1;
          rvx_signal_14 <= 1'b0;
      end
      else if ( rvx_port_02)
      begin
          rvx_signal_08 <= idle;
          rvx_port_14 <= 1'b0;
          rvx_port_04 <= 1'b1;
          rvx_port_11 <= 1'b1;
          rvx_signal_14 <= 1'b0;
      end
      else
      begin
          rvx_port_14   <= 1'b0; 

          if (rvx_signal_12)
              case (rvx_signal_08) 
                    
                    idle:
                    begin
                        case (rvx_port_12) 
                             `I2C_CMD_START: rvx_signal_08 <= start_a;
                             `I2C_CMD_STOP:  rvx_signal_08 <= stop_a;
                             `I2C_CMD_WRITE: rvx_signal_08 <= wr_a;
                             `I2C_CMD_READ:  rvx_signal_08 <= rd_a;
                             default:        rvx_signal_08 <= idle;
                        endcase

                        rvx_port_04 <= rvx_port_04; 
                        rvx_port_11 <= rvx_port_11; 
                        rvx_signal_14 <= 1'b0;    
                    end

                    
                    start_a:
                    begin
                        rvx_signal_08 <= start_b;
                        rvx_port_04 <= rvx_port_04; 
                        rvx_port_11 <= 1'b1;    
                        rvx_signal_14 <= 1'b0;    
                    end

                    start_b:
                    begin
                        rvx_signal_08 <= start_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b1; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    start_c:
                    begin
                        rvx_signal_08 <= start_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b0; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    start_d:
                    begin
                        rvx_signal_08 <= start_e;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b0; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    start_e:
                    begin
                        rvx_signal_08 <= idle;
                        rvx_port_14 <= 1'b1;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_11 <= 1'b0; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    
                    stop_a:
                    begin
                        rvx_signal_08 <= stop_b;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_11 <= 1'b0; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    stop_b:
                    begin
                        rvx_signal_08 <= stop_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b0; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    stop_c:
                    begin
                        rvx_signal_08 <= stop_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b0; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    stop_d:
                    begin
                        rvx_signal_08 <= idle;
                        rvx_port_14 <= 1'b1;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b1; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    
                    rd_a:
                    begin
                        rvx_signal_08 <= rd_b;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_11 <= 1'b1; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    rd_b:
                    begin
                        rvx_signal_08 <= rd_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b1; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    rd_c:
                    begin
                        rvx_signal_08 <= rd_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= 1'b1; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    rd_d:
                    begin
                        rvx_signal_08 <= idle;
                        rvx_port_14 <= 1'b1;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_11 <= 1'b1; 
                        rvx_signal_14 <= 1'b0; 
                    end

                    
                    wr_a:
                    begin
                        rvx_signal_08 <= wr_b;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_11 <= rvx_port_06;  
                        rvx_signal_14 <= 1'b0; 
                    end

                    wr_b:
                    begin
                        rvx_signal_08 <= wr_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= rvx_port_06;  
                        rvx_signal_14 <= 1'b0; 
                                            
                    end

                    wr_c:
                    begin
                        rvx_signal_08 <= wr_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_11 <= rvx_port_06;
                        rvx_signal_14 <= 1'b1; 
                    end

                    wr_d:
                    begin
                        rvx_signal_08 <= idle;
                        rvx_port_14 <= 1'b1;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_11 <= rvx_port_06;
                        rvx_signal_14 <= 1'b0; 
                    end

              endcase
      end

    
    assign rvx_port_03 = 1'b0;
    assign rvx_port_05 = 1'b0;

endmodule
