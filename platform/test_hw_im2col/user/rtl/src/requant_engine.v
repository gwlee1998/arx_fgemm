
`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_include.vh"
`include "platform_info.vh"

module REQUANT_ENGINE(
    clk,
    rstnn,

    // AXI AW Channel
    rxawid,
    rxawaddr,
    rxawlen,
    rxawsize,
    rxawburst,
    rxawvalid,
    rxawready,

    // AXI W Channel
    rxwid,
    rxwdata,
    rxwstrb,
    rxwlast,
    rxwvalid,
    rxwready,

    // AXI B Channel
    rxbid,
    rxbresp,
    rxbvalid,
    rxbready,

    // AXI AR Channel
    rxarid,
    rxaraddr,
    rxarlen,
    rxarsize,
    rxarburst,
    rxarvalid,
    rxarready,

    // AXI R Channel
    rxrid,
    rxrdata,
    rxrresp,
    rxrlast,
    rxrvalid,
    rxrready
);

// User request summary:
// - Preserve cell_*_list signals for all 3 cells
// - Use separate assignments to connect sscell lists to individual cell signals
// - Continue using only wenable_list and renable_list for valid control

///////////////////////
// parameters       //
///////////////////////
parameter SIZE_OF_MEMORYMAP = 68*1024; // 68KiB total AXI map
parameter BW_ADDR         = 32;
parameter BW_DATA         = 32;
parameter BW_AXI_TID      = `REQUIRED_BW_OF_SLAVE_TID;

localparam CELL_SIZE      = 32*1024;   // 32KiB
localparam CELL_WIDTH     = BW_DATA;
`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"
localparam BW_BYTE_WEN    = `NUM_BYTE(CELL_WIDTH);
localparam CELL_DEPTH     = `DIVIDERU(CELL_SIZE, BW_BYTE_WEN);
localparam BW_CELL_INDEX  = REQUIRED_BITWIDTH_INDEX(CELL_DEPTH);

// small reg file
localparam REG_DEPTH      = 32;
localparam BW_REG_INDEX   = $clog2(REG_DEPTH);

genvar i;
integer j;

///////////////////////
// port definitions //
///////////////////////
input  wire                 clk;
input  wire                 rstnn;

// AXI AW Channel
input  wire [BW_AXI_TID-1:0] rxawid;
input  wire [BW_ADDR-1:0]    rxawaddr;
input  wire [`BW_AXI_ALEN-1:0] rxawlen;
input  wire [`BW_AXI_ASIZE-1:0] rxawsize;
input  wire [`BW_AXI_ABURST-1:0] rxawburst;
input  wire                 rxawvalid;
output wire                 rxawready;

// AXI W Channel
input  wire [BW_AXI_TID-1:0] rxwid;
input  wire [BW_DATA-1:0]    rxwdata;
input  wire [`BW_AXI_WSTRB(BW_DATA)-1:0] rxwstrb;
input  wire                 rxwlast;
input  wire                 rxwvalid;
output wire                 rxwready;

// AXI B Channel
output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire                 rxbvalid;
input  wire                 rxbready;

