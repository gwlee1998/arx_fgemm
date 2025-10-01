module SIMPLE_DUAL_PORT_BRAM(
    clk,
    rstnn,
    windex,
    wenable,
    wpermit,
    wdata,
    rindex,
    renable,
    rdata_synch
);


    parameter BW_INDEX = 16;
    parameter WIDTH = 32;
    parameter BW_SUBWORD = 8;
    parameter USE_SINGLE_INDEX = 0;
    parameter USE_SUBWORD_ENABLE = 1;
    parameter ADDR_WIDTH = BW_INDEX;
    parameter DEPTH = 1 << ADDR_WIDTH;
    parameter DATA_WIDTH = WIDTH;
    parameter NUM_COL = DATA_WIDTH / BW_SUBWORD;

    input clk;
    input rstnn;
    input [BW_INDEX-1:0] windex;
    input wenable;
    input [NUM_COL-1:0] wpermit;
    input [DATA_WIDTH-1:0] wdata;
    input [BW_INDEX-1:0] rindex;
    input renable;
    output [DATA_WIDTH-1:0] rdata_synch;
    
    bytewrite_tdp_ram_rf #(
        .NUM_COL(NUM_COL),
        .COL_WIDTH(BW_SUBWORD),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) ram_block (
        .clkA(clk),
        .enaA(wenable),
        .weA(wpermit),
        .addrA(windex),
        .dinA(wdata),
        .doutA(), // No output for write port
        .clkB(clk),
        .enaB(renable),
        .weB({NUM_COL{1'b0}}), // No write enable for read port
        .addrB(rindex),
        .dinB({DATA_WIDTH{1'b0}}), // No input for read port
        .doutB(rdata_synch)
    );
endmodule