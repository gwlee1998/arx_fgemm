module scale_gen_buffer(
    clk,
    rstnn,
    busy_o,
    clear_i,
    qx_scl_exp_1elm_i,
    qx_scl_man_1elm_i,
    qx_scl_valid_i,
    qx_scl_ready_o,
    qw_scl_exp_1elm_i,
    qw_scl_man_1elm_i,
    qw_scl_valid_i,
    qw_scl_ready_o,
    qw_scl_row_index_i,
    qo_scl_exp_1row_rdata_o,
    qo_scl_man_1row_rdata_o,
    qo_scl_row_index_i,
    qo_scl_rreq_i,
    qo_scl_rready_o
);

    `include "dca_matrix_qgemm_defines.vh"
    
    parameter FP_EXP_W = 8;
    parameter FP_MANT_W = 23;
    parameter FP_EXP_BIAS = 127;
    parameter MATRIX_NUM_COL    = `DCA_MATRIX_QDQ_NUM_COL;
    parameter MATRIX_NUM_ROW    = `DCA_MATRIX_QDQ_NUM_ROW;

    localparam MANT_VEC_WIDTH = FP_MANT_W * MATRIX_NUM_COL;
    localparam EXP_VEC_WIDTH  = FP_EXP_W * MATRIX_NUM_COL;
    localparam LOG_MATRIX_NUM_ROW = $clog2(MATRIX_NUM_ROW);

    input wire clk;
    input wire rstnn;
    output wire busy_o;
    input wire clear_i;
    input wire [FP_EXP_W -1:0] qx_scl_exp_1elm_i;
    input wire [FP_MANT_W-1:0] qx_scl_man_1elm_i;
    input wire                 qx_scl_valid_i;
    output wire                qx_scl_ready_o;
    input wire [FP_EXP_W -1:0] qw_scl_exp_1elm_i;
    input wire [FP_MANT_W-1:0] qw_scl_man_1elm_i;
    input wire                 qw_scl_valid_i;
    output wire                qw_scl_ready_o;
    input wire [LOG_MATRIX_NUM_ROW-1:0] qw_scl_row_index_i;
    output wire [EXP_VEC_WIDTH -1:0] qo_scl_exp_1row_rdata_o;
    output wire [MANT_VEC_WIDTH -1:0] qo_scl_man_1row_rdata_o;
    input wire [LOG_MATRIX_NUM_ROW-1:0] qo_scl_row_index_i;
    output wire                qo_scl_rready_o;
    input wire                 qo_scl_rreq_i;

    genvar i;
    integer j;

    reg [FP_EXP_W-1:0] qw_scl_exp_1row_q [0:MATRIX_NUM_ROW-1];
    reg [FP_MANT_W-1:0] qw_scl_man_1row_q [0:MATRIX_NUM_ROW-1];
    reg [MATRIX_NUM_ROW-1:0] qw_scl_valid_q;
    wire qw_scl_filled;
    wire [EXP_VEC_WIDTH-1:0] qw_scl_exp_list;
    wire [MANT_VEC_WIDTH-1:0] qw_scl_man_list;

    wire qx_scl_man_fifo_wready, qx_scl_exp_fifo_wready;
    wire qx_scl_man_fifo_rready, qx_scl_exp_fifo_rready;
    wire qx_scl_fifo_wready, qx_scl_fifo_rready;
    wire qx_scl_fifo_push, qx_scl_fifo_pop;
    wire [FP_MANT_W-1:0] qx_scl_fifo_man_out;
    wire [FP_EXP_W -1:0] qx_scl_fifo_exp_out;
    reg [LOG_MATRIX_NUM_ROW-1:0] qx_fifo_pop_counter;

    wire [EXP_VEC_WIDTH -1:0] qo_scl_exp_1row_data_d;
    wire [MANT_VEC_WIDTH-1:0] qo_scl_man_1row_data_d;
    reg  [EXP_VEC_WIDTH -1:0] qo_scl_exp_1row_data_q;
    reg  [MANT_VEC_WIDTH-1:0] qo_scl_man_1row_data_q;
    reg  qo_scl_result_valid;

    reg [LOG_MATRIX_NUM_ROW-1:0] qo_row_counter;

    reg [1:0] state_scale_gen;
    localparam SCALE_GEN_IDLE = 2'd0;
    localparam SCALE_GEN_FILL_QW = 2'd1;
    localparam SCALE_GEN_FILL_QO = 2'd2;
    localparam SCALE_GEN_DONE = 2'd3;
    assign busy_o = (state_scale_gen == SCALE_GEN_IDLE)? 1'b0:1'b1;

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            state_scale_gen <= SCALE_GEN_IDLE;
        end
        else if(clear_i) begin
            state_scale_gen <= SCALE_GEN_IDLE;
        end
        else begin
            case(state_scale_gen)
                SCALE_GEN_IDLE: begin
                    if(qw_scl_filled)
                        state_scale_gen <= SCALE_GEN_FILL_QO;
                end
                SCALE_GEN_FILL_QO: begin
                    if((qx_fifo_pop_counter == (MATRIX_NUM_ROW-1)) && qx_scl_fifo_pop && qx_scl_fifo_rready)
                        state_scale_gen <= SCALE_GEN_DONE;
                end
                SCALE_GEN_DONE: begin
                    state_scale_gen <= SCALE_GEN_IDLE;
                end
            endcase
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            qx_fifo_pop_counter <= 0;
        end
        else if(clear_i || state_scale_gen == SCALE_GEN_IDLE) begin
            qx_fifo_pop_counter <= 0;
        end
        else if(qx_scl_fifo_pop && qx_scl_fifo_rready) begin
            qx_fifo_pop_counter <= qx_fifo_pop_counter + 1;
        end
    end

    // qw_stationary
    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            for (j = 0; j < MATRIX_NUM_ROW; j = j + 1) begin
                qw_scl_exp_1row_q[j] <= 0;
                qw_scl_man_1row_q[j] <= 0;
                qw_scl_valid_q[j]    <= 1'b0;
            end
        end
        else if(clear_i || state_scale_gen == SCALE_GEN_DONE) begin
            for (j = 0; j < MATRIX_NUM_ROW; j = j + 1) begin
                qw_scl_exp_1row_q[j] <= 0;
                qw_scl_man_1row_q[j] <= 0;
                qw_scl_valid_q[j]    <= 1'b0;
            end
        end
        else if(qw_scl_valid_i && qw_scl_ready_o) begin
            qw_scl_exp_1row_q[qw_scl_row_index_i] <= qw_scl_exp_1elm_i;
            qw_scl_man_1row_q[qw_scl_row_index_i] <= qw_scl_man_1elm_i;
            qw_scl_valid_q[qw_scl_row_index_i]    <= 1'b1;
        end
    end

    assign qw_scl_filled = &qw_scl_valid_q;
    assign qw_scl_ready_o = ~qw_scl_filled;

    generate
        for (i = 0; i < MATRIX_NUM_ROW; i = i + 1) begin
            assign qw_scl_exp_list[(i+1)*FP_EXP_W-1 -: FP_EXP_W] = qw_scl_exp_1row_q[i];
            assign qw_scl_man_list[(i+1)*FP_MANT_W-1 -: FP_MANT_W] = qw_scl_man_1row_q[i];
        end
    endgenerate


    ERVP_SMALL_FIFO #(
        .BW_DATA (FP_MANT_W),
        .DEPTH (MATRIX_NUM_ROW)
    ) i_fifo_qx_scl_mant(
        .clk        (clk            ),
        .rstnn      (rstnn          ),
        .enable     (1'b1           ),
        .clear      (clear_i        ),
        .wready     (qx_scl_man_fifo_wready ),
        .wfull      (               ),
        .wrequest   (qx_scl_fifo_push),
        .wdata      (qx_scl_man_1elm_i),
        .rready     (qx_scl_man_fifo_rready),
        .rempty     (               ),
        .rrequest   (qx_scl_fifo_pop),
        .rdata      (qx_scl_fifo_man_out)
    );

    ERVP_SMALL_FIFO #(
        .BW_DATA (FP_EXP_W),
        .DEPTH (MATRIX_NUM_ROW)
    ) i_fifo_qx_scl_exp(
        .clk        (clk            ),
        .rstnn      (rstnn          ),
        .enable     (1'b1           ),
        .clear      (clear_i        ),
        .wready     (qx_scl_exp_fifo_wready ),
        .wfull      (               ),
        .wrequest   (qx_scl_fifo_push),
        .wdata      (qx_scl_exp_1elm_i),
        .rready     (qx_scl_exp_fifo_rready),
        .rempty     (               ),
        .rrequest   (qx_scl_fifo_pop),
        .rdata      (qx_scl_fifo_exp_out)
    );


    assign qx_scl_fifo_push = qx_scl_valid_i & qx_scl_ready_o;
    assign qx_scl_fifo_pop  = (state_scale_gen == SCALE_GEN_FILL_QO) && qx_scl_fifo_rready && (qx_fifo_pop_counter < MATRIX_NUM_ROW);
    // implemnted with state machine
    assign qx_scl_fifo_rready = qx_scl_man_fifo_rready & qx_scl_exp_fifo_rready;
    assign qx_scl_fifo_wready = qx_scl_man_fifo_wready & qx_scl_exp_fifo_wready;
    assign qx_scl_ready_o = qx_scl_fifo_wready;

    // assign qw_scl_ready_o = 1'b1;

    scale_calculator_1row #(
        .FP_EXP_W   (FP_EXP_W),
        .FP_MANT_W  (FP_MANT_W),
        .MATRIX_NUM_COL (MATRIX_NUM_COL)
    ) i_scale_cal_1row(
        .qx_scl_exp_1elm_i(qx_scl_fifo_exp_out),
        .qx_scl_man_1elm_i(qx_scl_fifo_man_out),
        .qw_scl_exp_list_i(qw_scl_exp_list),
        .qw_scl_man_list_i(qw_scl_man_list),
        .qo_scl_exp_1row_data_o(qo_scl_exp_1row_data_d),
        .qo_scl_man_1row_data_o(qo_scl_man_1row_data_d)
    );

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            qo_scl_result_valid <= 1'b0;
        end
        else begin
            qo_scl_result_valid <= qx_scl_fifo_pop & qx_scl_fifo_rready;
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            qo_scl_exp_1row_data_q <= 0;
            qo_scl_man_1row_data_q <= 0;
        end
        else if(clear_i) begin
            qo_scl_exp_1row_data_q <= 0;
            qo_scl_man_1row_data_q <= 0;
        end
        else if(qx_scl_fifo_pop & qx_scl_fifo_rready) begin
            qo_scl_exp_1row_data_q <= qo_scl_exp_1row_data_d;
            qo_scl_man_1row_data_q <= qo_scl_man_1row_data_d;
        end
    end

    always @(posedge clk, negedge rstnn) begin
        if(!rstnn) begin
            qo_row_counter <= 0;
        end
        else if(clear_i || state_scale_gen == SCALE_GEN_IDLE) begin
            qo_row_counter <= 0;
        end
        else if(qo_scl_result_valid) begin
            qo_row_counter <= qo_row_counter + 1;
        end
    end

    wire [(EXP_VEC_WIDTH + MANT_VEC_WIDTH)-1:0] qo_scale_rdata;
    wire [(EXP_VEC_WIDTH + MANT_VEC_WIDTH)-1:0] qo_scale_wdata;
    wire qo_scl_fifo_wready;
    assign {qo_scl_exp_1row_rdata_o, qo_scl_man_1row_rdata_o} = qo_scale_rdata;
    assign qo_scale_wdata = {qo_scl_exp_1row_data_q,qo_scl_man_1row_data_q};

    // always @(posedge clk, negedge rstnn) begin
    //     if(!rstnn) begin
    //         qo_scl_rvalid_o <= 1'b0;
    //     end
    //     else begin
    //         qo_scl_rvalid_o <= qo_scl_renable_i;
    //     end
    // end

    ERVP_SMALL_FIFO #(
        .BW_DATA (EXP_VEC_WIDTH + MANT_VEC_WIDTH),
        .DEPTH (MATRIX_NUM_ROW)
    ) i_fifo_qo_scl (
        .clk        (clk            ),
        .rstnn      (rstnn          ),
        .enable     (1'b1           ),
        .clear      (clear_i        ),
        .wready     (qo_scl_fifo_wready),
        .wfull      (               ),
        .wrequest   (qo_scl_result_valid),
        .wdata      (qo_scale_wdata ),
        .rready     (qo_scl_rready_o),
        .rempty     (               ),
        .rrequest   (qo_scl_rreq_i),
        .rdata      (qo_scale_rdata )
    );
    // ERVP_MEMORY_CELL_1R1W #(
    //     .DEPTH(MATRIX_NUM_ROW),
    //     .WIDTH((EXP_VEC_WIDTH + MANT_VEC_WIDTH)),
    //     .BW_INDEX(LOG_MATRIX_NUM_ROW),
    //     .USE_SINGLE_INDEX(0),
    //     .USE_SUBWORD_ENABLE(0),
    //     .BW_SUBWORD(8)
    // ) i_cell (
    //     .clk(clk),
    //     .rstnn(rstnn),
    //     .index(),
    //     .windex(qo_row_counter), // buffered counter implementation!! (row_index_q)
    //     .wenable(qo_scl_result_valid),
    //     .wpermit(1'b1),
    //     .wdata(qo_scale_wdata),
    //     .rindex(qo_scl_row_index_i),
    //     .rdata_asynch(),
    //     .renable(qo_scl_renable_i),
    //     .rdata_synch(qo_scale_rdata)
    // );

endmodule