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



module ERVP_DMA
(
	clk_axi,
	rstnn_axi,
  clk_apb,
	rstnn_apb,
	tick_1us,
	
	control_rpaddr,
	control_rpwrite,
	control_rpsel,
	control_rpenable,
	control_rpwdata,
	control_rprdata,
	control_rpready,
	control_rpslverr,
	
	sxawid,
	sxawaddr,
	sxawlen,
	sxawsize,
	sxawburst,
	sxawvalid,
	sxawready,
	
	sxwid,
	sxwdata,
	sxwstrb,
	sxwlast,
	sxwvalid,
	sxwready,
	
	sxbid,
	sxbresp,
	sxbvalid,
	sxbready,
	
	sxarid,
	sxaraddr,
	sxarlen,
	sxarsize,
	sxarburst,
	sxarvalid,
	sxarready,
	
	sxrid,
	sxrdata,
	sxrresp,
	sxrlast,
	sxrvalid,
	sxrready
);



parameter BW_ADDR = 32;
parameter BW_APB_DATA = 32;
parameter BW_AXI_DATA = 32;
parameter BW_AXI_TID = 4;
parameter NUM_TXN_BUFFER = 4;

`include "rvx_include_05.vh"

localparam  RVX_LPARA_2 = (MAX_AXI_LENGTH+1)*NUM_TXN_BUFFER;

input wire clk_axi;
input wire rstnn_axi;
input wire clk_apb;
input wire rstnn_apb;
input wire tick_1us;

input wire [BW_ADDR-1:0] control_rpaddr;
input wire control_rpwrite;
input wire control_rpsel;
input wire control_rpenable;
input wire [BW_APB_DATA-1:0] control_rpwdata;
output wire [BW_APB_DATA-1:0] control_rprdata;
output wire control_rpready;
output wire control_rpslverr;

output wire [BW_AXI_TID-1:0] sxawid;
output wire [BW_ADDR-1:0] sxawaddr;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire sxawvalid;
input wire sxawready;

output wire [BW_AXI_TID-1:0] sxwid;
output wire [BW_AXI_DATA-1:0] sxwdata;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] sxwstrb;
output wire sxwlast;
output wire sxwvalid;
input wire sxwready;

input wire [BW_AXI_TID-1:0] sxbid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire sxbvalid;
output wire sxbready;

output wire [BW_AXI_TID-1:0] sxarid;
output wire [BW_ADDR-1:0] sxaraddr;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire sxarvalid;
input wire sxarready;

input wire [BW_AXI_TID-1:0] sxrid;
input wire [BW_AXI_DATA-1:0] sxrdata;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire sxrlast;
input wire sxrvalid;
output wire sxrready;

wire rvx_signal_84;
wire [3-1:0] rvx_signal_26;
wire rvx_signal_88;
wire [32-1:0] rvx_signal_85;

wire rvx_signal_65;
wire rvx_signal_57;
wire [32-1:0] rvx_signal_87;
wire rvx_signal_28;
wire rvx_signal_09;
wire [32-1:0] rvx_signal_10;
wire rvx_signal_14;
wire [32-1:0] rvx_signal_54;

wire rvx_signal_81;
wire rvx_signal_41;
wire [32-1:0] rvx_signal_59;
wire rvx_signal_58;
wire rvx_signal_86;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_35;
wire [32-1:0] rvx_signal_52;

wire rvx_signal_13;
wire rvx_signal_64;
wire [32-1:0] rvx_signal_47;
wire rvx_signal_48;
wire rvx_signal_67;
wire [32-1:0] rvx_signal_69;
wire rvx_signal_43;
wire [32-1:0] rvx_signal_72;

wire rvx_signal_18;
wire rvx_signal_62;
wire [32-1:0] rvx_signal_19;
wire rvx_signal_42;
wire rvx_signal_16;
wire [32-1:0] rvx_signal_01;
wire rvx_signal_60;
wire [32-1:0] rvx_signal_80;

wire rvx_signal_27;
wire rvx_signal_38;
wire [32-1:0] rvx_signal_73;
wire rvx_signal_40;
wire rvx_signal_74;
wire [32-1:0] rvx_signal_31;
wire rvx_signal_04;
wire [32-1:0] rvx_signal_79;

wire [BW_LINE_SIZE-1:0] rvx_signal_44;
wire [BW_NUM_LINES-1:0] rvx_signal_68;
wire [`RVX_GDEF_268-1:0] rvx_signal_07;
wire rvx_signal_24;

