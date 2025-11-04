`timescale 1ns / 1ps
`include "ervp_global.vh"
`include "munoc_network_include.vh"
`include "platform_info.vh"

// --------------------------------------------------------------------------------------
// im2col_con (128-bit data path version)
// - External data path: 128-bit rdata/wdata
// - Byte enables: 16-bit (one bit per 8-bit lane)
// - Addressing:
//     * "Flat" element space is still byte-addressed internally for im2col packing.
//     * Buffer indices are issued per 128-bit line (addr >> 4).
//     * Byte offset within a 128-bit line is addr[3:0] in [0..15].
// - Extract/Store single 8-bit pixel into the proper byte lane.
// - All comments in English as requested.
// - FIXED for synthesizability:
//     * Combinational always block uses blocking assignments (=)
//     * Dynamic shift replaced with case statement
//     * Outputs driven by continuous assign
//     * Explicit signed/unsigned casting
// --------------------------------------------------------------------------------------

module im2col_con #(
    // Bus/config widths
    parameter integer BW_CFG        = 32,   // configuration registers width
    parameter integer BW_MEM        = 128,  // buffer data bus width (fixed 128b)
    parameter integer BW_BYTE_WEN   = 16,   // byte write enable width for 128b bus
    parameter integer BW_CELL_INDEX = 14    // buffer index width (line index)
)(
    input  wire                         clk,
    input  wire                         rstnn,
    input  wire                         start,

    // configuration
    input  wire [BW_CFG-1:0]            C_in,
    input  wire [BW_CFG-1:0]            H_in,
    input  wire [BW_CFG-1:0]            W_in,
    input  wire [BW_CFG-1:0]            K_h,
    input  wire [BW_CFG-1:0]            K_w,
    input  wire [BW_CFG-1:0]            pad_h,
    input  wire [BW_CFG-1:0]            pad_w,
    input  wire [BW_CFG-1:0]            stride_h,
    input  wire [BW_CFG-1:0]            stride_w,
    input  wire [BW_CFG-1:0]            dilation_h,
    input  wire [BW_CFG-1:0]            dilation_w,
    input  wire [7:0]                   input_zeropoint,

    // input buffer (Port B) : READ, 128-bit
    output wire [BW_CELL_INDEX-1:0]     ibuff_rindex,   // 128-bit line index
    output wire                         ibuff_renable,
    input  wire [BW_MEM-1:0]            ibuff_rdata,    // 128-bit read data

    // output buffer (Port A) : WRITE, 128-bit
    output wire [BW_CELL_INDEX-1:0]     obuff_index,    // 128-bit line index
    output wire                         obuff_enable,
    output wire [BW_BYTE_WEN-1:0]       obuff_wbe,      // 16-bit byte enables
    output wire [BW_MEM-1:0]            obuff_wdata,    // 128-bit write data

    output wire                         end_flag
);

  // ---------------------------
  // FSM state (simple FF)
  // ---------------------------
  localparam [2:0] S_IDLE       = 3'd0;
  localparam [2:0] S_CALC       = 3'd1;
  localparam [2:0] S_ADDR       = 3'd2;
  localparam [2:0] S_WAIT       = 3'd3;
  localparam [2:0] S_LOAD       = 3'd4;
  localparam [2:0] S_STORE      = 3'd5;
  localparam [2:0] S_UPDATE     = 3'd6;

  reg [2:0] state_q, state_d;

  // ---------------------------
  // Counters (load-enable FF)
  // ---------------------------
  reg [31:0] cnt_c_q,  cnt_c_d;
  reg [31:0] cnt_kh_q, cnt_kh_d;
  reg [31:0] cnt_kw_q, cnt_kw_d;
  reg [31:0] cnt_oh_q, cnt_oh_d;
  reg [31:0] cnt_ow_q, cnt_ow_d;

  // Output dims (FF with load)
  reg [31:0] Hout_q, Hout_d;
  reg [31:0] Wout_q, Wout_d;

  // Addressing and offsets
  reg  [31:0] full_addr_q, full_addr_d;     // flat byte address for input read
  reg  [3:0]  rd_byte_off_q, rd_byte_off_d;  // 0..15 within 128b line

  // Output addressing
  reg  [31:0] flat_out_idx_q, flat_out_idx_d; // flat byte index for im2col output
  reg  [31:0] out_line_idx_q, out_line_idx_d; // 128b line index for write
  reg  [3:0]  out_byte_off_q, out_byte_off_d; // 0..15 within 128b line

  // Data staging
  reg  [7:0]  pixel_byte_q, pixel_byte_d;

  // Control outputs (FF)
  reg         ibuff_ren_q, ibuff_ren_d;
  reg  [BW_CELL_INDEX-1:0] ibuff_ridx_q, ibuff_ridx_d;

  reg         obuff_en_q, obuff_en_d;
  reg  [BW_CELL_INDEX-1:0] obuff_idx_q, obuff_idx_d;
  reg  [BW_BYTE_WEN-1:0]   obuff_wbe_q, obuff_wbe_d;
  reg  [BW_MEM-1:0]        obuff_wdata_q, obuff_wdata_d;

  reg         end_flag_q, end_flag_d;

  // ---------------------------
  // Combinational calculations
  // ---------------------------
  wire signed [31:0] calc_row  = $signed(cnt_kh_q) * $signed(dilation_h) + $signed(cnt_oh_q) * $signed(stride_h) - $signed(pad_h);
  wire signed [31:0] calc_col  = $signed(cnt_kw_q) * $signed(dilation_w) + $signed(cnt_ow_q) * $signed(stride_w) - $signed(pad_w);

  // flat index (in bytes) in the "im2col" output layout
  wire [31:0] calc_flat = ((cnt_c_q * K_h * K_w + cnt_kh_q * K_w + cnt_kw_q) * Hout_q + cnt_oh_q) * Wout_q + cnt_ow_q;

  wire is_padding = (calc_row < 0 || calc_row >= $signed(H_in) || calc_col < 0 || calc_col >= $signed(W_in));
  wire is_last    = (cnt_c_q  == C_in - 1)  &&
                    (cnt_kh_q == K_h  - 1)  &&
                    (cnt_kw_q == K_w  - 1)  &&
                    (cnt_oh_q == Hout_q - 1) &&
                    (cnt_ow_q == Wout_q - 1);

  // ---------------------------
  // Next-state / next-data (COMBINATIONAL - use blocking assignments!)
  // ---------------------------
  always @(*) begin
    // defaults: hold
    state_d        = state_q;

    cnt_c_d        = cnt_c_q;
    cnt_kh_d       = cnt_kh_q;
    cnt_kw_d       = cnt_kw_q;
    cnt_oh_d       = cnt_oh_q;
    cnt_ow_d       = cnt_ow_q;

    Hout_d         = Hout_q;
    Wout_d         = Wout_q;

    full_addr_d    = full_addr_q;
    rd_byte_off_d  = rd_byte_off_q;

    flat_out_idx_d = flat_out_idx_q;
    out_line_idx_d = out_line_idx_q;
    out_byte_off_d = out_byte_off_q;

    pixel_byte_d   = pixel_byte_q;

    ibuff_ren_d    = 1'b0;              // default: no read pulse
    ibuff_ridx_d   = ibuff_ridx_q;

    obuff_en_d     = 1'b0;              // default: no write pulse
    obuff_idx_d    = obuff_idx_q;
    obuff_wbe_d    = {BW_BYTE_WEN{1'b0}};
    obuff_wdata_d  = {BW_MEM{1'b0}};

    end_flag_d     = 1'b0;

    case (state_q)
      S_IDLE: begin
        if (start && !end_flag_q) begin
          // compute output dims once
          // NOTE: Division is expensive! If stride_h/w are power-of-2, use shifts instead.
          Hout_d = (H_in + (pad_h<<1) - ((K_h-1)*dilation_h + 1)) / stride_h + 1;
          Wout_d = (W_in + (pad_w<<1) - ((K_w-1)*dilation_w + 1)) / stride_w + 1;

          // clear counters
          cnt_c_d  = 0;  cnt_kh_d = 0;  cnt_kw_d = 0;
          cnt_oh_d = 0;  cnt_ow_d = 0;

          // clear staging
          full_addr_d     = 0;
          rd_byte_off_d   = 0;
          flat_out_idx_d  = 0;
          out_line_idx_d  = 0;
          out_byte_off_d  = 0;
          pixel_byte_d    = 0;

          // clear buffer I/F visible state
          ibuff_ridx_d    = 0;
          // write interface defaults are already zeroed

          state_d         = S_CALC;
        end
      end

      S_CALC: begin
        // compute input flat byte address and output flat byte index
        // Use explicit unsigned cast for address calculation
        full_addr_d     = cnt_c_q * H_in * W_in + ($unsigned(calc_row) * W_in) + $unsigned(calc_col);
        flat_out_idx_d  = calc_flat;
        state_d         = S_ADDR;
      end

      S_ADDR: begin
        // compute output line/offset for 128-bit packing
        out_line_idx_d  = (flat_out_idx_q >> 4);  // /16 bytes
        out_byte_off_d  =  flat_out_idx_q[3:0];   // 0..15

        if (is_padding) begin
          // use zeropoint without issuing a read
          pixel_byte_d  = input_zeropoint;
          state_d       = S_STORE;
        end else begin
          // prepare input read at 128-bit line and offset
          ibuff_ridx_d   = (full_addr_q >> 4);   // /16
          rd_byte_off_d  =  full_addr_q[3:0];    // 0..15
          ibuff_ren_d    = 1'b1;
          state_d        = S_WAIT;
        end
      end

      S_WAIT: begin
        // single cycle wait for synchronous RAM read (if applicable)
        state_d = S_LOAD;
      end

      S_LOAD: begin
        // extract 8-bit from 128-bit read data according to rd_byte_off_q
        case (rd_byte_off_q)
          4'd0 : pixel_byte_d = ibuff_rdata[7:0];
          4'd1 : pixel_byte_d = ibuff_rdata[15:8];
          4'd2 : pixel_byte_d = ibuff_rdata[23:16];
          4'd3 : pixel_byte_d = ibuff_rdata[31:24];
          4'd4 : pixel_byte_d = ibuff_rdata[39:32];
          4'd5 : pixel_byte_d = ibuff_rdata[47:40];
          4'd6 : pixel_byte_d = ibuff_rdata[55:48];
          4'd7 : pixel_byte_d = ibuff_rdata[63:56];
          4'd8 : pixel_byte_d = ibuff_rdata[71:64];
          4'd9 : pixel_byte_d = ibuff_rdata[79:72];
          4'd10: pixel_byte_d = ibuff_rdata[87:80];
          4'd11: pixel_byte_d = ibuff_rdata[95:88];
          4'd12: pixel_byte_d = ibuff_rdata[103:96];
          4'd13: pixel_byte_d = ibuff_rdata[111:104];
          4'd14: pixel_byte_d = ibuff_rdata[119:112];
          4'd15: pixel_byte_d = ibuff_rdata[127:120];
        endcase
        state_d = S_STORE;
      end

      S_STORE: begin
        // issue 128-bit write with single-byte enable
        obuff_idx_d   = out_line_idx_q;
        obuff_en_d    = 1'b1;

        // byte enables (one-hot encoding)
        obuff_wbe_d   = (16'h1 << out_byte_off_q);

        // Place pixel into proper byte lane using case statement (better synthesis than dynamic shift)
        case (out_byte_off_q)
          4'd0 : obuff_wdata_d = {120'h0, pixel_byte_q};
          4'd1 : obuff_wdata_d = {112'h0, pixel_byte_q, 8'h0};
          4'd2 : obuff_wdata_d = {104'h0, pixel_byte_q, 16'h0};
          4'd3 : obuff_wdata_d = {96'h0,  pixel_byte_q, 24'h0};
          4'd4 : obuff_wdata_d = {88'h0,  pixel_byte_q, 32'h0};
          4'd5 : obuff_wdata_d = {80'h0,  pixel_byte_q, 40'h0};
          4'd6 : obuff_wdata_d = {72'h0,  pixel_byte_q, 48'h0};
          4'd7 : obuff_wdata_d = {64'h0,  pixel_byte_q, 56'h0};
          4'd8 : obuff_wdata_d = {56'h0,  pixel_byte_q, 64'h0};
          4'd9 : obuff_wdata_d = {48'h0,  pixel_byte_q, 72'h0};
          4'd10: obuff_wdata_d = {40'h0,  pixel_byte_q, 80'h0};
          4'd11: obuff_wdata_d = {32'h0,  pixel_byte_q, 88'h0};
          4'd12: obuff_wdata_d = {24'h0,  pixel_byte_q, 96'h0};
          4'd13: obuff_wdata_d = {16'h0,  pixel_byte_q, 104'h0};
          4'd14: obuff_wdata_d = {8'h0,   pixel_byte_q, 112'h0};
          4'd15: obuff_wdata_d = {pixel_byte_q, 120'h0};
        endcase

        state_d       = S_UPDATE;
      end

      S_UPDATE: begin
        if (is_last) begin
          end_flag_d = 1'b1;
          state_d    = S_IDLE;
        end else begin
          // nested loop update order: ow -> oh -> kw -> kh -> c
          if (cnt_ow_q < Wout_q - 1) begin
            cnt_ow_d = cnt_ow_q + 1;
          end else begin
            cnt_ow_d = 0;
            if (cnt_oh_q < Hout_q - 1) begin
              cnt_oh_d = cnt_oh_q + 1;
            end else begin
              cnt_oh_d = 0;
              if (cnt_kw_q < K_w - 1) begin
                cnt_kw_d = cnt_kw_q + 1;
              end else begin
                cnt_kw_d = 0;
                if (cnt_kh_q < K_h - 1) begin
                  cnt_kh_d = cnt_kh_q + 1;
                end else begin
                  cnt_kh_d = 0;
                  if (cnt_c_q < C_in - 1) begin
                    cnt_c_d = cnt_c_q + 1;
                  end
                end
              end
            end
          end
          state_d = S_CALC;
        end
      end

      default: begin
        state_d = S_IDLE;
      end
    endcase
  end

  // ---------------------------
  // Sequential (FF updates)
  // ---------------------------
  always @(posedge clk or negedge rstnn) begin
    if (!rstnn) begin
      state_q        <= S_IDLE;

      cnt_c_q        <= 0;  cnt_kh_q <= 0;  cnt_kw_q <= 0;
      cnt_oh_q       <= 0;  cnt_ow_q <= 0;

      Hout_q         <= 0;  Wout_q   <= 0;

      full_addr_q    <= 0;
      rd_byte_off_q  <= 0;

      flat_out_idx_q <= 0;
      out_line_idx_q <= 0;
      out_byte_off_q <= 0;

      pixel_byte_q   <= 0;

      ibuff_ren_q    <= 1'b0;
      ibuff_ridx_q   <= 0;

      obuff_en_q     <= 1'b0;
      obuff_idx_q    <= 0;
      obuff_wbe_q    <= {BW_BYTE_WEN{1'b0}};
      obuff_wdata_q  <= {BW_MEM{1'b0}};

      end_flag_q     <= 1'b0;
    end else begin
      state_q        <= state_d;

      cnt_c_q        <= cnt_c_d;    cnt_kh_q <= cnt_kh_d;   cnt_kw_q <= cnt_kw_d;
      cnt_oh_q       <= cnt_oh_d;   cnt_ow_q <= cnt_ow_d;

      Hout_q         <= Hout_d;     Wout_q   <= Wout_d;

      full_addr_q    <= full_addr_d;
      rd_byte_off_q  <= rd_byte_off_d;

      flat_out_idx_q <= flat_out_idx_d;
      out_line_idx_q <= out_line_idx_d;
      out_byte_off_q <= out_byte_off_d;

      pixel_byte_q   <= pixel_byte_d;

      ibuff_ren_q    <= ibuff_ren_d;
      ibuff_ridx_q   <= ibuff_ridx_d;

      obuff_en_q     <= obuff_en_d;
      obuff_idx_q    <= obuff_idx_d;
      obuff_wbe_q    <= obuff_wbe_d;
      obuff_wdata_q  <= obuff_wdata_d;

      end_flag_q     <= end_flag_d;
    end
  end

  // ---------------------------
  // Drive outputs from *_q (continuous assign for better synthesis)
  // ---------------------------
  assign ibuff_renable = ibuff_ren_q;
  assign ibuff_rindex  = ibuff_ridx_q;

  assign obuff_enable  = obuff_en_q;
  assign obuff_index   = obuff_idx_q;
  assign obuff_wbe     = obuff_wbe_q;
  assign obuff_wdata   = obuff_wdata_q;

  assign end_flag      = end_flag_q;

endmodule