// AXI AR Channel
input  wire [BW_AXI_TID-1:0] rxarid;
input  wire [BW_ADDR-1:0]    rxaraddr;
input  wire [`BW_AXI_ALEN-1:0] rxarlen;
input  wire [`BW_AXI_ASIZE-1:0] rxarsize;
input  wire [`BW_AXI_ABURST-1:0] rxarburst;
input  wire                 rxarvalid;
output wire                 rxarready;

// AXI R Channel
output wire [BW_AXI_TID-1:0] rxrid;
output wire [BW_DATA-1:0]    rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output wire                 rxrlast;
output wire                 rxrvalid;
input  wire                 rxrready;

////////////////////////////
// Internal signal lists    
////////////////////////////
wire [BW_CELL_INDEX*3-1:0]  cell_index_list;
wire [3-1:0]                cell_wenable_list;
wire [BW_BYTE_WEN*3-1:0]    cell_wenable_byte_list;
wire [BW_DATA*3-1:0]        cell_wdata_list;
wire [3-1:0]                cell_renable_list;
wire [BW_DATA*3-1:0]        cell_rdata_list;
// cell-specific signals
wire [BW_CELL_INDEX-1:0]    cell_index      [0:2];
wire [2:0]                  cell_wenable;
wire [BW_DATA-1:0]          cell_wdata      [0:2];
wire [BW_BYTE_WEN-1:0]      cell_wbe        [0:2];
wire [2:0]                  cell_renable;
wire [BW_DATA-1:0]          cell_rdata      [0:2];

// engine <-> buffers
wire [BW_CELL_INDEX-1:0] engine_rindex;
wire                     engine_ren;
wire [BW_DATA-1:0]       engine_rdata;
wire [BW_CELL_INDEX-1:0] engine_windex;
wire                     engine_wen;
wire [BW_BYTE_WEN-1:0]   engine_wbe;
wire [BW_DATA-1:0]       engine_wdata;

// 필요한 선언 추가
wire end_flag_wire;


////////////////
// Assign lists to per-cell signals
////////////////
generate
for(i=0; i<3; i=i+1)
begin : generate_cell_signals
  assign cell_index[i] = cell_index_list[BW_CELL_INDEX*(i+1)-1 -:BW_CELL_INDEX];
  assign cell_wenable[i] = cell_wenable_list[i];
  assign cell_wbe[i] = cell_wenable_byte_list[BW_BYTE_WEN*(i+1)-1 -:BW_BYTE_WEN];
  assign cell_wdata[i] = cell_wdata_list[BW_DATA*(i+1)-1 -:BW_DATA];
  assign cell_renable[i] = cell_renable_list[i];
  assign cell_rdata_list[BW_DATA*(i+1)-1 -:BW_DATA] = cell_rdata[i];
end
endgenerate

////////////////
// AXI Controller
////////////////
ERVP_SPSRAM_CONTROLLER_AXI #(
    .BW_ADDR   (BW_ADDR),
    .BW_DATA   (BW_DATA),
    .BW_AXI_TID(BW_AXI_TID),
    
    `ifdef I_REQUANT_ENGINE_SLAVE_BASEADDR
    .BASEADDR  (`I_REQUANT_ENGINE_SLAVE_BASEADDR),
    `else
    .BASEADDR  (32'h 0000_0000),
    `endif
    .CELL_SIZE (CELL_SIZE),
    .CELL_WIDTH(CELL_WIDTH),
    .NUM_CELL  (3)
) i_controller (
    .clk                    (clk),
    .rstnn                  (rstnn),
    .enable                (1'b 1),
    // AXI ports
    .rxawid                 (rxawid),
    .rxawaddr               (rxawaddr),
    .rxawlen                (rxawlen),
    .rxawsize               (rxawsize),
    .rxawburst              (rxawburst),
    .rxawvalid              (rxawvalid),
    .rxawready              (rxawready),
    .rxwid                  (rxwid),
    .rxwdata                (rxwdata),
    .rxwstrb                (rxwstrb),
    .rxwlast                (rxwlast),
    .rxwvalid               (rxwvalid),
    .rxwready               (rxwready),
    .rxbid                  (rxbid),
    .rxbresp                (rxbresp),
    .rxbvalid               (rxbvalid),
    .rxbready               (rxbready),
    .rxarid                 (rxarid),
    .rxaraddr               (rxaraddr),
    .rxarlen                (rxarlen),
    .rxarsize               (rxarsize),
    .rxarburst              (rxarburst),
    .rxarvalid              (rxarvalid),
    .rxarready              (rxarready),
    .rxrid                  (rxrid),
    .rxrdata                (rxrdata),
    .rxrresp                (rxrresp),
    .rxrlast                (rxrlast),
    .rxrvalid               (rxrvalid),
    .rxrready               (rxrready),

    // cell signals: pass the full lists
    .sscell_index_list      (cell_index_list),
    .sscell_wenable_list    (cell_wenable_list),
    .sscell_wenable_byte_list(cell_wenable_byte_list),
    .sscell_wdata_list      (cell_wdata_list),
    .sscell_renable_list    (cell_renable_list),
    .sscell_rdata_list      (cell_rdata_list),
    .sscell_stall_list      (3'b0)
);

///////////////////////////
// Memory cell #0: input_buffer
///////////////////////////
SIMPLE_DUAL_PORT_BRAM #(
    .DEPTH           (CELL_DEPTH),
    .WIDTH           (CELL_WIDTH),
    .BW_INDEX        (BW_CELL_INDEX),
    .USE_SINGLE_INDEX(0),
    .USE_SUBWORD_ENABLE(1),
    .BW_SUBWORD      (8)
) input_buffer (
    .clk                 (clk),
    .rstnn               (rstnn),
    // A: AXI write
    .windex              (cell_index[0]),
    .wenable             (cell_wenable[0]),
    .wpermit             (cell_wbe[0]),
    .wdata               (cell_wdata[0]),
    // B: engine read
    .rindex              (engine_rindex),
    .renable             (engine_ren),
    .rdata_synch         (engine_rdata)
);

///////////////////////////
// Memory cell #1: output_buffer
///////////////////////////
SIMPLE_DUAL_PORT_BRAM #(
    .DEPTH           (CELL_DEPTH),
    .WIDTH           (CELL_WIDTH),
    .BW_INDEX        (BW_CELL_INDEX),
    .USE_SINGLE_INDEX(0),
    .USE_SUBWORD_ENABLE(1),
    .BW_SUBWORD      (8)
) output_buffer (
    .clk                 (clk),
    .rstnn               (rstnn),
    // A: engine write
    .windex              (engine_windex),
    .wenable             (engine_wen),
    .wpermit             (engine_wbe),
    .wdata               (engine_wdata),
    // B: AXI read
    .rindex              (cell_index[1]),
    .renable             (cell_renable[1]),
    .rdata_synch         (cell_rdata[1])
);

//////////////////////////////
// Register file
//////////////////////////////
reg [CELL_WIDTH-1:0] regfile [0:REG_DEPTH-1];
wire [BW_REG_INDEX-1:0] reg_index = cell_index[2][BW_REG_INDEX-1:0];


always @(posedge clk, negedge rstnn) begin
    if (!rstnn) begin
        for(j=0; j<REG_DEPTH; j=j+1) begin
            regfile[j] <= {CELL_WIDTH{1'b0}};
        end
    end        
    
    else if (cell_wenable[2]) begin
        for (j=0; j<BW_BYTE_WEN; j=j+1) begin                                      // wbe = byte enable로 어떤 byte에 쓸 건지 정하는 변수(mask 역할) 
            if (cell_wbe[2][j])
                regfile[reg_index][j*8 +: 8] <= cell_wdata[2][j*8 +: 8];
        end

    end
    else 
        regfile[13] <= { {CELL_WIDTH-1{1'b0}}, end_flag_wire };
end
reg [32-1:0] cell_rdata_q;

always@(posedge clk) begin
    if(!rstnn) begin
        cell_rdata_q <= 0;
    end
    else if(cell_renable[2]) begin
        cell_rdata_q <= regfile[reg_index];
    end
end
// assign cell_rdata[2] = regfile[reg_index];

// assign cell_rdata[2] = cell_renable[2] ? regfile[reg_index] : cell_rdata_q;    // register 읽기
assign cell_rdata[2] = cell_rdata_q;    // register 읽기

////////////////
// user_ip instantiation
////////////////

requantizer i_requantizer (
    .clk                (clk),
    .rstnn              (rstnn),

    // read from input_buffer
    .ibuff_rindex       (engine_rindex),
    .ibuff_renable      (engine_ren),
    .ibuff_rdata        (engine_rdata),

    // write to output_buffer
    .obuff_index        (engine_windex),
    .obuff_enable       (engine_wen),
    .obuff_wbe          (engine_wbe),
    .obuff_wdata        (engine_wdata),
    // control & parameter ports
    .input_channel      (regfile[0]),
    .output_channel     (regfile[1]),
    .out_h              (regfile[2]),
    .out_w              (regfile[3]),
    .kernel_w           (regfile[4]),
    .kernel_h           (regfile[5]),
    .input_zeropoint    (regfile[6]),
    .layer_zeropoint    (regfile[7]),
    .kernel_zeropoint   (regfile[8]),
    .M0_int32           (regfile[9]),
    .right_shift        (regfile[10]),
    .biases_int32       (regfile[11]),
    .start              (regfile[12]),
    .channel_idx        (regfile[14]),
    .end_flag           (end_flag_wire)           
);

endmodule
