library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.cache_utils_pkg.all;
use work.cache_constants_pkg.all;
use work.cache_pkg.all;

package rv_components is
  component orca is
    generic (
      REGISTER_SIZE : positive range 32 to 32 := 32;

      RESET_VECTOR           : std_logic_vector(31 downto 0) := X"00000000";
      INTERRUPT_VECTOR       : std_logic_vector(31 downto 0) := X"00000200";
      MAX_IFETCHES_IN_FLIGHT : positive                      := 1;
      BTB_ENTRIES            : natural                       := 0;
      MULTIPLY_ENABLE        : natural range 0 to 1          := 0;
      DIVIDE_ENABLE          : natural range 0 to 1          := 0;
      SHIFTER_MAX_CYCLES     : positive range 1 to 32        := 1;
      ENABLE_EXCEPTIONS      : natural                       := 1;
      PIPELINE_STAGES        : natural range 4 to 5          := 5;
      VCP_ENABLE             : natural range 0 to 2          := 0;
      ENABLE_EXT_INTERRUPTS  : natural range 0 to 1          := 0;
      NUM_INTERRUPTS     : positive range 1 to 32        := 1;
      POWER_OPTIMIZED        : natural range 0 to 1          := 0;
      FAMILY                 : string                        := "GENERIC";

      -------------------------------------------------------------------------------
      -- Memory interfaces
      -------------------------------------------------------------------------------
      LOG2_BURSTLENGTH : positive range 1 to 8 := 4;
      AXI_ID_WIDTH     : positive              := 2;

      --Auxiliary interface select (at most one enabled)
      AVALON_AUX   : natural range 0 to 1 := 0;
      LMB_AUX      : natural range 0 to 1 := 0;
      WISHBONE_AUX : natural range 0 to 1 := 1;

      --Auxiliary memory regions (0 to disable)
      AUX_MEMORY_REGIONS : natural range 0 to 4          := 1;
      AMR0_ADDR_BASE     : std_logic_vector(31 downto 0) := X"00000000";
      AMR0_ADDR_LAST     : std_logic_vector(31 downto 0) := X"FFFFFFFF";

      --Uncached memory regions (0 to disable)
      UC_MEMORY_REGIONS : natural range 0 to 4          := 0;
      UMR0_ADDR_BASE    : std_logic_vector(31 downto 0) := X"00000000";
      UMR0_ADDR_LAST    : std_logic_vector(31 downto 0) := X"FFFFFFFF";

      HAS_ICACHE            : boolean;
      HAS_DCACHE            : boolean;

      --Instruction cache (ICACHE_SIZE 0 to disable)
      ICACHE_SIZE           : natural                  := 0;
      ICACHE_LINE_SIZE      : positive range 16 to 256 := 32;
      ICACHE_EXTERNAL_WIDTH : positive                 := 32;

      --Instruction interface registers for timing/fmax
      --Request registers are 0/off, 1/light (waitrequest/ready only), 2/full
      INSTRUCTION_REQUEST_REGISTER : natural range 0 to 2 := 0;
      INSTRUCTION_RETURN_REGISTER  : natural range 0 to 1 := 0;
      IUC_REQUEST_REGISTER         : natural range 0 to 2 := 0;
      IUC_RETURN_REGISTER          : natural range 0 to 1 := 0;
      IAUX_REQUEST_REGISTER        : natural range 0 to 2 := 0;
      IAUX_RETURN_REGISTER         : natural range 0 to 1 := 0;
      IC_REQUEST_REGISTER          : natural range 0 to 2 := 1;
      IC_RETURN_REGISTER           : natural range 0 to 1 := 0;

      --Data cache (DCACHE_SIZE 0 to disable)
      DCACHE_SIZE           : natural                  := 0;
      DCACHE_LINE_SIZE      : positive range 16 to 256 := 32;
      DCACHE_EXTERNAL_WIDTH : positive                 := 32;
      DCACHE_WRITEBACK      : natural range 0 to 1     := 1;

      --Data interface registers for timing/fmax
      --Request registers are 0/off, 1/light (waitrequest/ready only), 2/full
      DATA_REQUEST_REGISTER : natural range 0 to 2 := 1;
      DATA_RETURN_REGISTER  : natural range 0 to 1 := 0;
      DUC_REQUEST_REGISTER  : natural range 0 to 2 := 0;
      DUC_RETURN_REGISTER   : natural range 0 to 1 := 0;
      DAUX_REQUEST_REGISTER : natural range 0 to 2 := 0;
      DAUX_RETURN_REGISTER  : natural range 0 to 1 := 0;
      DC_REQUEST_REGISTER   : natural range 0 to 2 := 1;
      DC_RETURN_REGISTER    : natural range 0 to 1 := 0
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      -------------------------------------------------------------------------------
      -- Interrupts
      -------------------------------------------------------------------------------
      global_interrupts : in std_logic_vector(NUM_INTERRUPTS-1 downto 0) := (others => '0');

      -------------------------------------------------------------------------------
      --AVALON
      -------------------------------------------------------------------------------
      --Avalon data master
      avm_data_address       : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      avm_data_byteenable    : out std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      avm_data_read          : out std_logic;
      avm_data_readdata      : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      avm_data_write         : out std_logic;
      avm_data_writedata     : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      avm_data_waitrequest   : in  std_logic                                  := '0';
      avm_data_readdatavalid : in  std_logic                                  := '0';

      --Avalon instruction master
      avm_instruction_address       : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      avm_instruction_read          : out std_logic;
      avm_instruction_readdata      : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      avm_instruction_waitrequest   : in  std_logic                                  := '0';
      avm_instruction_readdatavalid : in  std_logic                                  := '0';

      -------------------------------------------------------------------------------
      --WISHBONE
      -------------------------------------------------------------------------------
      --WISHBONE data master
      data_ADR_O   : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      data_DAT_I   : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      data_DAT_O   : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      data_WE_O    : out std_logic;
      data_SEL_O   : out std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      data_STB_O   : out std_logic;
      data_ACK_I   : in  std_logic                                  := '0';
      data_CYC_O   : out std_logic;
      data_CTI_O   : out std_logic_vector(2 downto 0);
      data_STALL_I : in  std_logic                                  := '0';

      --WISHBONE instruction master
      instr_ADR_O   : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      instr_DAT_I   : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      instr_STB_O   : out std_logic;
      instr_ACK_I   : in  std_logic                                  := '0';
      instr_CYC_O   : out std_logic;
      instr_CTI_O   : out std_logic_vector(2 downto 0);
      instr_STALL_I : in  std_logic                                  := '0';

      -------------------------------------------------------------------------------
      --AXI
      -------------------------------------------------------------------------------
      --AXI4-Lite uncached instruction master
      --A full AXI3 interface is exposed for systems that require it, but
      --only the (read-only) AXI4-Lite signals are needed
      IUC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IUC_ARSIZE  : out std_logic_vector(2 downto 0);
      IUC_ARBURST : out std_logic_vector(1 downto 0);
      IUC_ARLOCK  : out std_logic_vector(1 downto 0);
      IUC_ARCACHE : out std_logic_vector(3 downto 0);
      IUC_ARPROT  : out std_logic_vector(2 downto 0);
      IUC_ARVALID : out std_logic;
      IUC_ARREADY : in  std_logic := '0';

      IUC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0)  := (others => '0');
      IUC_RDATA  : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      IUC_RRESP  : in  std_logic_vector(1 downto 0)               := (others => '0');
      IUC_RLAST  : in  std_logic                                  := '0';
      IUC_RVALID : in  std_logic                                  := '0';
      IUC_RREADY : out std_logic;

      IUC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IUC_AWSIZE  : out std_logic_vector(2 downto 0);
      IUC_AWBURST : out std_logic_vector(1 downto 0);
      IUC_AWLOCK  : out std_logic_vector(1 downto 0);
      IUC_AWCACHE : out std_logic_vector(3 downto 0);
      IUC_AWPROT  : out std_logic_vector(2 downto 0);
      IUC_AWVALID : out std_logic;
      IUC_AWREADY : in  std_logic := '0';

      IUC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_WDATA  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_WSTRB  : out std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      IUC_WLAST  : out std_logic;
      IUC_WVALID : out std_logic;
      IUC_WREADY : in  std_logic := '0';

      IUC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0) := (others => '0');
      IUC_BRESP  : in  std_logic_vector(1 downto 0)              := (others => '0');
      IUC_BVALID : in  std_logic                                 := '0';
      IUC_BREADY : out std_logic;

      --AXI4-Lite uncached data master
      --A full AXI3 interface is exposed for systems that require it, but
      --only the AXI4-Lite signals are needed
      DUC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DUC_AWSIZE  : out std_logic_vector(2 downto 0);
      DUC_AWBURST : out std_logic_vector(1 downto 0);
      DUC_AWLOCK  : out std_logic_vector(1 downto 0);
      DUC_AWCACHE : out std_logic_vector(3 downto 0);
      DUC_AWPROT  : out std_logic_vector(2 downto 0);
      DUC_AWVALID : out std_logic;
      DUC_AWREADY : in  std_logic := '0';

      DUC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_WDATA  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_WSTRB  : out std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      DUC_WLAST  : out std_logic;
      DUC_WVALID : out std_logic;
      DUC_WREADY : in  std_logic := '0';

      DUC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0) := (others => '0');
      DUC_BRESP  : in  std_logic_vector(1 downto 0)              := (others => '0');
      DUC_BVALID : in  std_logic                                 := '0';
      DUC_BREADY : out std_logic;

      DUC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DUC_ARSIZE  : out std_logic_vector(2 downto 0);
      DUC_ARBURST : out std_logic_vector(1 downto 0);
      DUC_ARLOCK  : out std_logic_vector(1 downto 0);
      DUC_ARCACHE : out std_logic_vector(3 downto 0);
      DUC_ARPROT  : out std_logic_vector(2 downto 0);
      DUC_ARVALID : out std_logic;
      DUC_ARREADY : in  std_logic := '0';

      DUC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0)  := (others => '0');
      DUC_RDATA  : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      DUC_RRESP  : in  std_logic_vector(1 downto 0)               := (others => '0');
      DUC_RLAST  : in  std_logic                                  := '0';
      DUC_RVALID : in  std_logic                                  := '0';
      DUC_RREADY : out std_logic;

      --AXI3/4 cacheable instruction master
      --WID can be unconnected and LOG2_BURSTLENGTH set to 8 to for AXI4
      --Read-only, write is exposed for systems that require it
      IC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IC_ARSIZE  : out std_logic_vector(2 downto 0);
      IC_ARBURST : out std_logic_vector(1 downto 0);
      IC_ARLOCK  : out std_logic_vector(1 downto 0);
      IC_ARCACHE : out std_logic_vector(3 downto 0);
      IC_ARPROT  : out std_logic_vector(2 downto 0);
      IC_ARVALID : out std_logic;
      IC_ARREADY : in  std_logic := '0';

      IC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0)          := (others => '0');
      IC_RDATA  : in  std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0) := (others => '0');
      IC_RRESP  : in  std_logic_vector(1 downto 0)                       := (others => '0');
      IC_RLAST  : in  std_logic                                          := '0';
      IC_RVALID : in  std_logic                                          := '0';
      IC_RREADY : out std_logic;

      IC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IC_AWSIZE  : out std_logic_vector(2 downto 0);
      IC_AWBURST : out std_logic_vector(1 downto 0);
      IC_AWLOCK  : out std_logic_vector(1 downto 0);
      IC_AWCACHE : out std_logic_vector(3 downto 0);
      IC_AWPROT  : out std_logic_vector(2 downto 0);
      IC_AWVALID : out std_logic;
      IC_AWREADY : in  std_logic := '0';

      IC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_WDATA  : out std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
      IC_WSTRB  : out std_logic_vector((ICACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      IC_WLAST  : out std_logic;
      IC_WVALID : out std_logic;
      IC_WREADY : in  std_logic                                 := '0';
      IC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0) := (others => '0');
      IC_BRESP  : in  std_logic_vector(1 downto 0)              := (others => '0');
      IC_BVALID : in  std_logic                                 := '0';
      IC_BREADY : out std_logic;

      --AXI3/4 cacheable data master
      --WID can be unconnected and LOG2_BURSTLENGTH set to 8 to for AXI4
      DC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DC_ARSIZE  : out std_logic_vector(2 downto 0);
      DC_ARBURST : out std_logic_vector(1 downto 0);
      DC_ARLOCK  : out std_logic_vector(1 downto 0);
      DC_ARCACHE : out std_logic_vector(3 downto 0);
      DC_ARPROT  : out std_logic_vector(2 downto 0);
      DC_ARVALID : out std_logic;
      DC_ARREADY : in  std_logic := '0';

      DC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0)          := (others => '0');
      DC_RDATA  : in  std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0) := (others => '0');
      DC_RRESP  : in  std_logic_vector(1 downto 0)                       := (others => '0');
      DC_RLAST  : in  std_logic                                          := '0';
      DC_RVALID : in  std_logic                                          := '0';
      DC_RREADY : out std_logic;

      DC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DC_AWSIZE  : out std_logic_vector(2 downto 0);
      DC_AWBURST : out std_logic_vector(1 downto 0);
      DC_AWLOCK  : out std_logic_vector(1 downto 0);
      DC_AWCACHE : out std_logic_vector(3 downto 0);
      DC_AWPROT  : out std_logic_vector(2 downto 0);
      DC_AWVALID : out std_logic;
      DC_AWREADY : in  std_logic := '0';

      DC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_WDATA  : out std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0);
      DC_WSTRB  : out std_logic_vector((DCACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      DC_WLAST  : out std_logic;
      DC_WVALID : out std_logic;
      DC_WREADY : in  std_logic                                 := '0';
      DC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0) := (others => '0');
      DC_BRESP  : in  std_logic_vector(1 downto 0)              := (others => '0');
      DC_BVALID : in  std_logic                                 := '0';
      DC_BREADY : out std_logic;

      -------------------------------------------------------------------------------
      --LMB
      -------------------------------------------------------------------------------
      --Xilinx local memory bus instruction master
      --Read-only, write is exposed for systems that require it
      ILMB_Addr         : out std_logic_vector(0 to REGISTER_SIZE-1);
      ILMB_Byte_Enable  : out std_logic_vector(0 to (REGISTER_SIZE/8)-1);
      ILMB_Data_Write   : out std_logic_vector(0 to REGISTER_SIZE-1);
      ILMB_AS           : out std_logic;
      ILMB_Read_Strobe  : out std_logic;
      ILMB_Write_Strobe : out std_logic;
      ILMB_Data_Read    : in  std_logic_vector(0 to REGISTER_SIZE-1) := (others => '0');
      ILMB_Ready        : in  std_logic                              := '0';
      ILMB_Wait         : in  std_logic                              := '0';
      ILMB_CE           : in  std_logic                              := '0';
      ILMB_UE           : in  std_logic                              := '0';

      --Xilinx local memory bus data master
      DLMB_Addr         : out std_logic_vector(0 to REGISTER_SIZE-1);
      DLMB_Byte_Enable  : out std_logic_vector(0 to (REGISTER_SIZE/8)-1);
      DLMB_Data_Write   : out std_logic_vector(0 to REGISTER_SIZE-1);
      DLMB_AS           : out std_logic;
      DLMB_Read_Strobe  : out std_logic;
      DLMB_Write_Strobe : out std_logic;
      DLMB_Data_Read    : in  std_logic_vector(0 to REGISTER_SIZE-1) := (others => '0');
      DLMB_Ready        : in  std_logic                              := '0';
      DLMB_Wait         : in  std_logic                              := '0';
      DLMB_CE           : in  std_logic                              := '0';
      DLMB_UE           : in  std_logic                              := '0';

      ---------------------------------------------------------------------------
      -- Timer signals
      ---------------------------------------------------------------------------
      timer_value     : in std_logic_vector(63 downto 0) := (others => '0');
      timer_interrupt : in std_logic                     := '0';

      ---------------------------------------------------------------------------
      -- Vector Coprocessor Port
      ---------------------------------------------------------------------------
      vcp_data0            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data1            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data2            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_instruction      : out std_logic_vector(40 downto 0);
      vcp_valid_instr      : out std_logic;
      vcp_ready            : in  std_logic                                  := '1';
      vcp_illegal          : in  std_logic                                  := '0';
      vcp_writeback_data   : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      vcp_writeback_en     : in  std_logic                                  := '0';
      vcp_alu_data1        : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      vcp_alu_data2        : in  std_logic_vector(REGISTER_SIZE-1 downto 0) := (others => '0');
      vcp_alu_source_valid : in  std_logic                                  := '0';
      vcp_alu_result       : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_result_valid : out std_logic;

      icache_tag_renable     : out   std_logic;
      icache_tag_raddr     : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1 downto 0);
      icache_tag_rdata        : in    std_logic_vector(REGISTER_SIZE-log2(ICACHE_SIZE) downto 0);
      icache_tag_wenable     : out   std_logic;
      icache_tag_waddr    : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1 downto 0);
      icache_tag_wdata       : out   std_logic_vector(REGISTER_SIZE-log2(ICACHE_SIZE) downto 0);
  
      icache_data_renable: out std_logic;
      icache_data_raddr     : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)+log2(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      icache_data_rdata        : in    std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
    icache_data_wenable: out std_logic;
      icache_data_waddr    : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)+log2(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      icache_data_wstrb : out   std_logic_vector((ICACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      icache_data_wdata       : out   std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
  
      dcache_tag_renable     : out   std_logic;
      dcache_tag_raddr     : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1 downto 0);
      dcache_tag_rdata        : in    std_logic_vector(REGISTER_SIZE-log2(DCACHE_SIZE)+DCACHE_WRITEBACK downto 0);
      dcache_tag_wenable     : out   std_logic;
      dcache_tag_waddr    : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1 downto 0);
      dcache_tag_wdata       : out   std_logic_vector(REGISTER_SIZE-log2(DCACHE_SIZE)+DCACHE_WRITEBACK downto 0);
  
      dcache_data_renable: out std_logic;
      dcache_data_raddr     : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)+log2(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      dcache_data_rdata        : in    std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0);
      dcache_data_wenable: out std_logic;
      dcache_data_waddr    : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)+log2(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      dcache_data_wstrb : out   std_logic_vector((DCACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      dcache_data_wdata       : out   std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0);

			-- debug_info by kshan
			executed : out std_logic;
			executed_inst : out std_logic_vector(31 downto 0);
			executed_pc : out std_logic_vector(31 downto 0)
      );
  end component orca;

  component orca_core is
    generic (
      REGISTER_SIZE          : positive range 32 to 32;
      RESET_VECTOR           : std_logic_vector(31 downto 0);
      INTERRUPT_VECTOR       : std_logic_vector(31 downto 0);
      MAX_IFETCHES_IN_FLIGHT : positive;
      BTB_ENTRIES            : natural;
      MULTIPLY_ENABLE        : boolean;
      DIVIDE_ENABLE          : boolean;
      SHIFTER_MAX_CYCLES     : positive range 1 to 32;
      POWER_OPTIMIZED        : boolean;
      ENABLE_EXCEPTIONS      : boolean;
      PIPELINE_STAGES        : natural range 4 to 5;
      ENABLE_EXT_INTERRUPTS  : boolean;
      NUM_INTERRUPTS     : positive range 1 to 32;
      VCP_ENABLE             : vcp_type;
      WRITE_FIRST_SMALL_RAMS : boolean;
      FAMILY                 : string;

      AUX_MEMORY_REGIONS : natural range 0 to 4;
      AMR0_ADDR_BASE     : std_logic_vector(31 downto 0);
      AMR0_ADDR_LAST     : std_logic_vector(31 downto 0);
      AMR0_READ_ONLY     : boolean;

      UC_MEMORY_REGIONS : natural range 0 to 4;
      UMR0_ADDR_BASE    : std_logic_vector(31 downto 0);
      UMR0_ADDR_LAST    : std_logic_vector(31 downto 0);
      UMR0_READ_ONLY    : boolean;

      HAS_ICACHE : boolean;
      HAS_DCACHE : boolean
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      global_interrupts : in std_logic_vector(NUM_INTERRUPTS-1 downto 0);

      --ICache control (Invalidate/flush/writeback)
      from_icache_control_ready : in     std_logic;
      to_icache_control_valid   : buffer std_logic;
      to_icache_control_command : out    std_logic_vector(BW_CACHE_COMMAND-1 downto 0);

      --DCache control (Invalidate/flush/writeback)
      from_dcache_control_ready : in     std_logic;
      to_dcache_control_valid   : buffer std_logic;
      to_dcache_control_command : out    std_logic_vector(BW_CACHE_COMMAND-1 downto 0);

      --Cache control common signals
      to_cache_control_base : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_cache_control_last : out std_logic_vector(REGISTER_SIZE-1 downto 0);

      memory_interface_idle : in std_logic;

      --Instruction ORCA-internal memory-mapped master
      ifetch_oimm_address       : buffer std_logic_vector(REGISTER_SIZE-1 downto 0);
      ifetch_oimm_requestvalid  : buffer std_logic;
      ifetch_oimm_readdata      : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      ifetch_oimm_waitrequest   : in     std_logic;
      ifetch_oimm_readdatavalid : in     std_logic;

      --Data ORCA-internal memory-mapped master
      lsu_oimm_address       : out    std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_byteenable    : out    std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      lsu_oimm_requestvalid  : buffer std_logic;
      lsu_oimm_readnotwrite  : buffer std_logic;
      lsu_oimm_writedata     : out    std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_readdata      : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_readdatavalid : in     std_logic;
      lsu_oimm_waitrequest   : in     std_logic;

      --Auxiliary/Uncached memory regions
      amr_base_addrs : out std_logic_vector((imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      amr_last_addrs : out std_logic_vector((imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_base_addrs : out std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_last_addrs : out std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);

      --Timer signals
      timer_value     : in std_logic_vector(63 downto 0);
      timer_interrupt : in std_logic;

      --Vector coprocessor port
      vcp_data0            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data1            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data2            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_instruction      : out std_logic_vector(40 downto 0);
      vcp_valid_instr      : out std_logic;
      vcp_ready            : in  std_logic;
      vcp_illegal          : in  std_logic;
      vcp_writeback_data   : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_writeback_en     : in  std_logic;
      vcp_alu_data1        : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_data2        : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_source_valid : in  std_logic;
      vcp_alu_result       : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_result_valid : out std_logic;
			
			-- debug_info by kshan
			debug_info           : out std_logic_vector(BW_DEBUG_INFO-1 downto 0)
      );
  end component orca_core;

  component decode is
    generic (
      REGISTER_SIZE          : positive range 32 to 32;
      SIGN_EXTENSION_SIZE    : positive;
      VCP_ENABLE             : vcp_type;
      PIPELINE_STAGES        : natural range 1 to 2;
      WRITE_FIRST_SMALL_RAMS : boolean;
      FAMILY                 : string
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      to_rf_select : in std_logic_vector(REGISTER_NAME_SIZE-1 downto 0);
      to_rf_data   : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_rf_valid  : in std_logic;

      to_decode_instruction              : in     std_logic_vector(INSTRUCTION_SIZE(vcp_type'(DISABLED))-1 downto 0);
      to_decode_program_counter          : in     unsigned(REGISTER_SIZE-1 downto 0);
      to_decode_predicted_pc             : in     unsigned(REGISTER_SIZE-1 downto 0);
      to_decode_valid                    : in     std_logic;
      from_decode_ready                  : buffer std_logic;
      from_decode_incomplete_instruction : out    std_logic;

      quash_decode : in  std_logic;
      decode_idle  : out std_logic;

      from_decode_rs1_data         : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_decode_rs2_data         : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_decode_rs3_data         : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_decode_sign_extension   : out std_logic_vector(SIGN_EXTENSION_SIZE-1 downto 0);
      from_decode_program_counter  : out unsigned(REGISTER_SIZE-1 downto 0);
      from_decode_predicted_pc     : out unsigned(REGISTER_SIZE-1 downto 0);
      from_decode_instruction      : out std_logic_vector(INSTRUCTION_SIZE(VCP_ENABLE)-1 downto 0);
      from_decode_next_instruction : out std_logic_vector(INSTRUCTION_SIZE(vcp_type'(DISABLED))-1 downto 0);
      from_decode_next_valid       : out std_logic;
      from_decode_valid            : out std_logic;
      to_decode_ready              : in  std_logic
      );
  end component decode;

  component execute is
    generic (
      REGISTER_SIZE         : positive range 32 to 32;
      SIGN_EXTENSION_SIZE   : positive;
      INTERRUPT_VECTOR      : std_logic_vector(31 downto 0);
      BTB_ENTRIES           : natural;
      POWER_OPTIMIZED       : boolean;
      MULTIPLY_ENABLE       : boolean;
      DIVIDE_ENABLE         : boolean;
      SHIFTER_MAX_CYCLES    : positive range 1 to 32;
      ENABLE_EXCEPTIONS     : boolean;
      ENABLE_EXT_INTERRUPTS : boolean;
      NUM_INTERRUPTS    : positive range 1 to 32;
      VCP_ENABLE            : vcp_type;
      FAMILY                : string;

      AUX_MEMORY_REGIONS : natural range 0 to 4;
      AMR0_ADDR_BASE     : std_logic_vector(31 downto 0);
      AMR0_ADDR_LAST     : std_logic_vector(31 downto 0);
      AMR0_READ_ONLY     : boolean;

      UC_MEMORY_REGIONS : natural range 0 to 4;
      UMR0_ADDR_BASE    : std_logic_vector(31 downto 0);
      UMR0_ADDR_LAST    : std_logic_vector(31 downto 0);
      UMR0_READ_ONLY    : boolean;

      HAS_ICACHE : boolean;
      HAS_DCACHE : boolean
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      global_interrupts     : in std_logic_vector(NUM_INTERRUPTS-1 downto 0);
      program_counter       : in unsigned(REGISTER_SIZE-1 downto 0);
      core_idle             : in std_logic;
      memory_interface_idle : in std_logic;

      to_execute_valid            : in     std_logic;
      to_execute_program_counter  : in     unsigned(REGISTER_SIZE-1 downto 0);
      to_execute_predicted_pc     : in     unsigned(REGISTER_SIZE-1 downto 0);
      to_execute_instruction      : in     std_logic_vector(INSTRUCTION_SIZE(VCP_ENABLE)-1 downto 0);
      to_execute_next_instruction : in     std_logic_vector(31 downto 0);
      to_execute_next_valid       : in     std_logic;
      to_execute_rs1_data         : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_execute_rs2_data         : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_execute_rs3_data         : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_execute_sign_extension   : in     std_logic_vector(SIGN_EXTENSION_SIZE-1 downto 0);
      from_execute_ready          : buffer std_logic;

      --quash_execute input isn't needed as mispredicts have already resolved
      execute_idle : out std_logic;

      --To PC correction
      to_pc_correction_data        : out    unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_source_pc   : out    unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_valid       : buffer std_logic;
      to_pc_correction_predictable : out    std_logic;
      from_pc_correction_ready     : in     std_logic;

      --To register file
      to_rf_select : buffer std_logic_vector(REGISTER_NAME_SIZE-1 downto 0);
      to_rf_data   : buffer std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_rf_valid  : buffer std_logic;

      --Data ORCA-internal memory-mapped master
      lsu_oimm_address       : out    std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_byteenable    : out    std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      lsu_oimm_requestvalid  : buffer std_logic;
      lsu_oimm_readnotwrite  : buffer std_logic;
      lsu_oimm_writedata     : out    std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_readdata      : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_readdatavalid : in     std_logic;
      lsu_oimm_waitrequest   : in     std_logic;

      --ICache control (Invalidate/flush/writeback)
      from_icache_control_ready : in     std_logic;
      to_icache_control_valid   : buffer std_logic;
      to_icache_control_command : out    std_logic_vector(BW_CACHE_COMMAND-1 downto 0);

      --DCache control (Invalidate/flush/writeback)
      from_dcache_control_ready : in     std_logic;
      to_dcache_control_valid   : buffer std_logic;
      to_dcache_control_command : out    std_logic_vector(BW_CACHE_COMMAND-1 downto 0);

      --Cache control common signals
      to_cache_control_base : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_cache_control_last : out std_logic_vector(REGISTER_SIZE-1 downto 0);

      --Auxiliary/Uncached memory regions
      amr_base_addrs : out std_logic_vector((imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      amr_last_addrs : out std_logic_vector((imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_base_addrs : out std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_last_addrs : out std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);

      pause_ifetch : out std_logic;

      --Timer signals
      timer_value     : in std_logic_vector(63 downto 0);
      timer_interrupt : in std_logic;

      --Vector coprocessor port
      vcp_data0            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data1            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data2            : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_instruction      : out std_logic_vector(40 downto 0);
      vcp_valid_instr      : out std_logic;
      vcp_ready            : in  std_logic;
      vcp_illegal          : in  std_logic;
      vcp_writeback_data   : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_writeback_en     : in  std_logic;
      vcp_alu_data1        : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_data2        : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_source_valid : in  std_logic;
      vcp_alu_result       : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_alu_result_valid : out std_logic;
		
			-- debug_info by kshan
			debug_info           : out std_logic_vector(BW_DEBUG_INFO-1 downto 0)
      );
  end component execute;

  component instruction_fetch is
    generic (
      REGISTER_SIZE          : positive range 32 to 32;
      RESET_VECTOR           : std_logic_vector(31 downto 0);
      MAX_IFETCHES_IN_FLIGHT : positive;
      BTB_ENTRIES            : natural
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      pause_ifetch : in std_logic;

      to_pc_correction_data        : in     unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_source_pc   : in     unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_valid       : in     std_logic;
      to_pc_correction_predictable : in     std_logic;
      from_pc_correction_ready     : buffer std_logic;

      --quash_ifetch is handled by to_pc_correction_valid
      ifetch_idle : out std_logic;

      from_ifetch_instruction     : out std_logic_vector(31 downto 0);
      from_ifetch_program_counter : out unsigned(REGISTER_SIZE-1 downto 0);
      from_ifetch_predicted_pc    : out unsigned(REGISTER_SIZE-1 downto 0);
      from_ifetch_valid           : out std_logic;
      to_ifetch_ready             : in  std_logic;

      program_counter : buffer unsigned(REGISTER_SIZE-1 downto 0);

      --ORCA-internal memory-mapped master
      oimm_address       : buffer std_logic_vector(REGISTER_SIZE-1 downto 0);
      oimm_requestvalid  : buffer std_logic;
      oimm_readdata      : in     std_logic_vector(31 downto 0);
      oimm_readdatavalid : in     std_logic;
      oimm_waitrequest   : in     std_logic
      );
  end component instruction_fetch;

  component arithmetic_unit is
    generic (
      REGISTER_SIZE       : positive range 32 to 32;
      SIGN_EXTENSION_SIZE : positive;
      POWER_OPTIMIZED     : boolean;
      MULTIPLY_ENABLE     : boolean;
      DIVIDE_ENABLE       : boolean;
      SHIFTER_MAX_CYCLES  : positive range 1 to 32;
      ENABLE_EXCEPTIONS   : boolean;
      FAMILY              : string
      );
    port (
      clk : in std_logic;

      to_alu_valid     : in  std_logic;
      to_alu_rs1_data  : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_alu_rs2_data  : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_alu_ready   : out std_logic;
      from_alu_illegal : out std_logic;

      vcp_source_valid : in std_logic;
      vcp_select       : in std_logic;

      from_execute_ready : in std_logic;
      instruction        : in std_logic_vector(31 downto 0);
      sign_extension     : in std_logic_vector(SIGN_EXTENSION_SIZE-1 downto 0);
      current_pc         : in unsigned(REGISTER_SIZE-1 downto 0);

      from_alu_data  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_alu_valid : out std_logic
      );
  end component arithmetic_unit;

  component branch_unit is
    generic (
      REGISTER_SIZE       : positive range 32 to 32;
      SIGN_EXTENSION_SIZE : positive;
      BTB_ENTRIES         : natural;
      ENABLE_EXCEPTIONS   : boolean
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      to_branch_valid     : in  std_logic;
      from_branch_illegal : out std_logic;

      rs1_data       : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs2_data       : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      current_pc     : in unsigned(REGISTER_SIZE-1 downto 0);
      predicted_pc   : in unsigned(REGISTER_SIZE-1 downto 0);
      instruction    : in std_logic_vector(31 downto 0);
      sign_extension : in std_logic_vector(SIGN_EXTENSION_SIZE-1 downto 0);

      target_misaligned : out std_logic;

      from_branch_valid : out std_logic;
      from_branch_data  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_branch_ready   : in  std_logic;

      to_pc_correction_data      : out unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_source_pc : out unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_valid     : out std_logic;
      from_pc_correction_ready   : in  std_logic
      );
  end component branch_unit;

  component load_store_unit is
    generic (
      REGISTER_SIZE       : positive range 32 to 32;
      SIGN_EXTENSION_SIZE : positive;
      ENABLE_EXCEPTIONS   : boolean
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      lsu_idle : out std_logic;

      to_lsu_valid      : in  std_logic;
      from_lsu_illegal  : out std_logic;
      from_lsu_misalign : out std_logic;

      rs1_data       : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs2_data       : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      instruction    : in std_logic_vector(31 downto 0);
      sign_extension : in std_logic_vector(SIGN_EXTENSION_SIZE-1 downto 0);

      load_in_progress         : buffer std_logic;
      writeback_stall_from_lsu : buffer std_logic;

      lsu_ready      : out std_logic;
      from_lsu_data  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_lsu_valid : out std_logic;

      --ORCA-internal memory-mapped master
      oimm_address       : out    std_logic_vector(REGISTER_SIZE-1 downto 0);
      oimm_byteenable    : out    std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      oimm_requestvalid  : buffer std_logic;
      oimm_readnotwrite  : buffer std_logic;
      oimm_writedata     : out    std_logic_vector(REGISTER_SIZE-1 downto 0);
      oimm_readdata      : in     std_logic_vector(REGISTER_SIZE-1 downto 0);
      oimm_readdatavalid : in     std_logic;
      oimm_waitrequest   : in     std_logic
      );
  end component load_store_unit;

  component register_file
    generic (
      REGISTER_SIZE          : positive range 32 to 32;
      REGISTER_NAME_SIZE     : positive;
      READ_PORTS             : positive range 1 to 3;
      WRITE_FIRST_SMALL_RAMS : boolean
      );
    port (
      clk        : in std_logic;
			reset      : in std_logic;
      rs1_select : in std_logic_vector(REGISTER_NAME_SIZE-1 downto 0);
      rs2_select : in std_logic_vector(REGISTER_NAME_SIZE-1 downto 0);
      rs3_select : in std_logic_vector(REGISTER_NAME_SIZE-1 downto 0);
      wb_select  : in std_logic_vector(REGISTER_NAME_SIZE-1 downto 0);
      wb_data    : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      wb_enable  : in std_logic;

      rs1_data : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs2_data : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs3_data : out std_logic_vector(REGISTER_SIZE-1 downto 0)
      );
  end component register_file;

  component sys_call is
    generic (
      REGISTER_SIZE    : positive range 32 to 32;
      POWER_OPTIMIZED  : boolean;
      INTERRUPT_VECTOR : std_logic_vector(31 downto 0);

      ENABLE_EXCEPTIONS     : boolean;
      ENABLE_EXT_INTERRUPTS : boolean;
      NUM_INTERRUPTS    : positive range 1 to 32;

      VCP_ENABLE      : vcp_type;
      MULTIPLY_ENABLE : boolean;

      AUX_MEMORY_REGIONS : natural range 0 to 4;
      AMR0_ADDR_BASE     : std_logic_vector(31 downto 0);
      AMR0_ADDR_LAST     : std_logic_vector(31 downto 0);
      AMR0_READ_ONLY     : boolean;

      UC_MEMORY_REGIONS : natural range 0 to 4;
      UMR0_ADDR_BASE    : std_logic_vector(31 downto 0);
      UMR0_ADDR_LAST    : std_logic_vector(31 downto 0);
      UMR0_READ_ONLY    : boolean;

      HAS_ICACHE : boolean;
      HAS_DCACHE : boolean
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      global_interrupts : in std_logic_vector(NUM_INTERRUPTS-1 downto 0);
      core_idle         : in std_logic;
      memory_idle       : in std_logic;
      program_counter   : in unsigned(REGISTER_SIZE-1 downto 0);

      to_syscall_valid     : in  std_logic;
      from_syscall_illegal : out std_logic;
      current_pc           : in  unsigned(REGISTER_SIZE-1 downto 0);
      instruction          : in  std_logic_vector(31 downto 0);
      rs1_data             : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs2_data             : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      from_syscall_ready   : out std_logic;

      illegal_instruction : in std_logic;
      from_branch_misaligned : in std_logic;
      from_lsu_addr_misalign : in std_logic;
      from_lsu_address       : in std_logic_vector(REGISTER_SIZE-1 downto 0);

      from_syscall_valid : out std_logic;
      from_syscall_data  : out std_logic_vector(REGISTER_SIZE-1 downto 0);

      to_pc_correction_data    : out unsigned(REGISTER_SIZE-1 downto 0);
      to_pc_correction_valid   : out std_logic;
      from_pc_correction_ready : in  std_logic;

      from_icache_control_ready : in     std_logic;
      to_icache_control_valid   : buffer std_logic;
      to_icache_control_command : out    std_logic_vector(BW_CACHE_COMMAND-1 downto 0);

      from_dcache_control_ready : in     std_logic;
      to_dcache_control_valid   : buffer std_logic;
      to_dcache_control_command : out    std_logic_vector(BW_CACHE_COMMAND-1 downto 0);

      to_cache_control_base : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_cache_control_last : out std_logic_vector(REGISTER_SIZE-1 downto 0);

      amr_base_addrs : out std_logic_vector((imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      amr_last_addrs : out std_logic_vector((imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_base_addrs : out std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_last_addrs : out std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);

      pause_ifetch : out std_logic;

      timer_value     : in std_logic_vector(63 downto 0);
      timer_interrupt : in std_logic;

      vcp_writeback_en   : in std_logic;
      vcp_writeback_data : in std_logic_vector(REGISTER_SIZE-1 downto 0)
      );
  end component sys_call;


  component ram_mux is
    generic (
      ADDRESS_WIDTH : natural;
      DATA_WIDTH    : natural
      );
    port (
      -- init signals
      nvm_addr     : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      nvm_wdata    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      nvm_wen      : in  std_logic;
      nvm_byte_sel : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
      nvm_strb     : in  std_logic;
      nvm_ack      : out std_logic;
      nvm_rdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);

      -- user signals
      user_ARREADY : out std_logic;
      user_ARADDR  : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      user_ARVALID : in  std_logic;

      user_RREADY : out std_logic;
      user_RDATA  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      user_RVALID : out std_logic;

      user_AWADDR  : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      user_AWVALID : in  std_logic;
      user_AWREADY : out std_logic;

      user_WDATA  : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      user_WVALID : in  std_logic;
      user_WREADY : out std_logic;

      user_BREADY : in  std_logic;
      user_BVALID : out std_logic;

      -- mux signals/ram inputs
      SEL          : in  std_logic;
      ram_addr     : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      ram_wdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
      ram_wen      : out std_logic;
      ram_byte_sel : out std_logic_vector(DATA_WIDTH/8-1 downto 0);
      ram_strb     : out std_logic;
      ram_ack      : in  std_logic;
      ram_rdata    : in  std_logic_vector(DATA_WIDTH-1 downto 0)
      );
  end component ram_mux;

  component vcp_handler is
    generic (
      REGISTER_SIZE : positive range 32 to 32;
      VCP_ENABLE    : vcp_type
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      instruction  : in std_logic_vector(INSTRUCTION_SIZE(VCP_ENABLE)-1 downto 0);
      to_vcp_valid : in std_logic;
      vcp_select   : in std_logic;

      rs1_data : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs2_data : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      rs3_data : in std_logic_vector(REGISTER_SIZE-1 downto 0);

      vcp_data0 : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data1 : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      vcp_data2 : out std_logic_vector(REGISTER_SIZE-1 downto 0);

      vcp_instruction      : out std_logic_vector(40 downto 0);
      vcp_valid_instr      : out std_logic;
      vcp_writeback_select : out std_logic
      );
  end component vcp_handler;

  component ERVP_ORCA_MEMORY_INTERFACE is
    generic (
      REGISTER_SIZE         : positive range 32 to 32;
      LOG2_BURSTLENGTH : positive;
      AXI_ID_WIDTH     : positive;
      UC_MEMORY_REGIONS : natural range 0 to 4;

      HAS_ICACHE            : boolean;
      HAS_DCACHE            : boolean;

      ICACHE_SIZE           : natural;
      ICACHE_LINE_SIZE      : positive range 16 to 256;
      ICACHE_EXTERNAL_WIDTH : positive;
      DCACHE_SIZE           : natural;
      DCACHE_LINE_SIZE      : positive range 16 to 256;
      DCACHE_EXTERNAL_WIDTH : positive;
      DCACHE_WRITEBACK      : boolean;
      DCACHE_DIRTY_BITS     : natural
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      umr_base_addrs : in std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);
      umr_last_addrs : in std_logic_vector((imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1 downto 0);

      from_icache_control_ready : out std_logic;
      to_icache_control_valid   : in  std_logic;
      to_icache_control_command : in  std_logic_vector(BW_CACHE_COMMAND-1 downto 0);
      from_dcache_control_ready : out std_logic;
      to_dcache_control_valid   : in  std_logic;
      to_dcache_control_command : in  std_logic_vector(BW_CACHE_COMMAND-1 downto 0);
      to_cache_control_base : in std_logic_vector(REGISTER_SIZE-1 downto 0);
      to_cache_control_last : in std_logic_vector(REGISTER_SIZE-1 downto 0);

      memory_interface_idle : out std_logic;

      --Instruction ORCA-internal memory-mapped master
      ifetch_oimm_address       : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      ifetch_oimm_requestvalid  : in  std_logic;
      ifetch_oimm_readdata      : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      ifetch_oimm_waitrequest   : out std_logic;
      ifetch_oimm_readdatavalid : out std_logic;

      --Data ORCA-internal memory-mapped master
      lsu_oimm_address       : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_byteenable    : in  std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      lsu_oimm_requestvalid  : in  std_logic;
      lsu_oimm_readnotwrite  : in  std_logic;
      lsu_oimm_writedata     : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_readdata      : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      lsu_oimm_readdatavalid : out std_logic;
      lsu_oimm_waitrequest   : out std_logic;

      -------------------------------------------------------------------------------
      --AXI
      -------------------------------------------------------------------------------
      --AXI4-Lite uncached instruction master
      --A full AXI3 interface is exposed for systems that require it, but
      --only the (read-only) AXI4-Lite signals are needed
      IUC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IUC_ARSIZE  : out std_logic_vector(2 downto 0);
      IUC_ARBURST : out std_logic_vector(1 downto 0);
      IUC_ARLOCK  : out std_logic_vector(1 downto 0);
      IUC_ARCACHE : out std_logic_vector(3 downto 0);
      IUC_ARPROT  : out std_logic_vector(2 downto 0);
      IUC_ARVALID : out std_logic;
      IUC_ARREADY : in  std_logic;

      IUC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_RDATA  : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_RRESP  : in  std_logic_vector(1 downto 0);
      IUC_RLAST  : in  std_logic;
      IUC_RVALID : in  std_logic;
      IUC_RREADY : out std_logic;

      IUC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IUC_AWSIZE  : out std_logic_vector(2 downto 0);
      IUC_AWBURST : out std_logic_vector(1 downto 0);
      IUC_AWLOCK  : out std_logic_vector(1 downto 0);
      IUC_AWCACHE : out std_logic_vector(3 downto 0);
      IUC_AWPROT  : out std_logic_vector(2 downto 0);
      IUC_AWVALID : out std_logic;
      IUC_AWREADY : in  std_logic;

      IUC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_WDATA  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IUC_WSTRB  : out std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      IUC_WLAST  : out std_logic;
      IUC_WVALID : out std_logic;
      IUC_WREADY : in  std_logic;

      IUC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IUC_BRESP  : in  std_logic_vector(1 downto 0);
      IUC_BVALID : in  std_logic;
      IUC_BREADY : out std_logic;

      --AXI4-Lite uncached data master
      --A full AXI3 interface is exposed for systems that require it, but
      --only the AXI4-Lite signals are needed
      DUC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DUC_AWSIZE  : out std_logic_vector(2 downto 0);
      DUC_AWBURST : out std_logic_vector(1 downto 0);
      DUC_AWLOCK  : out std_logic_vector(1 downto 0);
      DUC_AWCACHE : out std_logic_vector(3 downto 0);
      DUC_AWPROT  : out std_logic_vector(2 downto 0);
      DUC_AWVALID : out std_logic;
      DUC_AWREADY : in  std_logic;

      DUC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_WDATA  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_WSTRB  : out std_logic_vector((REGISTER_SIZE/8)-1 downto 0);
      DUC_WLAST  : out std_logic;
      DUC_WVALID : out std_logic;
      DUC_WREADY : in  std_logic;

      DUC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_BRESP  : in  std_logic_vector(1 downto 0);
      DUC_BVALID : in  std_logic;
      DUC_BREADY : out std_logic;

      DUC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DUC_ARSIZE  : out std_logic_vector(2 downto 0);
      DUC_ARBURST : out std_logic_vector(1 downto 0);
      DUC_ARLOCK  : out std_logic_vector(1 downto 0);
      DUC_ARCACHE : out std_logic_vector(3 downto 0);
      DUC_ARPROT  : out std_logic_vector(2 downto 0);
      DUC_ARVALID : out std_logic;
      DUC_ARREADY : in  std_logic;

      DUC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DUC_RDATA  : in  std_logic_vector(REGISTER_SIZE-1 downto 0);
      DUC_RRESP  : in  std_logic_vector(1 downto 0);
      DUC_RLAST  : in  std_logic;
      DUC_RVALID : in  std_logic;
      DUC_RREADY : out std_logic;

      --AXI3/4 cacheable instruction master
      --WID can be unconnected and LOG2_BURSTLENGTH set to 8 to for AXI4
      --Read-only, write is exposed for systems that require it
      IC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IC_ARSIZE  : out std_logic_vector(2 downto 0);
      IC_ARBURST : out std_logic_vector(1 downto 0);
      IC_ARLOCK  : out std_logic_vector(1 downto 0);
      IC_ARCACHE : out std_logic_vector(3 downto 0);
      IC_ARPROT  : out std_logic_vector(2 downto 0);
      IC_ARVALID : out std_logic;
      IC_ARREADY : in  std_logic;

      IC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_RDATA  : in  std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
      IC_RRESP  : in  std_logic_vector(1 downto 0);
      IC_RLAST  : in  std_logic;
      IC_RVALID : in  std_logic;
      IC_RREADY : out std_logic;

      IC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      IC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      IC_AWSIZE  : out std_logic_vector(2 downto 0);
      IC_AWBURST : out std_logic_vector(1 downto 0);
      IC_AWLOCK  : out std_logic_vector(1 downto 0);
      IC_AWCACHE : out std_logic_vector(3 downto 0);
      IC_AWPROT  : out std_logic_vector(2 downto 0);
      IC_AWVALID : out std_logic;
      IC_AWREADY : in  std_logic;

      IC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_WDATA  : out std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
      IC_WSTRB  : out std_logic_vector((ICACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      IC_WLAST  : out std_logic;
      IC_WVALID : out std_logic;
      IC_WREADY : in  std_logic;
      IC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      IC_BRESP  : in  std_logic_vector(1 downto 0);
      IC_BVALID : in  std_logic;
      IC_BREADY : out std_logic;

      --AXI3/4 cacheable data master
      --WID can be unconnected and LOG2_BURSTLENGTH set to 8 to for AXI4
      DC_ARID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_ARADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DC_ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DC_ARSIZE  : out std_logic_vector(2 downto 0);
      DC_ARBURST : out std_logic_vector(1 downto 0);
      DC_ARLOCK  : out std_logic_vector(1 downto 0);
      DC_ARCACHE : out std_logic_vector(3 downto 0);
      DC_ARPROT  : out std_logic_vector(2 downto 0);
      DC_ARVALID : out std_logic;
      DC_ARREADY : in  std_logic;

      DC_RID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_RDATA  : in  std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0);
      DC_RRESP  : in  std_logic_vector(1 downto 0);
      DC_RLAST  : in  std_logic;
      DC_RVALID : in  std_logic;
      DC_RREADY : out std_logic;

      DC_AWID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_AWADDR  : out std_logic_vector(REGISTER_SIZE-1 downto 0);
      DC_AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      DC_AWSIZE  : out std_logic_vector(2 downto 0);
      DC_AWBURST : out std_logic_vector(1 downto 0);
      DC_AWLOCK  : out std_logic_vector(1 downto 0);
      DC_AWCACHE : out std_logic_vector(3 downto 0);
      DC_AWPROT  : out std_logic_vector(2 downto 0);
      DC_AWVALID : out std_logic;
      DC_AWREADY : in  std_logic;

      DC_WID    : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_WDATA  : out std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0);
      DC_WSTRB  : out std_logic_vector((DCACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      DC_WLAST  : out std_logic;
      DC_WVALID : out std_logic;
      DC_WREADY : in  std_logic;
      DC_BID    : in  std_logic_vector(AXI_ID_WIDTH-1 downto 0);
      DC_BRESP  : in  std_logic_vector(1 downto 0);
      DC_BVALID : in  std_logic;
      DC_BREADY : out std_logic;

      icache_tag_renable     : out   std_logic;
      icache_tag_raddr     : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1 downto 0);
      icache_tag_rdata        : in    std_logic_vector(REGISTER_SIZE-log2(ICACHE_SIZE) downto 0);
      icache_tag_wenable     : out   std_logic;
      icache_tag_waddr    : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1 downto 0);
      icache_tag_wdata       : out   std_logic_vector(REGISTER_SIZE-log2(ICACHE_SIZE) downto 0);
  
      icache_data_renable : out std_logic;
      icache_data_raddr     : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)+log2(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      icache_data_rdata        : in    std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
      icache_data_wenable : out std_logic;
      icache_data_waddr    : out   std_logic_vector(log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)+log2(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1 downto 0);      
      icache_data_wstrb : out   std_logic_vector((ICACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      icache_data_wdata       : out   std_logic_vector(ICACHE_EXTERNAL_WIDTH-1 downto 0);
  
      dcache_tag_renable     : out   std_logic;
      dcache_tag_raddr     : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1 downto 0);
      dcache_tag_rdata        : in    std_logic_vector(REGISTER_SIZE-log2(DCACHE_SIZE)+DCACHE_DIRTY_BITS downto 0);
      dcache_tag_wenable     : out   std_logic;
      dcache_tag_waddr    : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1 downto 0);
      dcache_tag_wdata       : out   std_logic_vector(REGISTER_SIZE-log2(DCACHE_SIZE)+DCACHE_DIRTY_BITS downto 0);
  
      dcache_data_renable : out std_logic;
      dcache_data_raddr     : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)+log2(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      dcache_data_rdata        : in    std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0);
      dcache_data_wenable : out std_logic;
      dcache_data_waddr    : out   std_logic_vector(log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)+log2(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1 downto 0);
      dcache_data_wstrb : out   std_logic_vector((DCACHE_EXTERNAL_WIDTH/8)-1 downto 0);
      dcache_data_wdata       : out   std_logic_vector(DCACHE_EXTERNAL_WIDTH-1 downto 0)
      );
  end component ERVP_ORCA_MEMORY_INTERFACE;

end package rv_components;
