`default_nettype wire
`include "timescale.vh"
module Queue_18(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [2:0]  io_enq_bits_param,
  input  [3:0]  io_enq_bits_size,
  input  [3:0]  io_enq_bits_source,
  input  [31:0] io_enq_bits_address,
  input         io_enq_bits_user_amba_prot_bufferable,
  input         io_enq_bits_user_amba_prot_modifiable,
  input         io_enq_bits_user_amba_prot_readalloc,
  input         io_enq_bits_user_amba_prot_writealloc,
  input         io_enq_bits_user_amba_prot_privileged,
  input         io_enq_bits_user_amba_prot_secure,
  input         io_enq_bits_user_amba_prot_fetch,
  input  [3:0]  io_enq_bits_mask,
  input  [31:0] io_enq_bits_data,
  input         io_enq_bits_corrupt,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [2:0]  io_deq_bits_param,
  output [3:0]  io_deq_bits_size,
  output [3:0]  io_deq_bits_source,
  output [31:0] io_deq_bits_address,
  output        io_deq_bits_user_amba_prot_bufferable,
  output        io_deq_bits_user_amba_prot_modifiable,
  output        io_deq_bits_user_amba_prot_readalloc,
  output        io_deq_bits_user_amba_prot_writealloc,
  output        io_deq_bits_user_amba_prot_privileged,
  output        io_deq_bits_user_amba_prot_secure,
  output        io_deq_bits_user_amba_prot_fetch,
  output [3:0]  io_deq_bits_mask,
  output [31:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:1];
  wire  ram_opcode_io_deq_bits_MPORT_en;
  wire  ram_opcode_io_deq_bits_MPORT_addr;
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data;
  wire [2:0] ram_opcode_MPORT_data;
  wire  ram_opcode_MPORT_addr;
  wire  ram_opcode_MPORT_mask;
  wire  ram_opcode_MPORT_en;
  reg [2:0] ram_param [0:1];
  wire  ram_param_io_deq_bits_MPORT_en;
  wire  ram_param_io_deq_bits_MPORT_addr;
  wire [2:0] ram_param_io_deq_bits_MPORT_data;
  wire [2:0] ram_param_MPORT_data;
  wire  ram_param_MPORT_addr;
  wire  ram_param_MPORT_mask;
  wire  ram_param_MPORT_en;
  reg [3:0] ram_size [0:1];
  wire  ram_size_io_deq_bits_MPORT_en;
  wire  ram_size_io_deq_bits_MPORT_addr;
  wire [3:0] ram_size_io_deq_bits_MPORT_data;
  wire [3:0] ram_size_MPORT_data;
  wire  ram_size_MPORT_addr;
  wire  ram_size_MPORT_mask;
  wire  ram_size_MPORT_en;
  reg [3:0] ram_source [0:1];
  wire  ram_source_io_deq_bits_MPORT_en;
  wire  ram_source_io_deq_bits_MPORT_addr;
  wire [3:0] ram_source_io_deq_bits_MPORT_data;
  wire [3:0] ram_source_MPORT_data;
  wire  ram_source_MPORT_addr;
  wire  ram_source_MPORT_mask;
  wire  ram_source_MPORT_en;
  reg [31:0] ram_address [0:1];
  wire  ram_address_io_deq_bits_MPORT_en;
  wire  ram_address_io_deq_bits_MPORT_addr;
  wire [31:0] ram_address_io_deq_bits_MPORT_data;
  wire [31:0] ram_address_MPORT_data;
  wire  ram_address_MPORT_addr;
  wire  ram_address_MPORT_mask;
  wire  ram_address_MPORT_en;
  reg  ram_user_amba_prot_bufferable [0:1];
  wire  ram_user_amba_prot_bufferable_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_bufferable_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_bufferable_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_bufferable_MPORT_data;
  wire  ram_user_amba_prot_bufferable_MPORT_addr;
  wire  ram_user_amba_prot_bufferable_MPORT_mask;
  wire  ram_user_amba_prot_bufferable_MPORT_en;
  reg  ram_user_amba_prot_modifiable [0:1];
  wire  ram_user_amba_prot_modifiable_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_modifiable_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_modifiable_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_modifiable_MPORT_data;
  wire  ram_user_amba_prot_modifiable_MPORT_addr;
  wire  ram_user_amba_prot_modifiable_MPORT_mask;
  wire  ram_user_amba_prot_modifiable_MPORT_en;
  reg  ram_user_amba_prot_readalloc [0:1];
  wire  ram_user_amba_prot_readalloc_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_readalloc_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_readalloc_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_readalloc_MPORT_data;
  wire  ram_user_amba_prot_readalloc_MPORT_addr;
  wire  ram_user_amba_prot_readalloc_MPORT_mask;
  wire  ram_user_amba_prot_readalloc_MPORT_en;
  reg  ram_user_amba_prot_writealloc [0:1];
  wire  ram_user_amba_prot_writealloc_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_writealloc_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_writealloc_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_writealloc_MPORT_data;
  wire  ram_user_amba_prot_writealloc_MPORT_addr;
  wire  ram_user_amba_prot_writealloc_MPORT_mask;
  wire  ram_user_amba_prot_writealloc_MPORT_en;
  reg  ram_user_amba_prot_privileged [0:1];
  wire  ram_user_amba_prot_privileged_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_privileged_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_privileged_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_privileged_MPORT_data;
  wire  ram_user_amba_prot_privileged_MPORT_addr;
  wire  ram_user_amba_prot_privileged_MPORT_mask;
  wire  ram_user_amba_prot_privileged_MPORT_en;
  reg  ram_user_amba_prot_secure [0:1];
  wire  ram_user_amba_prot_secure_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_secure_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_secure_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_secure_MPORT_data;
  wire  ram_user_amba_prot_secure_MPORT_addr;
  wire  ram_user_amba_prot_secure_MPORT_mask;
  wire  ram_user_amba_prot_secure_MPORT_en;
  reg  ram_user_amba_prot_fetch [0:1];
  wire  ram_user_amba_prot_fetch_io_deq_bits_MPORT_en;
  wire  ram_user_amba_prot_fetch_io_deq_bits_MPORT_addr;
  wire  ram_user_amba_prot_fetch_io_deq_bits_MPORT_data;
  wire  ram_user_amba_prot_fetch_MPORT_data;
  wire  ram_user_amba_prot_fetch_MPORT_addr;
  wire  ram_user_amba_prot_fetch_MPORT_mask;
  wire  ram_user_amba_prot_fetch_MPORT_en;
  reg [3:0] ram_mask [0:1];
  wire  ram_mask_io_deq_bits_MPORT_en;
  wire  ram_mask_io_deq_bits_MPORT_addr;
  wire [3:0] ram_mask_io_deq_bits_MPORT_data;
  wire [3:0] ram_mask_MPORT_data;
  wire  ram_mask_MPORT_addr;
  wire  ram_mask_MPORT_mask;
  wire  ram_mask_MPORT_en;
  reg [31:0] ram_data [0:1];
  wire  ram_data_io_deq_bits_MPORT_en;
  wire  ram_data_io_deq_bits_MPORT_addr;
  wire [31:0] ram_data_io_deq_bits_MPORT_data;
  wire [31:0] ram_data_MPORT_data;
  wire  ram_data_MPORT_addr;
  wire  ram_data_MPORT_mask;
  wire  ram_data_MPORT_en;
  reg  ram_corrupt [0:1];
  wire  ram_corrupt_io_deq_bits_MPORT_en;
  wire  ram_corrupt_io_deq_bits_MPORT_addr;
  wire  ram_corrupt_io_deq_bits_MPORT_data;
  wire  ram_corrupt_MPORT_data;
  wire  ram_corrupt_MPORT_addr;
  wire  ram_corrupt_MPORT_mask;
  wire  ram_corrupt_MPORT_en;
  reg  value;
  reg  value_1;
  reg  maybe_full;
  wire  ptr_match = value == value_1;
  wire  empty = ptr_match & ~maybe_full;
  wire  full = ptr_match & maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  assign ram_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_opcode_io_deq_bits_MPORT_addr = value_1;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr];
  assign ram_opcode_MPORT_data = io_enq_bits_opcode;
  assign ram_opcode_MPORT_addr = value;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_param_io_deq_bits_MPORT_en = 1'h1;
  assign ram_param_io_deq_bits_MPORT_addr = value_1;
  assign ram_param_io_deq_bits_MPORT_data = ram_param[ram_param_io_deq_bits_MPORT_addr];
  assign ram_param_MPORT_data = io_enq_bits_param;
  assign ram_param_MPORT_addr = value;
  assign ram_param_MPORT_mask = 1'h1;
  assign ram_param_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = value_1;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr];
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = value;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_source_io_deq_bits_MPORT_addr = value_1;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr];
  assign ram_source_MPORT_data = io_enq_bits_source;
  assign ram_source_MPORT_addr = value;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_address_io_deq_bits_MPORT_en = 1'h1;
  assign ram_address_io_deq_bits_MPORT_addr = value_1;
  assign ram_address_io_deq_bits_MPORT_data = ram_address[ram_address_io_deq_bits_MPORT_addr];
  assign ram_address_MPORT_data = io_enq_bits_address;
  assign ram_address_MPORT_addr = value;
  assign ram_address_MPORT_mask = 1'h1;
  assign ram_address_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_bufferable_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_bufferable_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_bufferable_io_deq_bits_MPORT_data =
    ram_user_amba_prot_bufferable[ram_user_amba_prot_bufferable_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_bufferable_MPORT_data = io_enq_bits_user_amba_prot_bufferable;
  assign ram_user_amba_prot_bufferable_MPORT_addr = value;
  assign ram_user_amba_prot_bufferable_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_bufferable_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_modifiable_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_modifiable_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_modifiable_io_deq_bits_MPORT_data =
    ram_user_amba_prot_modifiable[ram_user_amba_prot_modifiable_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_modifiable_MPORT_data = io_enq_bits_user_amba_prot_modifiable;
  assign ram_user_amba_prot_modifiable_MPORT_addr = value;
  assign ram_user_amba_prot_modifiable_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_modifiable_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_readalloc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_readalloc_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_readalloc_io_deq_bits_MPORT_data =
    ram_user_amba_prot_readalloc[ram_user_amba_prot_readalloc_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_readalloc_MPORT_data = io_enq_bits_user_amba_prot_readalloc;
  assign ram_user_amba_prot_readalloc_MPORT_addr = value;
  assign ram_user_amba_prot_readalloc_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_readalloc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_writealloc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_writealloc_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_writealloc_io_deq_bits_MPORT_data =
    ram_user_amba_prot_writealloc[ram_user_amba_prot_writealloc_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_writealloc_MPORT_data = io_enq_bits_user_amba_prot_writealloc;
  assign ram_user_amba_prot_writealloc_MPORT_addr = value;
  assign ram_user_amba_prot_writealloc_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_writealloc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_privileged_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_privileged_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_privileged_io_deq_bits_MPORT_data =
    ram_user_amba_prot_privileged[ram_user_amba_prot_privileged_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_privileged_MPORT_data = io_enq_bits_user_amba_prot_privileged;
  assign ram_user_amba_prot_privileged_MPORT_addr = value;
  assign ram_user_amba_prot_privileged_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_privileged_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_secure_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_secure_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_secure_io_deq_bits_MPORT_data =
    ram_user_amba_prot_secure[ram_user_amba_prot_secure_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_secure_MPORT_data = io_enq_bits_user_amba_prot_secure;
  assign ram_user_amba_prot_secure_MPORT_addr = value;
  assign ram_user_amba_prot_secure_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_secure_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_user_amba_prot_fetch_io_deq_bits_MPORT_en = 1'h1;
  assign ram_user_amba_prot_fetch_io_deq_bits_MPORT_addr = value_1;
  assign ram_user_amba_prot_fetch_io_deq_bits_MPORT_data =
    ram_user_amba_prot_fetch[ram_user_amba_prot_fetch_io_deq_bits_MPORT_addr];
  assign ram_user_amba_prot_fetch_MPORT_data = io_enq_bits_user_amba_prot_fetch;
  assign ram_user_amba_prot_fetch_MPORT_addr = value;
  assign ram_user_amba_prot_fetch_MPORT_mask = 1'h1;
  assign ram_user_amba_prot_fetch_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_mask_io_deq_bits_MPORT_en = 1'h1;
  assign ram_mask_io_deq_bits_MPORT_addr = value_1;
  assign ram_mask_io_deq_bits_MPORT_data = ram_mask[ram_mask_io_deq_bits_MPORT_addr];
  assign ram_mask_MPORT_data = io_enq_bits_mask;
  assign ram_mask_MPORT_addr = value;
  assign ram_mask_MPORT_mask = 1'h1;
  assign ram_mask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = value_1;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr];
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_corrupt_io_deq_bits_MPORT_en = 1'h1;
  assign ram_corrupt_io_deq_bits_MPORT_addr = value_1;
  assign ram_corrupt_io_deq_bits_MPORT_data = ram_corrupt[ram_corrupt_io_deq_bits_MPORT_addr];
  assign ram_corrupt_MPORT_data = io_enq_bits_corrupt;
  assign ram_corrupt_MPORT_addr = value;
  assign ram_corrupt_MPORT_mask = 1'h1;
  assign ram_corrupt_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_opcode = ram_opcode_io_deq_bits_MPORT_data;
  assign io_deq_bits_param = ram_param_io_deq_bits_MPORT_data;
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_source = ram_source_io_deq_bits_MPORT_data;
  assign io_deq_bits_address = ram_address_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_bufferable = ram_user_amba_prot_bufferable_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_modifiable = ram_user_amba_prot_modifiable_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_readalloc = ram_user_amba_prot_readalloc_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_writealloc = ram_user_amba_prot_writealloc_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_privileged = ram_user_amba_prot_privileged_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_secure = ram_user_amba_prot_secure_io_deq_bits_MPORT_data;
  assign io_deq_bits_user_amba_prot_fetch = ram_user_amba_prot_fetch_io_deq_bits_MPORT_data;
  assign io_deq_bits_mask = ram_mask_io_deq_bits_MPORT_data;
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data;
  assign io_deq_bits_corrupt = ram_corrupt_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data;
    end
    if (ram_param_MPORT_en & ram_param_MPORT_mask) begin
      ram_param[ram_param_MPORT_addr] <= ram_param_MPORT_data;
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data;
    end
    if (ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data;
    end
    if (ram_address_MPORT_en & ram_address_MPORT_mask) begin
      ram_address[ram_address_MPORT_addr] <= ram_address_MPORT_data;
    end
    if (ram_user_amba_prot_bufferable_MPORT_en & ram_user_amba_prot_bufferable_MPORT_mask) begin
      ram_user_amba_prot_bufferable[ram_user_amba_prot_bufferable_MPORT_addr] <=
        ram_user_amba_prot_bufferable_MPORT_data;
    end
    if (ram_user_amba_prot_modifiable_MPORT_en & ram_user_amba_prot_modifiable_MPORT_mask) begin
      ram_user_amba_prot_modifiable[ram_user_amba_prot_modifiable_MPORT_addr] <=
        ram_user_amba_prot_modifiable_MPORT_data;
    end
    if (ram_user_amba_prot_readalloc_MPORT_en & ram_user_amba_prot_readalloc_MPORT_mask) begin
      ram_user_amba_prot_readalloc[ram_user_amba_prot_readalloc_MPORT_addr] <= ram_user_amba_prot_readalloc_MPORT_data;
    end
    if (ram_user_amba_prot_writealloc_MPORT_en & ram_user_amba_prot_writealloc_MPORT_mask) begin
      ram_user_amba_prot_writealloc[ram_user_amba_prot_writealloc_MPORT_addr] <=
        ram_user_amba_prot_writealloc_MPORT_data;
    end
    if (ram_user_amba_prot_privileged_MPORT_en & ram_user_amba_prot_privileged_MPORT_mask) begin
      ram_user_amba_prot_privileged[ram_user_amba_prot_privileged_MPORT_addr] <=
        ram_user_amba_prot_privileged_MPORT_data;
    end
    if (ram_user_amba_prot_secure_MPORT_en & ram_user_amba_prot_secure_MPORT_mask) begin
      ram_user_amba_prot_secure[ram_user_amba_prot_secure_MPORT_addr] <= ram_user_amba_prot_secure_MPORT_data;
    end
    if (ram_user_amba_prot_fetch_MPORT_en & ram_user_amba_prot_fetch_MPORT_mask) begin
      ram_user_amba_prot_fetch[ram_user_amba_prot_fetch_MPORT_addr] <= ram_user_amba_prot_fetch_MPORT_data;
    end
    if (ram_mask_MPORT_en & ram_mask_MPORT_mask) begin
      ram_mask[ram_mask_MPORT_addr] <= ram_mask_MPORT_data;
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data;
    end
    if (ram_corrupt_MPORT_en & ram_corrupt_MPORT_mask) begin
      ram_corrupt[ram_corrupt_MPORT_addr] <= ram_corrupt_MPORT_data;
    end
    if (reset) begin
      value <= 1'h0;
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (do_deq) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_param[initvar] = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_source[initvar] = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_address[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_bufferable[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_modifiable[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_readalloc[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_writealloc[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_privileged[initvar] = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_secure[initvar] = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_user_amba_prot_fetch[initvar] = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_mask[initvar] = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_corrupt[initvar] = _RAND_14[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  value = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  value_1 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  maybe_full = _RAND_17[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule