module wsram2dq_load(
    clk,
    rstnn,
    enable_i,
    start_i,
    busy_o,
    wgrant_i,
    read_last_o,
    ram_ren_o,
    ram_rindex_o,
    ram_rdata_i,
    ram_rvalid_i,
    dq_1row_data_o,
    dq_1row_valid_o,
    dq_1row_ready_i,
    dq_row_index_o
);

    parameter RAM_INDEX_BASE = 0;
    parameter RAM_DATA_1ELM_WIDTH   = 32;
    parameter MATRIX_NUM_COL   = 16;
    parameter MATRIX_NUM_ROW   = 16;
    parameter RAM_INDEX_WIDTH  = 16;

    localparam RAM_DATA_WIDTH   = MATRIX_NUM_COL * RAM_DATA_1ELM_WIDTH;
    localparam LOG_MATRIX_NUM_ROW = $clog2(MATRIX_NUM_ROW);
    localparam RAM_READ_INFO_WIDTH = RAM_DATA_WIDTH + LOG_MATRIX_NUM_ROW;

    input  wire                             clk;
    input  wire                             rstnn;
    input  wire                             enable_i;
    input  wire                             start_i;
    output wire                             busy_o;
    input  wire                             wgrant_i;
    output wire                             read_last_o;
    output wire                             ram_ren_o;
    output wire [RAM_INDEX_WIDTH-1:0]       ram_rindex_o;
    input  wire [RAM_DATA_WIDTH-1:0]        ram_rdata_i;
    input  wire                             ram_rvalid_i;
    output wire [RAM_DATA_WIDTH-1:0]        dq_1row_data_o;
    output wire                             dq_1row_valid_o;
    input  wire                             dq_1row_ready_i;
    output wire [LOG_MATRIX_NUM_ROW-1:0]    dq_row_index_o;

    // Internal signals

    wire [RAM_READ_INFO_WIDTH-1:0] i_fifo_wdata;
    wire i_fifo_rempty;
    wire i_fifo_rrequest;
    wire i_fifo_rready;
    wire [RAM_READ_INFO_WIDTH-1:0] i_fifo_rdata;
    wire i_fifo_wready;
    wire i_fifo_wfull;
    wire i_fifo_wrequest;
    
    wire [RAM_DATA_WIDTH-1:0] dq_1row_data_buffer_out;
    wire [LOG_MATRIX_NUM_ROW-1:0] dq_row_index_buffer_out;
    
    // Counter signals
    wire [MATRIX_NUM_ROW-1:0] cnt_onehot;
    wire cnt_first;
    wire cnt_last;

    reg [LOG_MATRIX_NUM_ROW-1:0] read_row_index;
    reg [1:0] STATUS;
    localparam S_IDLE = 2'b00, S_STREAM = 2'b01, S_WAIT_EXT = 2'b10;

    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            STATUS <= S_IDLE;
        end
        else begin
            case(STATUS)
                S_IDLE: begin
                    if (start_i) begin
                        STATUS <= S_STREAM;
                    end
                end
                S_STREAM: begin
                    if (read_last_o) begin
                        STATUS <= S_WAIT_EXT;
                    end
                end
                S_WAIT_EXT: begin
                    if (i_fifo_rempty) begin
                        STATUS <= S_IDLE;
                    end
                end
            endcase
        end
    end
    
    assign busy_o = (STATUS != S_IDLE);
    assign read_last_o = (STATUS == S_STREAM) && (read_row_index == MATRIX_NUM_ROW-1) && ram_ren_o;

    // RAM read control
    assign ram_ren_o = (STATUS == S_STREAM) & wgrant_i & i_fifo_wready;
    assign ram_rindex_o = RAM_INDEX_BASE + read_row_index;
    
    // RAM read index counter
    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            read_row_index <= 0;
        end
        else if (start_i) begin
            read_row_index <= 0;
        end
        else if (ram_ren_o) begin
            if (read_row_index < MATRIX_NUM_ROW-1)
                read_row_index <= read_row_index + 1;
        end
    end
    
    // Row index for FIFO (delayed to match data)
    reg [LOG_MATRIX_NUM_ROW-1:0] read_row_index_q;
    always @(posedge clk, negedge rstnn) begin
        if (!rstnn) begin
            read_row_index_q <= 0;
        end
        else if (ram_ren_o) begin
            read_row_index_q <= read_row_index;
        end
    end
    // FIFO write interface
    assign i_fifo_wdata = {read_row_index_q, ram_rdata_i};
    assign i_fifo_wrequest = ram_rvalid_i & i_fifo_wready;
    
    // FIFO read interface
    assign {dq_row_index_buffer_out, dq_1row_data_buffer_out} = i_fifo_rdata;
    assign i_fifo_rrequest = i_fifo_rready & dq_1row_ready_i;
    
    assign dq_1row_data_o = dq_1row_data_buffer_out;
    assign dq_row_index_o = dq_row_index_buffer_out;
    assign dq_1row_valid_o = i_fifo_rready;

    
    // FIFO for buffering read data - 32-bit width
    ERVP_SMALL_FIFO #(
        .BW_DATA(RAM_READ_INFO_WIDTH),  // 512 + 4 = 516 bits
        .DEPTH(MATRIX_NUM_ROW)
    ) i_fifo(
        .clk        (clk),
        .rstnn      (rstnn),
        .enable     (1'b1),
        .clear      (start_i),
        .wready     (i_fifo_wready),
        .wfull      (i_fifo_wfull),
        .wrequest   (i_fifo_wrequest),
        .wdata      (i_fifo_wdata),
        .rready     (i_fifo_rready),
        .rempty     (i_fifo_rempty),
        .rrequest   (i_fifo_rrequest),
        .rdata      (i_fifo_rdata)
    );

endmodule