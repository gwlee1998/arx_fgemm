module quant2wsram_store(
    clk,
    rstnn,
    enable_i,
    init_i,
    quant_1row_data_i,
    quant_1row_valid_i,
    quant_1row_ready_o,
    quant_row_index_i,
    wgrant_i,
    has_entry_o,
    ram_wen_o,
    ram_windex_o,
    ram_wdata_o,
    ram_wlast_o
);

    parameter RAM_INDEX_BASE = 0;
    parameter QUANT_DATA_1ELM_WIDTH = 8;
    parameter RAM_DATA_1ELM_WIDTH   = 32;
    parameter MATRIX_NUM_COL   = 16;
    parameter MATRIX_NUM_ROW   = 16;
    parameter RAM_INDEX_WIDTH  = 16;

    localparam QUANT_DATA_1ROW_WIDTH = MATRIX_NUM_COL * QUANT_DATA_1ELM_WIDTH;
    localparam RAM_DATA_WIDTH   = MATRIX_NUM_COL * RAM_DATA_1ELM_WIDTH;
    localparam LOG_MATRIX_NUM_ROW = $clog2(MATRIX_NUM_ROW);
    localparam SIGN_BIT_WIDTH = RAM_DATA_1ELM_WIDTH - QUANT_DATA_1ELM_WIDTH;
    localparam QUANT_WRITE_INFO_WIDTH = QUANT_DATA_1ROW_WIDTH + LOG_MATRIX_NUM_ROW;
    
    input  wire                             clk;
    input  wire                             rstnn;
    input  wire                             enable_i;
    input  wire                             init_i;
    input  wire [QUANT_DATA_1ROW_WIDTH-1:0] quant_1row_data_i;
    input  wire                             quant_1row_valid_i;
    output wire                             quant_1row_ready_o;
    input  wire [LOG_MATRIX_NUM_ROW-1:0]    quant_row_index_i;
    input  wire                             wgrant_i;
    output wire                             has_entry_o;
    output wire                             ram_wen_o;
    output wire [RAM_INDEX_WIDTH-1:0]       ram_windex_o;
    output wire [RAM_DATA_WIDTH-1:0]        ram_wdata_o;
    output wire                             ram_wlast_o;

    genvar i;
    wire [QUANT_DATA_1ELM_WIDTH-1:0] quantized_data   [0:MATRIX_NUM_COL-1];
    wire [RAM_DATA_1ELM_WIDTH-1:0]   extended_data    [0:MATRIX_NUM_COL-1];

    wire [MATRIX_NUM_ROW-1:0] cnt_onehot;
    wire cnt_first;

    wire i_fifo_wrequest;
    wire i_fifo_wfull;
    wire i_fifo_wready;
    wire [QUANT_WRITE_INFO_WIDTH-1:0] i_fifo_wdata;
    wire i_fifo_rempty;
    wire i_fifo_rrequest;
    wire i_fifo_rready;
    wire [QUANT_WRITE_INFO_WIDTH-1:0] i_fifo_rdata;


    wire [QUANT_DATA_1ROW_WIDTH-1:0] quant_1row_data_buffer_out;
    wire [LOG_MATRIX_NUM_ROW-1:0]    quant_row_index_buffer_out;

    assign i_fifo_wdata = {quant_row_index_i, quant_1row_data_i}; //from input to fifo
    assign {quant_row_index_buffer_out, quant_1row_data_buffer_out} = i_fifo_rdata; //from fifo to output
    assign i_fifo_wrequest = quant_1row_valid_i & i_fifo_wready;
    assign i_fifo_rrequest = i_fifo_rready & wgrant_i & enable_i;
    assign has_entry_o = i_fifo_rready;
    // assign 

    // parse quant data
    generate
        if(RAM_DATA_1ELM_WIDTH > QUANT_DATA_1ELM_WIDTH) begin
            for (i = 0; i < MATRIX_NUM_COL; i = i + 1) begin : gen_sign_extend
                wire sign_bit;
                assign quantized_data[i] = quant_1row_data_buffer_out[(i+1)*QUANT_DATA_1ELM_WIDTH-1 -: QUANT_DATA_1ELM_WIDTH];
                assign sign_bit = quantized_data[i][QUANT_DATA_1ELM_WIDTH-1];
                assign extended_data[i]  = {{(SIGN_BIT_WIDTH){sign_bit}}, quantized_data[i]};
                assign ram_wdata_o[(i+1)*RAM_DATA_1ELM_WIDTH-1 -: RAM_DATA_1ELM_WIDTH] = extended_data[i];
            end
        end
        else begin
            for (i = 0; i < MATRIX_NUM_COL; i = i + 1) begin : gen_wo_sign_extend
                assign quantized_data[i] = quant_1row_data_buffer_out[(i+1)*QUANT_DATA_1ELM_WIDTH-1 -: QUANT_DATA_1ELM_WIDTH];
                assign extended_data[i]  = quantized_data[i][RAM_DATA_1ELM_WIDTH-1:0];
                assign ram_wdata_o[(i+1)*RAM_DATA_1ELM_WIDTH-1 -: RAM_DATA_1ELM_WIDTH] = extended_data[i];
            end
        end
    endgenerate
    assign ram_windex_o = RAM_INDEX_BASE + quant_row_index_buffer_out;
    assign ram_wen_o = i_fifo_rready & wgrant_i & enable_i;
    assign quant_1row_ready_o = i_fifo_wready;

    ERVP_COUNTER_WITH_ONEHOT_ENCODING #(
        .COUNT_LENGTH(MATRIX_NUM_ROW)
    ) i_counter (
        .clk            (clk),
        .rstnn          (rstnn),
        .enable         (enable_i),
        .init           (init_i),
        .count          (ram_wen_o),
        .value          (cnt_onehot),
        .is_first_count (cnt_first),
        .is_last_count  (ram_wlast_o)
    );

    ERVP_SMALL_FIFO #(
        .BW_DATA(QUANT_WRITE_INFO_WIDTH),
        .DEPTH(4)
    ) i_fifo(
        .clk        (clk        ),
        .rstnn      (rstnn      ),
        .enable     (1'b1       ),
        .clear      (init_i     ),
        .wready     (i_fifo_wready ),
        .wfull      (i_fifo_wfull  ),
        .wrequest   (i_fifo_wrequest),
        .wdata      (i_fifo_wdata  ),
        .rready     (i_fifo_rready ),
        .rempty     (i_fifo_rempty  ),
        .rrequest   (i_fifo_rrequest),
        .rdata      (i_fifo_rdata  )
    );


endmodule