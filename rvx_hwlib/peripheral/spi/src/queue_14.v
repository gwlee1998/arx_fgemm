`default_nettype wire
module frvp_spi_Queue_14(   input        clock,   input        reset,   output       io_enq_ready,   input        io_enq_valid,   input  [7:0] io_enq_bits,   input        io_deq_ready,   output       io_deq_valid,   output [7:0] io_deq_bits,   output [3:0] io_count );
reg [7:0] _T_35 [0:7];   reg [31:0] _RAND_0;
wire [7:0] _T_35__T_58_data;   wire [2:0] _T_35__T_58_addr;   wire [7:0] _T_35__T_50_data;   wire [2:0] _T_35__T_50_addr;   wire  _T_35__T_50_mask;   wire  _T_35__T_50_en;   reg [2:0] value;   reg [31:0] _RAND_1;
reg [2:0] value_1;   reg [31:0] _RAND_2;
reg  _T_39;   reg [31:0] _RAND_3;
wire  _T_40;   wire  _T_41;   wire  _T_42;   wire  _T_43;   wire  _T_44;   wire  _T_47;   wire [2:0] _T_52;   wire [2:0] _T_54;   wire  _T_55;   wire [3:0] _T_59;   wire [3:0] _T_60;   wire [2:0] _T_61;   wire  _T_62;   assign _T_35__T_58_addr = value_1;
assign _T_35__T_58_data = _T_35[_T_35__T_58_addr];   assign _T_35__T_50_data = io_enq_bits;
assign _T_35__T_50_addr = value;
assign _T_35__T_50_mask = 1'h1;
assign _T_35__T_50_en = io_enq_ready & io_enq_valid;
assign _T_40 = value == value_1;   assign _T_41 = _T_39 == 1'h0;   assign _T_42 = _T_40 & _T_41;   assign _T_43 = _T_40 & _T_39;   assign _T_44 = io_enq_ready & io_enq_valid;   assign _T_47 = io_deq_ready & io_deq_valid;   assign _T_52 = value + 3'h1;   assign _T_54 = value_1 + 3'h1;   assign _T_55 = _T_44 != _T_47;   assign _T_59 = value - value_1;   assign _T_60 = $unsigned(_T_59);   assign _T_61 = _T_60[2:0];   assign _T_62 = _T_39 & _T_40;   assign io_enq_ready = _T_43 == 1'h0;   assign io_deq_valid = _T_42 == 1'h0;   assign io_deq_bits = _T_35__T_58_data;   assign io_count = {_T_62,_T_61};

always @(posedge clock)
begin
	if(_T_35__T_50_en & _T_35__T_50_mask)
		_T_35[_T_35__T_50_addr] <= _T_35__T_50_data;
end

always@(posedge clock, posedge reset)
begin
  if (reset) begin
    value <= 3'h0;
  end else begin
    if (_T_44) begin
      value <= _T_52;
    end
  end
end

always@(posedge clock, posedge reset)
begin
  if (reset) begin
    value_1 <= 3'h0;
  end else begin
    if (_T_47) begin
      value_1 <= _T_54;
    end
  end
end

always@(posedge clock, posedge reset)
begin
  if (reset) begin
    _T_39 <= 1'h0;
  end else begin
    if (_T_55) begin
      _T_39 <= _T_44;
    end
  end
end

endmodule
