`default_nettype wire
`include "timescale.vh"
module TLXbar_6(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_4_a_ready,
  output        auto_out_4_a_valid,
  output [2:0]  auto_out_4_a_bits_opcode,
  output [2:0]  auto_out_4_a_bits_param,
  output [2:0]  auto_out_4_a_bits_size,
  output [4:0]  auto_out_4_a_bits_source,
  output [16:0] auto_out_4_a_bits_address,
  output [3:0]  auto_out_4_a_bits_mask,
  output        auto_out_4_a_bits_corrupt,
  output        auto_out_4_d_ready,
  input         auto_out_4_d_valid,
  input  [2:0]  auto_out_4_d_bits_size,
  input  [4:0]  auto_out_4_d_bits_source,
  input  [31:0] auto_out_4_d_bits_data,
  input         auto_out_3_a_ready,
  output        auto_out_3_a_valid,
  output [2:0]  auto_out_3_a_bits_opcode,
  output [2:0]  auto_out_3_a_bits_param,
  output [2:0]  auto_out_3_a_bits_size,
  output [4:0]  auto_out_3_a_bits_source,
  output [11:0] auto_out_3_a_bits_address,
  output [3:0]  auto_out_3_a_bits_mask,
  output [31:0] auto_out_3_a_bits_data,
  output        auto_out_3_a_bits_corrupt,
  output        auto_out_3_d_ready,
  input         auto_out_3_d_valid,
  input  [2:0]  auto_out_3_d_bits_opcode,
  input  [2:0]  auto_out_3_d_bits_size,
  input  [4:0]  auto_out_3_d_bits_source,
  input  [31:0] auto_out_3_d_bits_data,
  input         auto_out_2_a_ready,
  output        auto_out_2_a_valid,
  output [2:0]  auto_out_2_a_bits_opcode,
  output [2:0]  auto_out_2_a_bits_param,
  output [2:0]  auto_out_2_a_bits_size,
  output [4:0]  auto_out_2_a_bits_source,
  output [25:0] auto_out_2_a_bits_address,
  output [3:0]  auto_out_2_a_bits_mask,
  output [31:0] auto_out_2_a_bits_data,
  output        auto_out_2_a_bits_corrupt,
  output        auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
  input  [2:0]  auto_out_2_d_bits_size,
  input  [4:0]  auto_out_2_d_bits_source,
  input  [31:0] auto_out_2_d_bits_data,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [2:0]  auto_out_1_a_bits_param,
  output [2:0]  auto_out_1_a_bits_size,
  output [4:0]  auto_out_1_a_bits_source,
  output [27:0] auto_out_1_a_bits_address,
  output [3:0]  auto_out_1_a_bits_mask,
  output [31:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [2:0]  auto_out_1_d_bits_size,
  input  [4:0]  auto_out_1_d_bits_source,
  input  [31:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [2:0]  auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [4:0]  auto_out_0_a_bits_source,
  output [13:0] auto_out_0_a_bits_address,
  output [3:0]  auto_out_0_a_bits_mask,
  output        auto_out_0_a_bits_corrupt,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [4:0]  auto_out_0_d_bits_source,
  input         auto_out_0_d_bits_sink,
  input         auto_out_0_d_bits_denied,
  input  [31:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [4:0] monitor_io_in_a_bits_source;
  wire [27:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [4:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  reg [9:0] beatsLeft;
  wire  idle = beatsLeft == 10'h0;
  wire [4:0] readys_valid = {auto_out_4_d_valid,auto_out_3_d_valid,auto_out_2_d_valid,auto_out_1_d_valid,
    auto_out_0_d_valid};
  reg [4:0] readys_mask;
  wire [4:0] _readys_filter_T = ~readys_mask;
  wire [4:0] _readys_filter_T_1 = readys_valid & _readys_filter_T;
  wire [9:0] readys_filter = {_readys_filter_T_1,auto_out_4_d_valid,auto_out_3_d_valid,auto_out_2_d_valid,
    auto_out_1_d_valid,auto_out_0_d_valid};
  wire [9:0] _GEN_1 = {{1'd0}, readys_filter[9:1]};
  wire [9:0] _readys_unready_T_1 = readys_filter | _GEN_1;
  wire [9:0] _GEN_2 = {{2'd0}, _readys_unready_T_1[9:2]};
  wire [9:0] _readys_unready_T_3 = _readys_unready_T_1 | _GEN_2;
  wire [9:0] _GEN_3 = {{4'd0}, _readys_unready_T_3[9:4]};
  wire [9:0] _readys_unready_T_5 = _readys_unready_T_3 | _GEN_3;
  wire [9:0] _readys_unready_T_8 = {readys_mask, 5'h0};
  wire [9:0] _GEN_4 = {{1'd0}, _readys_unready_T_5[9:1]};
  wire [9:0] readys_unready = _GEN_4 | _readys_unready_T_8;
  wire [4:0] _readys_readys_T_2 = readys_unready[9:5] & readys_unready[4:0];
  wire [4:0] readys_readys = ~_readys_readys_T_2;
  wire  readys_0 = readys_readys[0];
  wire  earlyWinner_0 = readys_0 & auto_out_0_d_valid;
  reg  state_0;
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0;
  wire [4:0] _T_84 = muxStateEarly_0 ? auto_out_0_d_bits_source : 5'h0;
  wire  readys_1 = readys_readys[1];
  wire  earlyWinner_1 = readys_1 & auto_out_1_d_valid;
  reg  state_1;
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1;
  wire [4:0] _T_85 = muxStateEarly_1 ? auto_out_1_d_bits_source : 5'h0;
  wire [4:0] _T_89 = _T_84 | _T_85;
  wire  readys_2 = readys_readys[2];
  wire  earlyWinner_2 = readys_2 & auto_out_2_d_valid;
  reg  state_2;
  wire  muxStateEarly_2 = idle ? earlyWinner_2 : state_2;
  wire [4:0] _T_86 = muxStateEarly_2 ? auto_out_2_d_bits_source : 5'h0;
  wire [4:0] _T_90 = _T_89 | _T_86;
  wire  readys_3 = readys_readys[3];
  wire  earlyWinner_3 = readys_3 & auto_out_3_d_valid;
  reg  state_3;
  wire  muxStateEarly_3 = idle ? earlyWinner_3 : state_3;
  wire [4:0] _T_87 = muxStateEarly_3 ? auto_out_3_d_bits_source : 5'h0;
  wire [4:0] _T_91 = _T_90 | _T_87;
  wire  readys_4 = readys_readys[4];
  wire  earlyWinner_4 = readys_4 & auto_out_4_d_valid;
  reg  state_4;
  wire  muxStateEarly_4 = idle ? earlyWinner_4 : state_4;
  wire [4:0] _T_88 = muxStateEarly_4 ? auto_out_4_d_bits_source : 5'h0;
  wire [27:0] _requestAIO_T = auto_in_a_bits_address ^ 28'h2000;
  wire [28:0] _requestAIO_T_1 = {1'b0,$signed(_requestAIO_T)};
  wire [28:0] _requestAIO_T_3 = $signed(_requestAIO_T_1) & 29'sha012000;
  wire  requestAIO_0_0 = $signed(_requestAIO_T_3) == 29'sh0;
  wire [27:0] _requestAIO_T_5 = auto_in_a_bits_address ^ 28'h8000000;
  wire [28:0] _requestAIO_T_6 = {1'b0,$signed(_requestAIO_T_5)};
  wire [28:0] _requestAIO_T_8 = $signed(_requestAIO_T_6) & 29'sh8000000;
  wire  requestAIO_0_1 = $signed(_requestAIO_T_8) == 29'sh0;
  wire [27:0] _requestAIO_T_10 = auto_in_a_bits_address ^ 28'h2000000;
  wire [28:0] _requestAIO_T_11 = {1'b0,$signed(_requestAIO_T_10)};
  wire [28:0] _requestAIO_T_13 = $signed(_requestAIO_T_11) & 29'sha010000;
  wire  requestAIO_0_2 = $signed(_requestAIO_T_13) == 29'sh0;
  wire [28:0] _requestAIO_T_16 = {1'b0,$signed(auto_in_a_bits_address)};
  wire [28:0] _requestAIO_T_18 = $signed(_requestAIO_T_16) & 29'sha012000;
  wire  requestAIO_0_3 = $signed(_requestAIO_T_18) == 29'sh0;
  wire [27:0] _requestAIO_T_20 = auto_in_a_bits_address ^ 28'h10000;
  wire [28:0] _requestAIO_T_21 = {1'b0,$signed(_requestAIO_T_20)};
  wire [28:0] _requestAIO_T_23 = $signed(_requestAIO_T_21) & 29'sha010000;
  wire  requestAIO_0_4 = $signed(_requestAIO_T_23) == 29'sh0;
  wire [26:0] _beatsDO_decode_T_1 = 27'hfff << auto_out_0_d_bits_size;
  wire [11:0] _beatsDO_decode_T_3 = ~_beatsDO_decode_T_1[11:0];
  wire [9:0] beatsDO_decode = _beatsDO_decode_T_3[11:2];
  wire  beatsDO_opdata = auto_out_0_d_bits_opcode[0];
  wire [9:0] beatsDO_0 = beatsDO_opdata ? beatsDO_decode : 10'h0;
  wire [3:0] out_1_1_d_bits_size = {{1'd0}, auto_out_1_d_bits_size};
  wire [20:0] _beatsDO_decode_T_5 = 21'h3f << out_1_1_d_bits_size;
  wire [5:0] _beatsDO_decode_T_7 = ~_beatsDO_decode_T_5[5:0];
  wire [3:0] beatsDO_decode_1 = _beatsDO_decode_T_7[5:2];
  wire  beatsDO_opdata_1 = auto_out_1_d_bits_opcode[0];
  wire [3:0] beatsDO_1 = beatsDO_opdata_1 ? beatsDO_decode_1 : 4'h0;
  wire [3:0] out_1_2_d_bits_size = {{1'd0}, auto_out_2_d_bits_size};
  wire [20:0] _beatsDO_decode_T_9 = 21'h3f << out_1_2_d_bits_size;
  wire [5:0] _beatsDO_decode_T_11 = ~_beatsDO_decode_T_9[5:0];
  wire [3:0] beatsDO_decode_2 = _beatsDO_decode_T_11[5:2];
  wire  beatsDO_opdata_2 = auto_out_2_d_bits_opcode[0];
  wire [3:0] beatsDO_2 = beatsDO_opdata_2 ? beatsDO_decode_2 : 4'h0;
  wire [3:0] out_1_3_d_bits_size = {{1'd0}, auto_out_3_d_bits_size};
  wire [20:0] _beatsDO_decode_T_13 = 21'h3f << out_1_3_d_bits_size;
  wire [5:0] _beatsDO_decode_T_15 = ~_beatsDO_decode_T_13[5:0];
  wire [3:0] beatsDO_decode_3 = _beatsDO_decode_T_15[5:2];
  wire  beatsDO_opdata_3 = auto_out_3_d_bits_opcode[0];
  wire [3:0] beatsDO_3 = beatsDO_opdata_3 ? beatsDO_decode_3 : 4'h0;
  wire [3:0] out_1_4_d_bits_size = {{1'd0}, auto_out_4_d_bits_size};
  wire [20:0] _beatsDO_decode_T_17 = 21'h3f << out_1_4_d_bits_size;
  wire [5:0] _beatsDO_decode_T_19 = ~_beatsDO_decode_T_17[5:0];
  wire [3:0] beatsDO_decode_4 = _beatsDO_decode_T_19[5:2];
  wire  latch = idle & auto_in_d_ready;
  wire  _readys_T_3 = ~reset;
  wire [4:0] _readys_mask_T = readys_readys & readys_valid;
  wire [5:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0};
  wire [4:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[4:0];
  wire [6:0] _readys_mask_T_4 = {_readys_mask_T_3, 2'h0};
  wire [4:0] _readys_mask_T_6 = _readys_mask_T_3 | _readys_mask_T_4[4:0];
  wire [8:0] _readys_mask_T_7 = {_readys_mask_T_6, 4'h0};
  wire [4:0] _readys_mask_T_9 = _readys_mask_T_6 | _readys_mask_T_7[4:0];
  wire  prefixOR_2 = earlyWinner_0 | earlyWinner_1;
  wire  prefixOR_3 = prefixOR_2 | earlyWinner_2;
  wire  prefixOR_4 = prefixOR_3 | earlyWinner_3;
  wire  _prefixOR_T = prefixOR_4 | earlyWinner_4;
  wire  _T_25 = auto_out_0_d_valid | auto_out_1_d_valid | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid;
  wire  _T_26 = ~(auto_out_0_d_valid | auto_out_1_d_valid | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid
    );
  wire [9:0] maskedBeats_0 = earlyWinner_0 ? beatsDO_0 : 10'h0;
  wire [3:0] maskedBeats_1 = earlyWinner_1 ? beatsDO_1 : 4'h0;
  wire [3:0] maskedBeats_2 = earlyWinner_2 ? beatsDO_2 : 4'h0;
  wire [3:0] maskedBeats_3 = earlyWinner_3 ? beatsDO_3 : 4'h0;
  wire [3:0] maskedBeats_4 = earlyWinner_4 ? beatsDO_decode_4 : 4'h0;
  wire [9:0] _GEN_5 = {{6'd0}, maskedBeats_1};
  wire [9:0] _initBeats_T = maskedBeats_0 | _GEN_5;
  wire [9:0] _GEN_6 = {{6'd0}, maskedBeats_2};
  wire [9:0] _initBeats_T_1 = _initBeats_T | _GEN_6;
  wire [9:0] _GEN_7 = {{6'd0}, maskedBeats_3};
  wire [9:0] _initBeats_T_2 = _initBeats_T_1 | _GEN_7;
  wire [9:0] _GEN_8 = {{6'd0}, maskedBeats_4};
  wire [9:0] initBeats = _initBeats_T_2 | _GEN_8;
  wire  _sink_ACancel_earlyValid_T_12 = state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid | state_2 &
    auto_out_2_d_valid | state_3 & auto_out_3_d_valid | state_4 & auto_out_4_d_valid;
  wire  sink_ACancel_11_earlyValid = idle ? _T_25 : _sink_ACancel_earlyValid_T_12;
  wire  _beatsLeft_T_2 = auto_in_d_ready & sink_ACancel_11_earlyValid;
  wire [9:0] _GEN_9 = {{9'd0}, _beatsLeft_T_2};
  wire [9:0] _beatsLeft_T_4 = beatsLeft - _GEN_9;
  wire  allowed_0 = idle ? readys_0 : state_0;
  wire  allowed_1 = idle ? readys_1 : state_1;
  wire  allowed_2 = idle ? readys_2 : state_2;
  wire  allowed_3 = idle ? readys_3 : state_3;
  wire  allowed_4 = idle ? readys_4 : state_4;
  wire [31:0] _T_57 = muxStateEarly_0 ? auto_out_0_d_bits_data : 32'h0;
  wire [31:0] _T_58 = muxStateEarly_1 ? auto_out_1_d_bits_data : 32'h0;
  wire [31:0] _T_59 = muxStateEarly_2 ? auto_out_2_d_bits_data : 32'h0;
  wire [31:0] _T_60 = muxStateEarly_3 ? auto_out_3_d_bits_data : 32'h0;
  wire [31:0] _T_61 = muxStateEarly_4 ? auto_out_4_d_bits_data : 32'h0;
  wire [31:0] _T_62 = _T_57 | _T_58;
  wire [31:0] _T_63 = _T_62 | _T_59;
  wire [31:0] _T_64 = _T_63 | _T_60;
  wire [3:0] _T_93 = muxStateEarly_0 ? auto_out_0_d_bits_size : 4'h0;
  wire [3:0] _T_94 = muxStateEarly_1 ? out_1_1_d_bits_size : 4'h0;
  wire [3:0] _T_95 = muxStateEarly_2 ? out_1_2_d_bits_size : 4'h0;
  wire [3:0] _T_96 = muxStateEarly_3 ? out_1_3_d_bits_size : 4'h0;
  wire [3:0] _T_97 = muxStateEarly_4 ? out_1_4_d_bits_size : 4'h0;
  wire [3:0] _T_98 = _T_93 | _T_94;
  wire [3:0] _T_99 = _T_98 | _T_95;
  wire [3:0] _T_100 = _T_99 | _T_96;
  wire [2:0] _T_111 = muxStateEarly_0 ? auto_out_0_d_bits_opcode : 3'h0;
  wire [2:0] _T_112 = muxStateEarly_1 ? auto_out_1_d_bits_opcode : 3'h0;
  wire [2:0] _T_113 = muxStateEarly_2 ? auto_out_2_d_bits_opcode : 3'h0;
  wire [2:0] _T_114 = muxStateEarly_3 ? auto_out_3_d_bits_opcode : 3'h0;
  wire [2:0] _T_115 = muxStateEarly_4 ? 3'h1 : 3'h0;
  wire [2:0] _T_116 = _T_111 | _T_112;
  wire [2:0] _T_117 = _T_116 | _T_113;
  wire [2:0] _T_118 = _T_117 | _T_114;
  
  assign auto_in_a_ready = requestAIO_0_0 & auto_out_0_a_ready | requestAIO_0_1 & auto_out_1_a_ready | requestAIO_0_2 &
    auto_out_2_a_ready | requestAIO_0_3 & auto_out_3_a_ready | requestAIO_0_4 & auto_out_4_a_ready;
  assign auto_in_d_valid = idle ? _T_25 : _sink_ACancel_earlyValid_T_12;
  assign auto_in_d_bits_opcode = _T_118 | _T_115;
  assign auto_in_d_bits_param = muxStateEarly_0 ? auto_out_0_d_bits_param : 2'h0;
  assign auto_in_d_bits_size = _T_100 | _T_97;
  assign auto_in_d_bits_source = _T_91 | _T_88;
  assign auto_in_d_bits_sink = muxStateEarly_0 & auto_out_0_d_bits_sink;
  assign auto_in_d_bits_denied = muxStateEarly_0 & auto_out_0_d_bits_denied;
  assign auto_in_d_bits_data = _T_64 | _T_61;
  assign auto_in_d_bits_corrupt = muxStateEarly_0 & auto_out_0_d_bits_corrupt;
  assign auto_out_4_a_valid = auto_in_a_valid & requestAIO_0_4;
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_4_a_bits_param = auto_in_a_bits_param;
  assign auto_out_4_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_4_a_bits_source = auto_in_a_bits_source;
  assign auto_out_4_a_bits_address = auto_in_a_bits_address[16:0];
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_4_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_4_d_ready = auto_in_d_ready & allowed_4;
  assign auto_out_3_a_valid = auto_in_a_valid & requestAIO_0_3;
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_3_a_bits_param = auto_in_a_bits_param;
  assign auto_out_3_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_3_a_bits_source = auto_in_a_bits_source;
  assign auto_out_3_a_bits_address = auto_in_a_bits_address[11:0];
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_3_a_bits_data = auto_in_a_bits_data;
  assign auto_out_3_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_3_d_ready = auto_in_d_ready & allowed_3;
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2;
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_2_a_bits_param = auto_in_a_bits_param;
  assign auto_out_2_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_2_a_bits_source = auto_in_a_bits_source;
  assign auto_out_2_a_bits_address = auto_in_a_bits_address[25:0];
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_2_a_bits_data = auto_in_a_bits_data;
  assign auto_out_2_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_2_d_ready = auto_in_d_ready & allowed_2;
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_param = auto_in_a_bits_param;
  assign auto_out_1_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_1_a_bits_source = auto_in_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_1_d_ready = auto_in_d_ready & allowed_1;
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_param = auto_in_a_bits_param;
  assign auto_out_0_a_bits_size = auto_in_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address[13:0];
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_0_d_ready = auto_in_d_ready & allowed_0;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = requestAIO_0_0 & auto_out_0_a_ready | requestAIO_0_1 & auto_out_1_a_ready |
    requestAIO_0_2 & auto_out_2_a_ready | requestAIO_0_3 & auto_out_3_a_ready | requestAIO_0_4 & auto_out_4_a_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = idle ? _T_25 : _sink_ACancel_earlyValid_T_12;
  assign monitor_io_in_d_bits_opcode = _T_118 | _T_115;
  assign monitor_io_in_d_bits_param = muxStateEarly_0 ? auto_out_0_d_bits_param : 2'h0;
  assign monitor_io_in_d_bits_size = _T_100 | _T_97;
  assign monitor_io_in_d_bits_source = _T_91 | _T_88;
  assign monitor_io_in_d_bits_sink = muxStateEarly_0 & auto_out_0_d_bits_sink;
  assign monitor_io_in_d_bits_denied = muxStateEarly_0 & auto_out_0_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_0 & auto_out_0_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 10'h0;
    end else if (latch) begin
      beatsLeft <= initBeats;
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      readys_mask <= 5'h1f;
    end else if (latch & |readys_valid) begin
      readys_mask <= _readys_mask_T_9;
    end
    if (reset) begin
      state_0 <= 1'h0;
    end else if (idle) begin
      state_0 <= earlyWinner_0;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else if (idle) begin
      state_1 <= earlyWinner_1;
    end
    if (reset) begin
      state_2 <= 1'h0;
    end else if (idle) begin
      state_2 <= earlyWinner_2;
    end
    if (reset) begin
      state_3 <= 1'h0;
    end else if (idle) begin
      state_3 <= earlyWinner_3;
    end
    if (reset) begin
      state_4 <= 1'h0;
    end else if (idle) begin
      state_4 <= earlyWinner_4;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~((~earlyWinner_0 | ~earlyWinner_1) & (~prefixOR_2 | ~earlyWinner_2) & (~prefixOR_3 | ~earlyWinner_3) & (~
          prefixOR_4 | ~earlyWinner_4)) & _readys_T_3) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_readys_T_3 & ~((~earlyWinner_0 | ~earlyWinner_1) & (~prefixOR_2 | ~earlyWinner_2) & (~prefixOR_3 | ~
          earlyWinner_3) & (~prefixOR_4 | ~earlyWinner_4))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(auto_out_0_d_valid | auto_out_1_d_valid | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid)
           | _prefixOR_T) & _readys_T_3) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_readys_T_3 & ~(~(auto_out_0_d_valid | auto_out_1_d_valid | auto_out_2_d_valid | auto_out_3_d_valid |
          auto_out_4_d_valid) | _prefixOR_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_26 | _T_25) & _readys_T_3) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_readys_T_3 & ~(_T_26 | _T_25)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  beatsLeft = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  readys_mask = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  state_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state_4 = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule