
`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_include.vh"
`include "platform_info.vh"

/*
    memory map:
    0x0000_0000 - 0x0000_3FFF: cell 0 (input buffer)
    0x0000_4000 - 0x0000_FFFF: cell 0 not used
    0x0001_0000 - 0x0001_FFFF: cell 1 (output buffer)
    0x0002_0000 - 0x0002_00xx: cell 2 (register file) determined by REG_DEPTH
*/
module IM2COL_ENGINE(
    clk,
    rstnn,

    // AXI AW Channel
    rxawid,         // Transaction ID,    여러 동시 트랜잭션을 구분하기 위한 식별자 ,    슬레이브가 응답(B 채널)할 때 이 ID를 되돌려 줌(그러면 마스터는 “아, ID = N번 요청이 완료됐구나” 하고 알 수 있죠.)
    rxawaddr,       // Write 대상의 시작 주소
    rxawlen,        // 버스트 길이(beat 수),   ‘0’이면 1 비트(beat), ‘n’이면 n+1 비트를 전송
    rxawsize,       // 각 beat의 크기(log₂(bytes) 단위),   예: 3이면 2³=8바이트(64비트) 전송
    rxawburst,      // 버스트 유형 지정,    2’b00 = FIXED (같은 주소 반복) , 2’b01 = INCR (주소를 SIZE만큼 증가)   2’b10 = WRAP (주소가 범위를 벗어나면 래핑)
    rxawvalid,      // Address/Control 정보가 유효할 때 ‘1’,, 마스터→슬레이브, 슬레이브가 이를 수용할 준비가 되면 rxawready=1
    rxawready,      // 슬레이브가 Address/Control을 받을 준비가 되었음을 표시,    이 두 신호(VALID + READY)가 동시에 ‘1’이 되는 주기에 Address를 캡처

    // AXI W Channel
    rxwid,          // Write Address 채널의 ID와 매칭되는 ID. <rxawid> 값과 동일해야 함
    rxwdata,        // 	쓰기할 실제 데이터 비트 열(beat). AXI burst 길이(rxawlen)만큼 전송
    rxwstrb,        // 	바이트 레벨 쓰기 마스크. 비트 하나가 1이면 해당 바이트를 쓰고, 0이면 무시 (Write STRoBe)
    rxwlast,        //  마지막 beat 표시. 버스트가 끝나는 beat에서만 ‘1’이 올라옴
    rxwvalid,       //  마스터가 rxwdata와 rxwstrb를 유효하게 드라이브 하고 있음을 표시
    rxwready,       // 	슬레이브가 W 채널 데이터를 받을 준비가 되었을 때 ‘1’. rxwvalid와 동시 ‘1’일 때 캡처

    // AXI B Channel (write response 채널)
    rxbid,          // 응답할 트랜잭션의 ID. 요청 시 받았던 rxawid/rxwid 값을 그대로 돌려줘야 함
    rxbresp,        // 응답 상태 코드 (OKAY=2’b00, EXOKAY=2’b01, SLVERR=2’b10, DECERR=2’b11)
    rxbvalid,       // 	슬레이브가 응답 유효(ID/RESP)이 준비됐음을 표시
    rxbready,       // 	마스터가 응답을 받을 준비가 됐을 때 ‘1’

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
//////////////////////
parameter SIZE_OF_MEMORYMAP = 132*1024;  // 132KB total AXI map
parameter BW_ADDR         = 32;
parameter BW_DATA         = 32;
parameter BW_AXI_TID      = `REQUIRED_BW_OF_SLAVE_TID;

localparam CELL_SIZE      = 65536;   // 64KiB
localparam CELL_SIZE_INPUT= 16384;  // 16KiB
localparam CELL_WIDTH     = BW_DATA;
`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"
localparam BW_BYTE_WEN    = `NUM_BYTE(CELL_WIDTH);
localparam CELL_DEPTH     = `DIVIDERU(CELL_SIZE, BW_BYTE_WEN);
localparam CELL_DEPTH_INPUT = `DIVIDERU(CELL_SIZE_INPUT, BW_BYTE_WEN);
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

// new end_flag_signal
wire end_flag;

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
    .BASEADDR  (`I_IM2COL_ENGINE_SLAVE_BASEADDR),
    .CELL_SIZE (CELL_SIZE),
    .CELL_WIDTH(CELL_WIDTH),
    .NUM_CELL  (3)
) i_controller (
    .clk                    (clk),
    .rstnn                  (rstnn),
    .enable                 (1'b1),

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
    .sscell_index_list      (cell_index_list),          // NUM_CELL개의 SPSRAM 셀 각각에 대해 write 또는 read할 주소 인덱스(index)를 담는 버스
    .sscell_wenable_list    (cell_wenable_list),        // cell 별 write enable
    .sscell_wenable_byte_list(cell_wenable_byte_list),  // byte-level write mask         //이 값들을 각 cell로 분배해서 assign 됨
    .sscell_wdata_list      (cell_wdata_list),          // 쓰기 데이터
    .sscell_renable_list    (cell_renable_list),        // read enable
    .sscell_rdata_list      (cell_rdata_list),          // 각 cell의 read 데이터 
    .sscell_stall_list      (3'b0)
);

///////////////////////////
// Memory cell #0: input_buffer
///////////////////////////
wire input_buffer_wenable = cell_wenable[0] && (cell_index[0] < $clog2(CELL_DEPTH_INPUT));

ERVP_MEMORY_CELL_1R1W #(
    .DEPTH           (CELL_DEPTH_INPUT),
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
ERVP_MEMORY_CELL_1R1W #(
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

reg [CELL_WIDTH-1:0] regfile_rdata_q;

always @(posedge clk, negedge rstnn) begin
    if (!rstnn) begin
        for(j=0; j<REG_DEPTH; j=j+1) begin
            regfile[j] <= {CELL_WIDTH{1'b0}};
        end
    end 
    else begin
		// End flag write
		if (end_flag) begin
            regfile[13] <= 32'h1;
        end
		// AXI write
		if (cell_wenable[2]) begin		// Write enable signal operation
			for (j=0; j<BW_BYTE_WEN; j=j+1) begin
				if (cell_wbe[2][j])
					regfile[reg_index][j*8 +: 8] <= cell_wdata[2][j*8 +: 8];
			end
		end
	end
end

always @(posedge clk, negedge rstnn) begin
    if (!rstnn) begin
        regfile_rdata_q <= {CELL_WIDTH{1'b0}};
    end
    else if (cell_renable[2]) begin		// Read enable signal operation
        regfile_rdata_q <= regfile[reg_index];
    end
end

assign cell_rdata[2] = regfile_rdata_q;


////////////////
// user_ip instantiation
////////////////

im2col_con i_im2col_con (
    .clk                (clk  ),
    .rstnn              (rstnn),

    // read from input_buffer
    .ibuff_rindex       (engine_rindex),
    .ibuff_renable      (engine_ren   ),
    .ibuff_rdata        (engine_rdata ),

    // write to output_buffer
    .obuff_index        (engine_windex),
    .obuff_enable       (engine_wen   ),
    .obuff_wbe          (engine_wbe	  ),
    .obuff_wdata        (engine_wdata ),

    // Read arguments and control signals from regfile, add ports for your design
    .C_in       		(regfile[0] ),
    .H_in         		(regfile[1] ),
    .W_in          		(regfile[2] ),
    .K_h       			(regfile[3] ),
    .K_w       			(regfile[4] ),
    .pad_h          	(regfile[5] ),
    .pad_w          	(regfile[6] ),
    .stride_h       	(regfile[7] ),
    .stride_w       	(regfile[8] ),
    .dilation_h     	(regfile[9] ),
    .dilation_w     	(regfile[10]),
    .input_zeropoint    (regfile[11]),
    .start         		(regfile[12]),
    .end_flag       	(end_flag	) 	// regfile[13]
);


endmodule
