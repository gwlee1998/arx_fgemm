`default_nettype wire
`include "timescale.vh"
module AXI4UserYanker_2(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input         auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  input  [6:0]  auto_in_aw_bits_echo_extra_id,
  input         auto_in_aw_bits_echo_real_last,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output        auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output [6:0]  auto_in_b_bits_echo_extra_id,
  output        auto_in_b_bits_echo_real_last,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input         auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input  [6:0]  auto_in_ar_bits_echo_extra_id,
  input         auto_in_ar_bits_echo_real_last,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output        auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output [6:0]  auto_in_r_bits_echo_extra_id,
  output        auto_in_r_bits_echo_real_last,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output        auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input         auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output        auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input         auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_last
);
  wire  QueueCompatibility_clock;
  wire  QueueCompatibility_reset;
  wire  QueueCompatibility_io_enq_ready;
  wire  QueueCompatibility_io_enq_valid;
  wire [6:0] QueueCompatibility_io_enq_bits_extra_id;
  wire  QueueCompatibility_io_enq_bits_real_last;
  wire  QueueCompatibility_io_deq_ready;
  wire  QueueCompatibility_io_deq_valid;
  wire [6:0] QueueCompatibility_io_deq_bits_extra_id;
  wire  QueueCompatibility_io_deq_bits_real_last;
  wire  QueueCompatibility_1_clock;
  wire  QueueCompatibility_1_reset;
  wire  QueueCompatibility_1_io_enq_ready;
  wire  QueueCompatibility_1_io_enq_valid;
  wire [6:0] QueueCompatibility_1_io_enq_bits_extra_id;
  wire  QueueCompatibility_1_io_enq_bits_real_last;
  wire  QueueCompatibility_1_io_deq_ready;
  wire  QueueCompatibility_1_io_deq_valid;
  wire [6:0] QueueCompatibility_1_io_deq_bits_extra_id;
  wire  QueueCompatibility_1_io_deq_bits_real_last;
  wire  QueueCompatibility_2_clock;
  wire  QueueCompatibility_2_reset;
  wire  QueueCompatibility_2_io_enq_ready;
  wire  QueueCompatibility_2_io_enq_valid;
  wire [6:0] QueueCompatibility_2_io_enq_bits_extra_id;
  wire  QueueCompatibility_2_io_enq_bits_real_last;
  wire  QueueCompatibility_2_io_deq_ready;
  wire  QueueCompatibility_2_io_deq_valid;
  wire [6:0] QueueCompatibility_2_io_deq_bits_extra_id;
  wire  QueueCompatibility_2_io_deq_bits_real_last;
  wire  QueueCompatibility_3_clock;
  wire  QueueCompatibility_3_reset;
  wire  QueueCompatibility_3_io_enq_ready;
  wire  QueueCompatibility_3_io_enq_valid;
  wire [6:0] QueueCompatibility_3_io_enq_bits_extra_id;
  wire  QueueCompatibility_3_io_enq_bits_real_last;
  wire  QueueCompatibility_3_io_deq_ready;
  wire  QueueCompatibility_3_io_deq_valid;
  wire [6:0] QueueCompatibility_3_io_deq_bits_extra_id;
  wire  QueueCompatibility_3_io_deq_bits_real_last;
  wire  _ar_ready_WIRE_0 = QueueCompatibility_io_enq_ready;
  wire  _ar_ready_WIRE_1 = QueueCompatibility_1_io_enq_ready;
  wire  _GEN_1 = auto_in_ar_bits_id ? _ar_ready_WIRE_1 : _ar_ready_WIRE_0;
  wire  _r_valid_WIRE_0 = QueueCompatibility_io_deq_valid;
  wire  _r_valid_WIRE_1 = QueueCompatibility_1_io_deq_valid;
  wire  _GEN_3 = auto_out_r_bits_id ? _r_valid_WIRE_1 : _r_valid_WIRE_0;
  wire  _T_3 = ~reset;
  wire  _r_bits_WIRE_0_real_last = QueueCompatibility_io_deq_bits_real_last;
  wire  _r_bits_WIRE_1_real_last = QueueCompatibility_1_io_deq_bits_real_last;
  wire [6:0] _r_bits_WIRE_0_extra_id = QueueCompatibility_io_deq_bits_extra_id;
  wire [6:0] _r_bits_WIRE_1_extra_id = QueueCompatibility_1_io_deq_bits_extra_id;
  wire [1:0] _arsel_T = 2'h1 << auto_in_ar_bits_id;
  wire  arsel_0 = _arsel_T[0];
  wire  arsel_1 = _arsel_T[1];
  wire [1:0] _rsel_T = 2'h1 << auto_out_r_bits_id;
  wire  rsel_0 = _rsel_T[0];
  wire  rsel_1 = _rsel_T[1];
  wire  _aw_ready_WIRE_0 = QueueCompatibility_2_io_enq_ready;
  wire  _aw_ready_WIRE_1 = QueueCompatibility_3_io_enq_ready;
  wire  _GEN_9 = auto_in_aw_bits_id ? _aw_ready_WIRE_1 : _aw_ready_WIRE_0;
  wire  _b_valid_WIRE_0 = QueueCompatibility_2_io_deq_valid;
  wire  _b_valid_WIRE_1 = QueueCompatibility_3_io_deq_valid;
  wire  _GEN_11 = auto_out_b_bits_id ? _b_valid_WIRE_1 : _b_valid_WIRE_0;
  wire  _b_bits_WIRE_0_real_last = QueueCompatibility_2_io_deq_bits_real_last;
  wire  _b_bits_WIRE_1_real_last = QueueCompatibility_3_io_deq_bits_real_last;
  wire [6:0] _b_bits_WIRE_0_extra_id = QueueCompatibility_2_io_deq_bits_extra_id;
  wire [6:0] _b_bits_WIRE_1_extra_id = QueueCompatibility_3_io_deq_bits_extra_id;
  wire [1:0] _awsel_T = 2'h1 << auto_in_aw_bits_id;
  wire  awsel_0 = _awsel_T[0];
  wire  awsel_1 = _awsel_T[1];
  wire [1:0] _bsel_T = 2'h1 << auto_out_b_bits_id;
  wire  bsel_0 = _bsel_T[0];
  wire  bsel_1 = _bsel_T[1];
  QueueCompatibility_28 QueueCompatibility (
    .clock(QueueCompatibility_clock),
    .reset(QueueCompatibility_reset),
    .io_enq_ready(QueueCompatibility_io_enq_ready),
    .io_enq_valid(QueueCompatibility_io_enq_valid),
    .io_enq_bits_extra_id(QueueCompatibility_io_enq_bits_extra_id),
    .io_enq_bits_real_last(QueueCompatibility_io_enq_bits_real_last),
    .io_deq_ready(QueueCompatibility_io_deq_ready),
    .io_deq_valid(QueueCompatibility_io_deq_valid),
    .io_deq_bits_extra_id(QueueCompatibility_io_deq_bits_extra_id),
    .io_deq_bits_real_last(QueueCompatibility_io_deq_bits_real_last)
  );
  QueueCompatibility_28 QueueCompatibility_1 (
    .clock(QueueCompatibility_1_clock),
    .reset(QueueCompatibility_1_reset),
    .io_enq_ready(QueueCompatibility_1_io_enq_ready),
    .io_enq_valid(QueueCompatibility_1_io_enq_valid),
    .io_enq_bits_extra_id(QueueCompatibility_1_io_enq_bits_extra_id),
    .io_enq_bits_real_last(QueueCompatibility_1_io_enq_bits_real_last),
    .io_deq_ready(QueueCompatibility_1_io_deq_ready),
    .io_deq_valid(QueueCompatibility_1_io_deq_valid),
    .io_deq_bits_extra_id(QueueCompatibility_1_io_deq_bits_extra_id),
    .io_deq_bits_real_last(QueueCompatibility_1_io_deq_bits_real_last)
  );
  QueueCompatibility_28 QueueCompatibility_2 (
    .clock(QueueCompatibility_2_clock),
    .reset(QueueCompatibility_2_reset),
    .io_enq_ready(QueueCompatibility_2_io_enq_ready),
    .io_enq_valid(QueueCompatibility_2_io_enq_valid),
    .io_enq_bits_extra_id(QueueCompatibility_2_io_enq_bits_extra_id),
    .io_enq_bits_real_last(QueueCompatibility_2_io_enq_bits_real_last),
    .io_deq_ready(QueueCompatibility_2_io_deq_ready),
    .io_deq_valid(QueueCompatibility_2_io_deq_valid),
    .io_deq_bits_extra_id(QueueCompatibility_2_io_deq_bits_extra_id),
    .io_deq_bits_real_last(QueueCompatibility_2_io_deq_bits_real_last)
  );
  QueueCompatibility_28 QueueCompatibility_3 (
    .clock(QueueCompatibility_3_clock),
    .reset(QueueCompatibility_3_reset),
    .io_enq_ready(QueueCompatibility_3_io_enq_ready),
    .io_enq_valid(QueueCompatibility_3_io_enq_valid),
    .io_enq_bits_extra_id(QueueCompatibility_3_io_enq_bits_extra_id),
    .io_enq_bits_real_last(QueueCompatibility_3_io_enq_bits_real_last),
    .io_deq_ready(QueueCompatibility_3_io_deq_ready),
    .io_deq_valid(QueueCompatibility_3_io_deq_valid),
    .io_deq_bits_extra_id(QueueCompatibility_3_io_deq_bits_extra_id),
    .io_deq_bits_real_last(QueueCompatibility_3_io_deq_bits_real_last)
  );
  assign auto_in_aw_ready = auto_out_aw_ready & _GEN_9;
  assign auto_in_w_ready = auto_out_w_ready;
  assign auto_in_b_valid = auto_out_b_valid;
  assign auto_in_b_bits_id = auto_out_b_bits_id;
  assign auto_in_b_bits_resp = auto_out_b_bits_resp;
  assign auto_in_b_bits_echo_extra_id = auto_out_b_bits_id ? _b_bits_WIRE_1_extra_id : _b_bits_WIRE_0_extra_id;
  assign auto_in_b_bits_echo_real_last = auto_out_b_bits_id ? _b_bits_WIRE_1_real_last : _b_bits_WIRE_0_real_last;
  assign auto_in_ar_ready = auto_out_ar_ready & _GEN_1;
  assign auto_in_r_valid = auto_out_r_valid;
  assign auto_in_r_bits_id = auto_out_r_bits_id;
  assign auto_in_r_bits_data = auto_out_r_bits_data;
  assign auto_in_r_bits_resp = auto_out_r_bits_resp;
  assign auto_in_r_bits_echo_extra_id = auto_out_r_bits_id ? _r_bits_WIRE_1_extra_id : _r_bits_WIRE_0_extra_id;
  assign auto_in_r_bits_echo_real_last = auto_out_r_bits_id ? _r_bits_WIRE_1_real_last : _r_bits_WIRE_0_real_last;
  assign auto_in_r_bits_last = auto_out_r_bits_last;
  assign auto_out_aw_valid = auto_in_aw_valid & _GEN_9;
  assign auto_out_aw_bits_id = auto_in_aw_bits_id;
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr;
  assign auto_out_aw_bits_len = auto_in_aw_bits_len;
  assign auto_out_aw_bits_size = auto_in_aw_bits_size;
  assign auto_out_aw_bits_cache = auto_in_aw_bits_cache;
  assign auto_out_aw_bits_prot = auto_in_aw_bits_prot;
  assign auto_out_w_valid = auto_in_w_valid;
  assign auto_out_w_bits_data = auto_in_w_bits_data;
  assign auto_out_w_bits_strb = auto_in_w_bits_strb;
  assign auto_out_w_bits_last = auto_in_w_bits_last;
  assign auto_out_b_ready = auto_in_b_ready;
  assign auto_out_ar_valid = auto_in_ar_valid & _GEN_1;
  assign auto_out_ar_bits_id = auto_in_ar_bits_id;
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr;
  assign auto_out_ar_bits_len = auto_in_ar_bits_len;
  assign auto_out_ar_bits_size = auto_in_ar_bits_size;
  assign auto_out_ar_bits_cache = auto_in_ar_bits_cache;
  assign auto_out_ar_bits_prot = auto_in_ar_bits_prot;
  assign auto_out_r_ready = auto_in_r_ready;
  assign QueueCompatibility_clock = clock;
  assign QueueCompatibility_reset = reset;
  assign QueueCompatibility_io_enq_valid = auto_in_ar_valid & auto_out_ar_ready & arsel_0;
  assign QueueCompatibility_io_enq_bits_extra_id = auto_in_ar_bits_echo_extra_id;
  assign QueueCompatibility_io_enq_bits_real_last = auto_in_ar_bits_echo_real_last;
  assign QueueCompatibility_io_deq_ready = auto_out_r_valid & auto_in_r_ready & rsel_0 & auto_out_r_bits_last;
  assign QueueCompatibility_1_clock = clock;
  assign QueueCompatibility_1_reset = reset;
  assign QueueCompatibility_1_io_enq_valid = auto_in_ar_valid & auto_out_ar_ready & arsel_1;
  assign QueueCompatibility_1_io_enq_bits_extra_id = auto_in_ar_bits_echo_extra_id;
  assign QueueCompatibility_1_io_enq_bits_real_last = auto_in_ar_bits_echo_real_last;
  assign QueueCompatibility_1_io_deq_ready = auto_out_r_valid & auto_in_r_ready & rsel_1 & auto_out_r_bits_last;
  assign QueueCompatibility_2_clock = clock;
  assign QueueCompatibility_2_reset = reset;
  assign QueueCompatibility_2_io_enq_valid = auto_in_aw_valid & auto_out_aw_ready & awsel_0;
  assign QueueCompatibility_2_io_enq_bits_extra_id = auto_in_aw_bits_echo_extra_id;
  assign QueueCompatibility_2_io_enq_bits_real_last = auto_in_aw_bits_echo_real_last;
  assign QueueCompatibility_2_io_deq_ready = auto_out_b_valid & auto_in_b_ready & bsel_0;
  assign QueueCompatibility_3_clock = clock;
  assign QueueCompatibility_3_reset = reset;
  assign QueueCompatibility_3_io_enq_valid = auto_in_aw_valid & auto_out_aw_ready & awsel_1;
  assign QueueCompatibility_3_io_enq_bits_extra_id = auto_in_aw_bits_echo_extra_id;
  assign QueueCompatibility_3_io_enq_bits_real_last = auto_in_aw_bits_echo_real_last;
  assign QueueCompatibility_3_io_deq_ready = auto_out_b_valid & auto_in_b_ready & bsel_1;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~auto_out_r_valid | _GEN_3) & ~reset) begin
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
        if (~reset & ~(~auto_out_r_valid | _GEN_3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at UserYanker.scala:63 assert (!out.r.valid || r_valid) // Q must be ready faster than the response\n"
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
        if (~(~auto_out_b_valid | _GEN_11) & _T_3) begin
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
        if (_T_3 & ~(~auto_out_b_valid | _GEN_11)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at UserYanker.scala:84 assert (!out.b.valid || b_valid) // Q must be ready faster than the response\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule