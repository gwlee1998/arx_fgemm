module qdq_controller_1row(
    clk,
    rstnn,

    qx_start_i,
    qw_start_i,
    dq_start_i,
    qx_busy_o,
    qw_busy_o,
    dq_busy_o,
    scl_busy_o,
    // A tile → quantize
    mx_valid_i,
    mx_ready_o,
    mx_data_i,

    qx_valid_o,
    qx_ready_i,
    qx_data_o,
    qx_index_o,
    // B tile → quantize
    mw_valid_i,
    mw_ready_o,
    mw_data_i,

    qw_valid_o,
    qw_ready_i,
    qw_data_o,
    qw_index_o,
    // ACC tile → dequantize
    qo_valid_i,
    qo_ready_o,
    qo_data_i,
    qo_index_i,
    // dequantized FP out
    mo_valid_o,
    mo_ready_i,
    mo_data_o
);

`include "dca_matrix_qgemm_defines.vh"

    parameter BIT_NUM          = `QUANT_PRECCISION_NUM_BIT;
    parameter FP_DATA_W        = 32;
    parameter FP_EXP_W         = 8;
    parameter FP_MANT_W        = 23;
    parameter FP_EXP_BIAS      = 127;

    parameter VTA_DATA_WIDTH   = 32;
    parameter MATRIX_NUM_COL  = `DCA_MATRIX_QDQ_NUM_COL;
    parameter MATRIX_NUM_ROW  = `DCA_MATRIX_QDQ_NUM_ROW;
    parameter SCALE_FIFO_DEPTH = 4;

    localparam LOG_MATRIX_NUM_ROW = $clog2(MATRIX_NUM_ROW);
    localparam INDEX_W         = LOG_MATRIX_NUM_ROW;
    localparam ELEMS = MATRIX_NUM_COL*MATRIX_NUM_ROW;
    localparam MANT_VEC_WIDTH = FP_MANT_W * MATRIX_NUM_COL;
    localparam EXP_VEC_WIDTH  = FP_EXP_W * MATRIX_NUM_COL;

    input wire                           clk;
    input wire                           rstnn;
    input wire                           qx_start_i;
    input wire                           qw_start_i;
    input wire                           dq_start_i;
    output wire                          qx_busy_o;
    output wire                          qw_busy_o;
    output wire                          dq_busy_o;
    output wire                          scl_busy_o;
    // A tile → quantize
    input wire                           mx_valid_i;
    output wire                          mx_ready_o;
    input wire [MATRIX_NUM_COL*FP_DATA_W-1:0] mx_data_i;
    output wire                          qx_valid_o;
    input wire                           qx_ready_i;
    output wire [MATRIX_NUM_COL*BIT_NUM-1:0] qx_data_o;
    output wire [INDEX_W-1:0]            qx_index_o;
    // B tile → quantize
    input wire                           mw_valid_i;
    output wire                          mw_ready_o;
    input wire [MATRIX_NUM_COL*FP_DATA_W-1:0] mw_data_i;
    output wire                          qw_valid_o;
    input wire                           qw_ready_i;
    output wire [MATRIX_NUM_COL*BIT_NUM-1:0] qw_data_o;
    output wire [INDEX_W-1:0]            qw_index_o;
    // ACC tile → dequantize
    input wire                           qo_valid_i;
    output wire                          qo_ready_o;
    input wire [MATRIX_NUM_COL*VTA_DATA_WIDTH-1:0] qo_data_i;
    input wire [INDEX_W-1:0]            qo_index_i;
    // dequantized FP out
    output wire                          mo_valid_o;
    input wire                           mo_ready_i;
    output wire [MATRIX_NUM_COL*FP_DATA_W-1:0] mo_data_o;

    wire qx_busy, qw_busy, quant_busy;
    wire scale_fifo_busy, scale_fifo_clear;
    wire [FP_EXP_W-1:0]    qx_exp_scale_1elm;
    wire [FP_MANT_W-1:0]   qx_man_scale_1elm;
    wire                   qx_scale_valid;
    wire                   qx_scale_ready;
    wire [FP_EXP_W-1:0]    qw_exp_scale_1elm;
    wire [FP_MANT_W-1:0]   qw_man_scale_1elm;
    wire                   qw_scale_valid;
    wire                   qw_scale_ready;

    wire                        dq_qo_scl_rreq;
    wire                        dq_qo_scl_rready;
    wire [EXP_VEC_WIDTH-1:0]    dq_qo_scl_exp_1row;
    wire [MANT_VEC_WIDTH-1:0]   dq_qo_scl_man_1row;
    wire [INDEX_W-1:0]          dq_qo_scl_row_index;

    wire dequantizer_array_busy;
    
    // wire dquant_qo_1row_ready;
    // wire dquant_qo_1row_valid;
    // wire [MATRIX_NUM_COL*VTA_DATA_WIDTH-1:0] dquant_qo_1row_data;


    reg [1:0] state, state_next;
    localparam S_IDLE      = 2'd0,
               S_QUANTIZE  = 2'd1,
               S_WAIT_EXT = 2'd2,
               S_DEQUANTIZE = 2'd3;

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            state <= S_IDLE;
        end
        else begin
            state <= state_next;
        end
    end

    always @(*) begin
        state_next = state;
        case(state)
            S_IDLE: begin
                if (qx_start_i) begin
                    state_next = S_QUANTIZE;
                end
            end
            S_QUANTIZE: begin
                if (quant_busy == 1'b0) begin
                    state_next = S_WAIT_EXT;
                end
            end
            S_WAIT_EXT: begin
                if (dq_start_i) begin
                    state_next = S_DEQUANTIZE;
                end
            end
            S_DEQUANTIZE: begin
                if (dequantizer_array_busy == 1'b0) begin
                    state_next = S_IDLE;
                end
            end
        endcase
    end
    
    assign dq_busy_o = (state == S_DEQUANTIZE);
    assign qx_busy_o = qx_busy;
    assign qw_busy_o = qw_busy;
    assign scl_busy_o = scale_fifo_busy;
    assign quant_busy = qx_busy | qw_busy;

    // quantize A
    quant_array_1row #(
        .BIT_NUM       (BIT_NUM),
        .FP_DATA_W     (FP_DATA_W),
        .FP_EXP_W      (FP_EXP_W),
        .FP_MANT_W     (FP_MANT_W),
        .FP_EXP_BIAS   (FP_EXP_BIAS),
        .VTA_DATA_WIDTH(VTA_DATA_WIDTH),
        .MATRIX_NUM_COL(MATRIX_NUM_COL),
        .MATRIX_NUM_ROW(MATRIX_NUM_ROW)
    ) u_quant_array_1row_A (
        .clk                (clk),
        .rstnn              (rstnn),
        .start_i            (qx_start_i),
        .busy_o             (qx_busy),
        .float_1row_valid_i (mx_valid_i),
        .float_1row_ready_o (mx_ready_o),
        .float_1row_data_i  (mx_data_i),
        .quant_1row_valid_o (qx_valid_o),
        .quant_1row_ready_i (qx_ready_i),
        .quant_1row_data_o  (qx_data_o),
        .quant_row_index_o  (qx_index_o),
        .exp_scale_1elm_o   (qx_exp_scale_1elm),
        .mantissa_scale_1elm_o(qx_man_scale_1elm),
        .scale_valid_o      (qx_scale_valid),
        .scale_ready_i      (qx_scale_ready)
    );

    // quantize B
    quant_array_1row #(
        .BIT_NUM       (BIT_NUM),
        .FP_DATA_W     (FP_DATA_W),
        .FP_EXP_W      (FP_EXP_W),
        .FP_MANT_W     (FP_MANT_W),
        .FP_EXP_BIAS   (FP_EXP_BIAS),
        .VTA_DATA_WIDTH(VTA_DATA_WIDTH),
        .MATRIX_NUM_COL(MATRIX_NUM_COL),
        .MATRIX_NUM_ROW(MATRIX_NUM_ROW)
    ) u_quant_array_1row_B (
        .clk                (clk),
        .rstnn              (rstnn),
        .start_i            (qw_start_i),
        .busy_o             (qw_busy),
        .float_1row_valid_i (mw_valid_i),
        .float_1row_ready_o (mw_ready_o),
        .float_1row_data_i  (mw_data_i),
        .quant_1row_valid_o (qw_valid_o),
        .quant_1row_ready_i (qw_ready_i),
        .quant_1row_data_o  (qw_data_o),
        .quant_row_index_o  (qw_index_o),
        .exp_scale_1elm_o   (qw_exp_scale_1elm),
        .mantissa_scale_1elm_o(qw_man_scale_1elm),
        .scale_valid_o      (qw_scale_valid),
        .scale_ready_i      (qw_scale_ready)
    );

    scale_gen_buffer #(
        .FP_EXP_W   (FP_EXP_W),
        .FP_MANT_W  (FP_MANT_W),
        .MATRIX_NUM_COL(MATRIX_NUM_COL),
        .MATRIX_NUM_ROW(MATRIX_NUM_ROW)
    ) u_scale_gen_buffer (
        .clk                    (clk),
        .rstnn                  (rstnn),
        .busy_o                 (scale_fifo_busy),
        .clear_i                (scale_fifo_clear),

        .qx_scl_exp_1elm_i      (qx_exp_scale_1elm),
        .qx_scl_man_1elm_i      (qx_man_scale_1elm),
        .qx_scl_valid_i         (qx_scale_valid),
        .qx_scl_ready_o         (qx_scale_ready),

        .qw_scl_exp_1elm_i      (qw_exp_scale_1elm),
        .qw_scl_man_1elm_i      (qw_man_scale_1elm),
        .qw_scl_valid_i         (qw_scale_valid),
        .qw_scl_ready_o         (qw_scale_ready),
        .qw_scl_row_index_i     (qw_index_o),

        .qo_scl_exp_1row_rdata_o(dq_qo_scl_exp_1row),
        .qo_scl_man_1row_rdata_o(dq_qo_scl_man_1row),
        .qo_scl_row_index_i     (dq_qo_scl_row_index),
        .qo_scl_rreq_i          (dq_qo_scl_rreq),
        .qo_scl_rready_o        (dq_qo_scl_rready)
    );

    assign scale_fifo_clear = (state == S_IDLE) ? 1'b1 : 1'b0;
    // dequantize

    wire dq_qo_scl_valid, dq_qo_scl_ready;
    assign dq_qo_scl_rreq = dq_qo_scl_ready & dq_qo_scl_rready;
    assign dq_qo_scl_valid = dq_qo_scl_rready;

    dequant_array_1row #(
        .BIT_NUM       (BIT_NUM),
        .FP_DATA_W     (FP_DATA_W),
        .FP_EXP_W      (FP_EXP_W),
        .FP_MANT_W     (FP_MANT_W),
        .FP_EXP_BIAS   (FP_EXP_BIAS),
        .MATRIX_NUM_COL(MATRIX_NUM_COL),
        .MATRIX_NUM_ROW(MATRIX_NUM_ROW)
    ) u_dequant_array_1row (
        .clk                 (clk),
        .rstnn               (rstnn),
        .start_i             (dq_start_i),
        .busy_o              (dequantizer_array_busy),
        
        .quant_1row_valid_i  (qo_valid_i),
        .quant_1row_ready_o  (qo_ready_o),
        .quant_1row_data_i   (qo_data_i),
        .quant_row_index_i   (qo_index_i),

        .exp_scale_1row_i    (dq_qo_scl_exp_1row),
        .mantissa_scale_1row_i(dq_qo_scl_man_1row),
        .scale_valid_i       (dq_qo_scl_valid),
        .scale_ready_o       (dq_qo_scl_ready),
        
        .float_1row_valid_o  (mo_valid_o),
        .float_1row_ready_i  (mo_ready_i),
        .float_1row_data_o   (mo_data_o)
    );
 `ifdef SIM_ENV
    reg [MATRIX_NUM_COL*BIT_NUM-1:0] qx_captured [0:MATRIX_NUM_ROW-1];
    reg [MATRIX_NUM_COL*BIT_NUM-1:0] qw_captured [0:MATRIX_NUM_ROW-1];

    always @(posedge clk) begin
        if (qx_valid_o && qx_ready_i) begin
            qx_captured[qx_index_o] <= qx_data_o;
            $display("[%0t] QX[%d]: exp=%h, man=%h", $time, qx_index_o, qx_exp_scale_1elm, qx_man_scale_1elm);
            for (int i = 0; i < MATRIX_NUM_COL; i++) begin
                $write("%4d ", $signed(qx_data_o[i*BIT_NUM +: BIT_NUM]));
            end
            $display("");
        end
        
        if (qw_valid_o && qw_ready_i) begin
            qw_captured[qw_index_o] <= qw_data_o;
            $display("[%0t] QW[%d]: exp=%h, man=%h", $time, qw_index_o, qw_exp_scale_1elm, qw_man_scale_1elm);
            for (int i = 0; i < MATRIX_NUM_COL; i++) begin
                $write("%4d ", $signed(qw_data_o[i*BIT_NUM +: BIT_NUM]));
            end
            $display("");
        end
        if(qo_data_i!=0 && qo_valid_i && qo_ready_o) begin
            $display("[%0t] DQ ACC[%d]:", $time, qo_index_i);
            for (int i = 0; i < MATRIX_NUM_COL; i++) begin
                $write("%8d ", $signed(qo_data_i[i*VTA_DATA_WIDTH +: VTA_DATA_WIDTH]));
            end
            $display("");
        end
    end

    // Quantization 완료 감지
    always @(posedge clk) begin
        if (qx_busy && (state_next == S_WAIT_EXT)) begin
            $display("\n===== QX Quantization Complete =====");
        end
        if (qw_busy && (state_next == S_WAIT_EXT)) begin
            $display("\n===== QW Quantization Complete =====");
        end
    end


 `endif

endmodule