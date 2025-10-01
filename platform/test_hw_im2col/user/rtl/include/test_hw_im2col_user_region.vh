/*****************/
/* Custom Region */
/*****************/

// wire clk_system;
// wire clk_network;
// wire clk_core;
// wire clk_system_external;
// wire clk_system_debug;
// wire clk_local_access;
// wire clk_process_000;
// wire clk_dram_if;
// wire clk_dram_sys;
// wire clk_dram_ref;
// wire clk_noc;
// wire gclk_system;
// wire gclk_network;
// wire gclk_core;
// wire gclk_system_external;
// wire gclk_system_debug;
// wire gclk_local_access;
// wire gclk_process_000;
// wire gclk_noc;
// wire tick_1us;
// wire tick_62d5ms;
// wire tick_gpio;
// wire spi_common_sclk;
// wire spi_common_sdq0;
// wire global_rstnn;
// wire global_rstpp;
// wire [(6)-1:0] rstnn_seqeunce;
// wire [(6)-1:0] rstpp_seqeunce;
// wire rstnn_user;
// wire rstpp_user;
// wire i_IM2COL_ENGINE_clk;
// wire i_IM2COL_ENGINE_rstnn;
// wire i_IM2COL_ENGINE_rxawready;
// wire i_IM2COL_ENGINE_rxawvalid;
// wire [(32)-1:0] i_IM2COL_ENGINE_rxawaddr;
// wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_IM2COL_ENGINE_rxawid;
// wire [(8)-1:0] i_IM2COL_ENGINE_rxawlen;
// wire [(3)-1:0] i_IM2COL_ENGINE_rxawsize;
// wire [(2)-1:0] i_IM2COL_ENGINE_rxawburst;
// wire i_IM2COL_ENGINE_rxwready;
// wire i_IM2COL_ENGINE_rxwvalid;
// wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_IM2COL_ENGINE_rxwid;
// wire [(32)-1:0] i_IM2COL_ENGINE_rxwdata;
// wire [(32/8)-1:0] i_IM2COL_ENGINE_rxwstrb;
// wire i_IM2COL_ENGINE_rxwlast;
// wire i_IM2COL_ENGINE_rxbready;
// wire i_IM2COL_ENGINE_rxbvalid;
// wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_IM2COL_ENGINE_rxbid;
// wire [(2)-1:0] i_IM2COL_ENGINE_rxbresp;
// wire i_IM2COL_ENGINE_rxarready;
// wire i_IM2COL_ENGINE_rxarvalid;
// wire [(32)-1:0] i_IM2COL_ENGINE_rxaraddr;
// wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_IM2COL_ENGINE_rxarid;
// wire [(8)-1:0] i_IM2COL_ENGINE_rxarlen;
// wire [(3)-1:0] i_IM2COL_ENGINE_rxarsize;
// wire [(2)-1:0] i_IM2COL_ENGINE_rxarburst;
// wire i_IM2COL_ENGINE_rxrready;
// wire i_IM2COL_ENGINE_rxrvalid;
// wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_IM2COL_ENGINE_rxrid;
// wire [(32)-1:0] i_IM2COL_ENGINE_rxrdata;
// wire i_IM2COL_ENGINE_rxrlast;
// wire [(2)-1:0] i_IM2COL_ENGINE_rxrresp;

/* DO NOT MODIFY THE ABOVE */
/* MUST MODIFY THE BELOW   */


IM2COL_ENGINE
#(
	.SIZE_OF_MEMORYMAP((32'h 21000)),
	.BW_AXI_TID(`REQUIRED_BW_OF_SLAVE_TID),
	.BW_ADDR(32),
	.BW_DATA(32)
)
i_IM2COL_ENGINE
(
	.clk(i_IM2COL_ENGINE_clk),
	.rstnn(i_IM2COL_ENGINE_rstnn),
	.rxawready(i_IM2COL_ENGINE_rxawready),
	.rxawvalid(i_IM2COL_ENGINE_rxawvalid),
	.rxawaddr(i_IM2COL_ENGINE_rxawaddr),
	.rxawid(i_IM2COL_ENGINE_rxawid),
	.rxawlen(i_IM2COL_ENGINE_rxawlen),
	.rxawsize(i_IM2COL_ENGINE_rxawsize),
	.rxawburst(i_IM2COL_ENGINE_rxawburst),
	.rxwready(i_IM2COL_ENGINE_rxwready),
	.rxwvalid(i_IM2COL_ENGINE_rxwvalid),
	.rxwid(i_IM2COL_ENGINE_rxwid),
	.rxwdata(i_IM2COL_ENGINE_rxwdata),
	.rxwstrb(i_IM2COL_ENGINE_rxwstrb),
	.rxwlast(i_IM2COL_ENGINE_rxwlast),
	.rxbready(i_IM2COL_ENGINE_rxbready),
	.rxbvalid(i_IM2COL_ENGINE_rxbvalid),
	.rxbid(i_IM2COL_ENGINE_rxbid),
	.rxbresp(i_IM2COL_ENGINE_rxbresp),
	.rxarready(i_IM2COL_ENGINE_rxarready),
	.rxarvalid(i_IM2COL_ENGINE_rxarvalid),
	.rxaraddr(i_IM2COL_ENGINE_rxaraddr),
	.rxarid(i_IM2COL_ENGINE_rxarid),
	.rxarlen(i_IM2COL_ENGINE_rxarlen),
	.rxarsize(i_IM2COL_ENGINE_rxarsize),
	.rxarburst(i_IM2COL_ENGINE_rxarburst),
	.rxrready(i_IM2COL_ENGINE_rxrready),
	.rxrvalid(i_IM2COL_ENGINE_rxrvalid),
	.rxrid(i_IM2COL_ENGINE_rxrid),
	.rxrdata(i_IM2COL_ENGINE_rxrdata),
	.rxrlast(i_IM2COL_ENGINE_rxrlast),
	.rxrresp(i_IM2COL_ENGINE_rxrresp)
);

