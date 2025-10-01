module ram_tdp #(
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 32,
    parameter BYTE_WIDTH = 8,
    parameter RAM_DEPTH = 1 << ADDR_WIDTH
)(
    input clk,
    input rstn,
    input ren_a,
    input ren_b,
    input wen_a,
    input wen_b,
    input [(DATA_WIDTH/BYTE_WIDTH)-1:0] wbe_a,
    input [(DATA_WIDTH/BYTE_WIDTH)-1:0] wbe_b,
    input [DATA_WIDTH-1:0] wdata_a,
    input [DATA_WIDTH-1:0] wdata_b,
    input [ADDR_WIDTH-1:0] addr_a,
    input [ADDR_WIDTH-1:0] addr_b,
    output reg [DATA_WIDTH-1:0] rdata_a,
    output reg [DATA_WIDTH-1:0] rdata_b
);
// Core Memory
    bytewrite_tdp_ram_rf #(
        .NUM_COL(DATA_WIDTH/BYTE_WIDTH),
        .COL_WIDTH(BYTE_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) ram_block (
        .clkA(clk),
        .enaA(ren_a || wen_a),
        .weA(wen_a ? wbe_a : {(DATA_WIDTH/BYTE_WIDTH){1'b0}}),
        .addrA(addr_a),
        .dinA(wdata_a),
        .doutA(rdata_a),
        
        .clkB(clk),
        .enaB(ren_b || wen_b),
        .weB(wen_b ? wbe_b : {(DATA_WIDTH/BYTE_WIDTH){1'b0}}),
        .addrB(addr_b),
        .dinB(wdata_b),
        .doutB(rdata_b)
    ); 

endmodule