reg [`RVX_GDEF_087-1:0] rvx_signal_08;
reg rvx_signal_39;
reg rvx_signal_29;

wire rvx_signal_53;
wire rvx_signal_02;
wire rvx_signal_33;

localparam  RVX_LPARA_0 = `RVX_GDEF_268;
localparam  RVX_LPARA_1 = 2;

wire rvx_signal_51;
wire rvx_signal_75;
wire [RVX_LPARA_0-1:0] rvx_signal_03;
wire rvx_signal_34;
wire [RVX_LPARA_1-1:0] rvx_signal_82;
wire rvx_signal_32;

reg [`RVX_GDEF_328-1:0] rvx_signal_11;
wire rvx_signal_21;
wire rvx_signal_50;
wire rvx_signal_36;

wire rvx_signal_23;
wire rvx_signal_20;
wire rvx_signal_30;
wire rvx_signal_49;

wire rvx_signal_83;
wire rvx_signal_46;
wire rvx_signal_61;
wire rvx_signal_66;

wire rvx_signal_12;
wire rvx_signal_71;
wire rvx_signal_06;
wire rvx_signal_78;

wire rvx_signal_55;
wire rvx_signal_76;
wire rvx_signal_17;
wire rvx_signal_22;
wire rvx_signal_37;

wire rvx_signal_25;
wire [BW_DATA_BUFFER-1:0] rvx_signal_45;
wire rvx_signal_70;
wire rvx_signal_63;
wire [BW_DATA_BUFFER-1:0] rvx_signal_56;
wire rvx_signal_77;

wire rvx_signal_00;
wire rvx_signal_15;

RVX_MODULE_083
#(
  .RVX_GPARA_0(BW_ADDR),
  .RVX_GPARA_1(BW_APB_DATA)
)
i_rvx_instance_3
(
	.rvx_port_21(clk_apb),
	.rvx_port_17(rstnn_apb),

	.rvx_port_27(control_rpsel),
	.rvx_port_05(control_rpenable),
	.rvx_port_43(control_rpaddr),
	.rvx_port_36(control_rpwrite),
	.rvx_port_41(control_rpwdata),
	.rvx_port_04(control_rprdata),
	.rvx_port_53(control_rpready),
	.rvx_port_35(control_rpslverr),

	.rvx_port_18(1'b 0),
	.rvx_port_06(rvx_signal_84),
	.rvx_port_40(rvx_signal_26),
	.rvx_port_25(rvx_signal_88),
	.rvx_port_02(rvx_signal_85),
	.rvx_port_09(rvx_signal_28),
	.rvx_port_50(rvx_signal_09),
	.rvx_port_46(rvx_signal_10),
	.rvx_port_13(rvx_signal_14),
	.rvx_port_14(rvx_signal_54),
	.rvx_port_08(rvx_signal_65),
	.rvx_port_30(rvx_signal_57),
	.rvx_port_16(rvx_signal_87),
	.rvx_port_07(rvx_signal_58),
	.rvx_port_26(rvx_signal_86),
	.rvx_port_54(rvx_signal_05),
	.rvx_port_33(rvx_signal_35),
	.rvx_port_42(rvx_signal_52),
	.rvx_port_39(rvx_signal_81),
	.rvx_port_00(rvx_signal_41),
	.rvx_port_11(rvx_signal_59),
	.rvx_port_47(rvx_signal_48),
	.rvx_port_34(rvx_signal_67),
	.rvx_port_48(rvx_signal_69),
	.rvx_port_51(rvx_signal_43),
	.rvx_port_23(rvx_signal_72),
	.rvx_port_44(rvx_signal_13),
	.rvx_port_49(rvx_signal_64),
	.rvx_port_29(rvx_signal_47),
	.rvx_port_15(rvx_signal_42),
	.rvx_port_10(rvx_signal_16),
	.rvx_port_37(rvx_signal_01),
	.rvx_port_03(rvx_signal_60),
	.rvx_port_12(rvx_signal_80),
	.rvx_port_45(rvx_signal_18),
	.rvx_port_28(rvx_signal_62),
	.rvx_port_19(rvx_signal_19),
	.rvx_port_01(rvx_signal_40),
	.rvx_port_20(rvx_signal_74),
	.rvx_port_31(rvx_signal_31),
	.rvx_port_38(rvx_signal_04),
	.rvx_port_24(rvx_signal_79),
	.rvx_port_22(rvx_signal_27),
	.rvx_port_32(rvx_signal_38),
	.rvx_port_52(rvx_signal_73)
);

assign rvx_signal_26 = rvx_signal_08;
assign {rvx_signal_44,rvx_signal_68} = rvx_signal_79;
assign {rvx_signal_07,rvx_signal_24} = rvx_signal_85;

assign rvx_signal_14 = rvx_signal_29;
assign rvx_signal_35 = rvx_signal_29;
assign rvx_signal_43 = rvx_signal_29;
assign rvx_signal_60 = rvx_signal_29;
assign rvx_signal_04 = rvx_signal_29;

ERVP_ASYNCH_CONTROL_SIGNAL
i_rvx_instance_5
(
	.wclk(clk_apb),
	.wrstnn(rstnn_apb),
	.wcontrol(rvx_signal_53),
	.wready(rvx_signal_02),

	.rclk(clk_axi),
	.rrstnn(rstnn_axi),
	.rcontrol(rvx_signal_21),
	.rready(rvx_signal_50)
);

always@(posedge clk_apb, negedge rstnn_apb)
begin
	if(rstnn_apb == 0)
  begin
		rvx_signal_08 <= `RVX_GDEF_381;
    rvx_signal_39 <= 0;
  end
  else
		case(rvx_signal_08)
      `RVX_GDEF_381:
        if(rvx_signal_88)
          rvx_signal_08 <= `RVX_GDEF_160;
      `RVX_GDEF_160:
      begin
        if(rvx_signal_42)
          rvx_signal_08 <= `RVX_GDEF_113;
        else
          rvx_signal_08 <= `RVX_GDEF_381;
        rvx_signal_39 <= rvx_signal_24;
      end
      `RVX_GDEF_113:
				if(rvx_signal_02)
					rvx_signal_08 <= `RVX_GDEF_340;
			`RVX_GDEF_340:
				if(~rvx_signal_33)
        begin
          if(rvx_signal_24)
            rvx_signal_08 <= `RVX_GDEF_122;
          else
            rvx_signal_08 <= `RVX_GDEF_160;
        end
      `RVX_GDEF_122:
        if(~rvx_signal_24)
          rvx_signal_08 <= `RVX_GDEF_160;
        else if(rvx_signal_32)
          rvx_signal_08 <= `RVX_GDEF_160;
		endcase
end

always@(*)
begin
  rvx_signal_29 = 0;
  case(rvx_signal_08)
    `RVX_GDEF_340,
    `RVX_GDEF_122:
      if((~rvx_signal_33) && (~rvx_signal_24))
        rvx_signal_29 = 1;
  endcase
end
assign rvx_signal_53 = (rvx_signal_08==`RVX_GDEF_160) & rvx_signal_42;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_7
(
	.clk(clk_apb),
	.rstnn(rstnn_apb),
	.enable(1'b 1),
	.asynch_value(rvx_signal_36),
	.synch_value(rvx_signal_33)
);

ERVP_RECONFIGURABLE_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_0),
  .BW_COUNT_AMOUNT(RVX_LPARA_1),
  .LAST_NUMBER(1)
)
i_rvx_instance_0
(
	.clk(clk_apb),
  .rstnn(rstnn_apb),
	.enable(rvx_signal_51),

  .init(1'b 0),
	.write(rvx_signal_75),
	.wvalue(rvx_signal_03),
	.count(rvx_signal_34),
	.count_amount(rvx_signal_82),
	.value(),
	.is_first_count(),
	.is_last_count(rvx_signal_32)
);

assign rvx_signal_51 = (rvx_signal_08!=`RVX_GDEF_381);
assign rvx_signal_75 = rvx_signal_24 & rvx_signal_53;
assign rvx_signal_03 = rvx_signal_07;
assign rvx_signal_34 = rvx_signal_39 & tick_1us;
assign rvx_signal_82 = -1;

always@(posedge clk_axi, negedge rstnn_axi)
begin
	if(rstnn_axi == 0)
		rvx_signal_11 <= `RVX_GDEF_017;
	else
		case(rvx_signal_11)
			`RVX_GDEF_017:
        if(rvx_signal_21)
          rvx_signal_11 <= `RVX_GDEF_329;
			`RVX_GDEF_329:
				if(rvx_signal_55)
					rvx_signal_11 <= `RVX_GDEF_053;
			`RVX_GDEF_053:
				if(rvx_signal_76)
					rvx_signal_11 <= `RVX_GDEF_331;
			`RVX_GDEF_331:
				if(rvx_signal_17)
          rvx_signal_11 <= `RVX_GDEF_017;
		endcase
end

assign rvx_signal_50 = (rvx_signal_11==`RVX_GDEF_017) & rvx_signal_21;
assign rvx_signal_36 = (rvx_signal_11!=`RVX_GDEF_017);

assign rvx_signal_37 = (rvx_signal_11 == `RVX_GDEF_329);
assign rvx_signal_22 = (rvx_signal_11 == `RVX_GDEF_329) | (rvx_signal_11 == `RVX_GDEF_053);

assign rvx_signal_23 = sxarready & sxarvalid;
assign rvx_signal_20 = sxrlast & sxrvalid & sxrready;
assign rvx_signal_30 = sxawready & sxawvalid;
assign rvx_signal_49 = sxwlast & sxwvalid & sxwready;

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(NUM_TXN_BUFFER)
)
i_rvx_instance_2
(
	.clk(clk_axi),
  .rstnn(rstnn_axi),
	.enable(rvx_signal_83),
	.init(1'b 0),
  .up(rvx_signal_46),
  .down(rvx_signal_61),
	.value(),
  .is_first_count(),
	.is_last_count(rvx_signal_66)
);

assign rvx_signal_83 = rvx_signal_36;
assign rvx_signal_46 = rvx_signal_23;
assign rvx_signal_61 = rvx_signal_49;

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(NUM_TXN_BUFFER)
)
i_rvx_instance_4
(
	.clk(clk_axi),
  .rstnn(rstnn_axi),
	.enable(rvx_signal_12),
	.init(1'b 0),
  .up(rvx_signal_71),
  .down(rvx_signal_06),
	.value(),
  .is_first_count(rvx_signal_78),
	.is_last_count()
);

assign rvx_signal_12 = rvx_signal_36;
assign rvx_signal_71 = rvx_signal_20;
assign rvx_signal_06 = rvx_signal_30;

RVX_MODULE_076
#(
	.RVX_GPARA_0(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.RVX_GPARA_1(BW_AXI_TID),
	.MAX_AXI_LENGTH(MAX_AXI_LENGTH)
)
i_rvx_instance_1
(
	.rvx_port_22(clk_axi),
	.rvx_port_03(rstnn_axi),

	.rvx_port_20(rvx_signal_54),
	.rvx_port_24(rvx_signal_44),
	.rvx_port_07(rvx_signal_68),
	.rvx_port_05(rvx_signal_52),
	.rvx_port_09(rvx_signal_37),

	.rvx_port_08(rvx_signal_00),
	.rvx_port_10(rvx_signal_55),

	.rvx_port_00(rvx_signal_25),
	.rvx_port_04(rvx_signal_45),
	.rvx_port_13(rvx_signal_70),

	.rvx_port_14(sxarid),
	.rvx_port_01(sxaraddr),
	.rvx_port_11(sxarvalid),
	.rvx_port_19(sxarready),
	.rvx_port_23(sxarlen),
	.rvx_port_02(sxarburst),
	.rvx_port_21(sxarsize),
	
	.rvx_port_18(sxrid),
	.rvx_port_12(sxrdata),
	.rvx_port_06(sxrlast),
	.rvx_port_16(sxrvalid),
	.rvx_port_15(sxrready),
	.rvx_port_17(sxrresp)
);

assign rvx_signal_00 = rvx_signal_66;

RVX_MODULE_067
#(
  .RVX_GPARA_1(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.RVX_GPARA_0(BW_AXI_TID),
	.MAX_AXI_LENGTH(MAX_AXI_LENGTH)
)
i_rvx_instance_8
(
	.rvx_port_27(clk_axi),
	.rvx_port_06(tick_1us),
	.rvx_port_09(rstnn_axi),

	.rvx_port_21(rvx_signal_72),
	.rvx_port_16(rvx_signal_44),
	.rvx_port_02(rvx_signal_68),
	.rvx_port_25(rvx_signal_80),
	.rvx_port_29(rvx_signal_22),

	.rvx_port_28(rvx_signal_15),
	.rvx_port_30(rvx_signal_76),
	.rvx_port_01(rvx_signal_17),

	.rvx_port_22(rvx_signal_63),
	.rvx_port_14(rvx_signal_56),
	.rvx_port_11(rvx_signal_77),

	.rvx_port_15(sxawid),
	.rvx_port_03(sxawaddr),
	.rvx_port_04(sxawvalid),
	.rvx_port_24(sxawready),
	.rvx_port_13(sxawlen),
	.rvx_port_23(sxawburst),
	.rvx_port_18(sxawsize),
	
	.rvx_port_07(sxwid),
	.rvx_port_08(sxwdata),
	.rvx_port_00(sxwstrb),
	.rvx_port_10(sxwlast),
	.rvx_port_12(sxwvalid),
	.rvx_port_26(sxwready),

	.rvx_port_19(sxbid),
	.rvx_port_20(sxbresp),
	.rvx_port_17(sxbvalid),
	.rvx_port_05(sxbready)
);

assign rvx_signal_15 = rvx_signal_78;

ERVP_FIFO
#(
	.BW_DATA(BW_DATA_BUFFER),
	.DEPTH(RVX_LPARA_2)
 )
i_rvx_instance_6
(
	.clk(clk_axi),
	.rstnn(rstnn_axi),
	.enable(1'b 1),
  .clear(1'b 0),

	.wready(rvx_signal_70),
	.wrequest(rvx_signal_25),
	.wfull(),
	.wdata(rvx_signal_45),
	.wnum(),

	.rready(rvx_signal_63),
	.rrequest(rvx_signal_77),
	.rempty(),
	.rdata(rvx_signal_56),
	.rnum()
);

endmodule
