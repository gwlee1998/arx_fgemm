`default_nettype wire
module frvp_spi_SPIPhysical_1
(
	input clock,
	input reset,
	output io_port_sck,
	input io_port_dq_0_i,
	output io_port_dq_0_o,
	output io_port_dq_0_oe,
	input io_port_dq_1_i,
	output io_port_dq_1_o,
	output io_port_dq_1_oe,
	input io_port_dq_2_i,
	output io_port_dq_2_o,
	output io_port_dq_2_oe,
	input io_port_dq_3_i,
	output io_port_dq_3_o,
	output io_port_dq_3_oe,
	input [11:0] io_ctrl_sck_div,
	input io_ctrl_sck_pol,
	input io_ctrl_sck_pha,
	input [1:0] io_ctrl_fmt_proto,
	input io_ctrl_fmt_endian,
	input io_ctrl_fmt_iodir,
	input [11:0] io_ctrl_extradel_coarse,
	input [4:0] io_ctrl_sampledel_sd,
	output io_op_ready,
	input io_op_valid,
	input io_op_bits_fn,
	input io_op_bits_stb,
	input [7:0] io_op_bits_cnt,
	input [7:0] io_op_bits_data,
	output io_rx_valid,
	output [7:0] io_rx_bits
);
  reg [11:0] ctrl_sck_div;
reg [31:0] _RAND_0;
  reg  ctrl_sck_pol;
reg [31:0] _RAND_1;
  reg  ctrl_sck_pha;
reg [31:0] _RAND_2;
  reg [1:0] ctrl_fmt_proto;
reg [31:0] _RAND_3;
  reg  ctrl_fmt_endian;
reg [31:0] _RAND_4;
  reg  ctrl_fmt_iodir;
reg [31:0] _RAND_5;
  wire  proto_0;
wire  proto_1;
wire  proto_2;
reg  setup_d;
reg [31:0] _RAND_6;
  reg [7:0] scnt;
reg [31:0] _RAND_7;
  reg [11:0] tcnt;
reg [31:0] _RAND_8;
  wire  stop;
wire  beat;
wire [11:0] _GEN_74;
wire [11:0] totalCoarseDel;
reg [11:0] del_cntr;
reg [31:0] _RAND_9;
  reg  sample_d;
reg [31:0] _RAND_10;
  reg  xfr;
reg [31:0] _RAND_11;
  reg  cref;
reg [31:0] _RAND_12;
  wire  _GEN_8;
wire  _GEN_13;
wire  sample;
wire  _T_46;
wire  _T_47;
wire [12:0] _T_48;
wire [12:0] _T_49;
wire [11:0] _T_50;
wire  _T_51;
reg [11:0] del_cntr_last;
reg [31:0] _RAND_13;
  reg  last_d;
reg [31:0] _RAND_14;
  wire  _T_181;
wire  _T_182;
wire  _T_183;
wire  last;
wire  _T_54;
wire  _T_55;
wire [12:0] _T_56;
wire [12:0] _T_57;
wire [11:0] _T_58;
wire  _T_59;
wire [11:0] _T_60;
wire [12:0] _T_61;
wire [12:0] _T_62;
wire [11:0] decr;
wire  sched;
reg  sck;
reg [31:0] _RAND_15;
  wire  cinv;
wire [1:0] _T_67;
wire [1:0] _T_68;
wire [3:0] rxd;
wire  rxd_delayed_0;
wire  rxd_delayed_1;
wire  rxd_delayed_2;
wire  rxd_delayed_3;
wire [1:0] _T_82;
wire [1:0] _T_83;
wire [3:0] rxd_fin;
wire  samples_0;
wire [1:0] samples_1;
reg [7:0] buffer;
reg [31:0] _RAND_16;
  wire  _T_84;
wire  _T_85;
wire  _T_86;
wire  _T_87;
wire  _T_88;
wire  _T_89;
wire  _T_90;
wire  _T_91;
wire  _T_92;
wire [1:0] _T_93;
wire [1:0] _T_94;
wire [3:0] _T_95;
wire [1:0] _T_96;
wire [1:0] _T_97;
wire [3:0] _T_98;
wire [7:0] _T_99;
wire [7:0] buffer_in;
wire  _T_100;
wire  _T_101;
wire  _T_102;
wire  shift;
wire [6:0] _T_103;
wire [6:0] _T_104;
wire [6:0] _T_105;
wire  _T_106;
wire  _T_107;
wire [7:0] _T_108;
wire [5:0] _T_109;
wire [5:0] _T_110;
wire [5:0] _T_111;
wire [1:0] _T_112;
wire [1:0] _T_113;
wire [7:0] _T_114;
wire [3:0] _T_115;
wire [3:0] _T_116;
wire [3:0] _T_117;
wire [3:0] _T_119;
wire [7:0] _T_120;
wire [7:0] _T_122;
wire [7:0] _T_123;
wire [7:0] _T_124;
wire [7:0] _T_125;
wire [7:0] _T_126;
reg [3:0] txd;
reg [31:0] _RAND_17;
  wire [3:0] _T_130;
wire  _T_184;
wire  _T_185;
wire  _GEN_23;
wire  accept;
wire [3:0] txd_in;
wire [1:0] _T_132;
wire  txd_sel_0;
wire  txd_sel_1;
wire  txd_sel_2;
wire  txd_shf_0;
wire [1:0] txd_shf_1;
wire  _T_134;
wire [1:0] _T_135;
wire [3:0] _T_136;
wire [1:0] _GEN_75;
wire [1:0] _T_137;
wire [3:0] _GEN_76;
wire [3:0] _T_138;
reg  done;
reg [31:0] _RAND_18;
  wire  _T_186;
wire  _T_187;
wire  _GEN_9;
wire  _GEN_14;
wire  _GEN_21;
wire  _GEN_24;
wire  _GEN_28;
wire  _GEN_43;
wire  _GEN_56;
wire  setup;
wire  _T_141;
wire  txen_2;
wire  txen_1;
wire  _T_158;
wire  _T_159;
wire  _T_161;
wire  _T_162;
wire  _T_163;
wire  _T_164;
wire  _T_165;
wire  _T_166;
wire  _T_167;
wire [1:0] _T_168;
wire [1:0] _T_169;
wire [3:0] _T_170;
wire [1:0] _T_171;
wire [1:0] _T_172;
wire [3:0] _T_173;
wire [7:0] _T_174;
wire  _T_178;
wire  _GEN_7;
wire [11:0] _GEN_10;
wire  _GEN_12;
wire [11:0] _GEN_15;
wire  _GEN_19;
wire [11:0] _GEN_22;
wire  _T_188;
wire [11:0] _GEN_49;
wire [11:0] _GEN_62;
assign proto_0 = 2'h0 == ctrl_fmt_proto;
assign proto_1 = 2'h1 == ctrl_fmt_proto;
assign proto_2 = 2'h2 == ctrl_fmt_proto;
assign stop = scnt == 8'h0;
assign beat = tcnt == 12'h0;
assign _GEN_74 = {{7'd0}, io_ctrl_sampledel_sd};
assign totalCoarseDel = io_ctrl_extradel_coarse + _GEN_74;
assign _GEN_8 = xfr ? cref : 1'h0;
assign _GEN_13 = beat ? _GEN_8 : 1'h0;
assign sample = stop ? 1'h0 : _GEN_13;
assign _T_46 = beat & sample;
assign _T_47 = del_cntr != 12'h0;
assign _T_48 = del_cntr - 12'h1;
assign _T_49 = $unsigned(_T_48);
assign _T_50 = _T_49[11:0];
assign _T_51 = del_cntr == 12'h1;
assign _T_181 = scnt == 8'h1;
assign _T_182 = beat & cref;
assign _T_183 = _T_182 & xfr;
assign last = _T_181 ? _T_183 : 1'h0;
assign _T_54 = beat & last;
assign _T_55 = del_cntr_last != 12'h0;
assign _T_56 = del_cntr_last - 12'h1;
assign _T_57 = $unsigned(_T_56);
assign _T_58 = _T_57[11:0];
assign _T_59 = del_cntr_last == 12'h1;
assign _T_60 = beat ? {{4'd0}, scnt} : tcnt;
assign _T_61 = _T_60 - 12'h1;
assign _T_62 = $unsigned(_T_61);
assign decr = _T_62[11:0];
assign sched = stop ? 1'h1 : beat;
assign cinv = ctrl_sck_pha ^ ctrl_sck_pol;
assign _T_67 = {io_port_dq_1_i,io_port_dq_0_i};
assign _T_68 = {io_port_dq_3_i,io_port_dq_2_i};
assign rxd = {_T_68,_T_67};
assign rxd_delayed_0 = rxd[0];
assign rxd_delayed_1 = rxd[1];
assign rxd_delayed_2 = rxd[2];
assign rxd_delayed_3 = rxd[3];
assign _T_82 = {rxd_delayed_1,rxd_delayed_0};
assign _T_83 = {rxd_delayed_3,rxd_delayed_2};
assign rxd_fin = {_T_83,_T_82};
assign samples_0 = rxd_fin[1];
assign samples_1 = rxd_fin[1:0];
assign _T_84 = io_ctrl_fmt_endian == 1'h0;
assign _T_85 = io_op_bits_data[0];
assign _T_86 = io_op_bits_data[1];
assign _T_87 = io_op_bits_data[2];
assign _T_88 = io_op_bits_data[3];
assign _T_89 = io_op_bits_data[4];
assign _T_90 = io_op_bits_data[5];
assign _T_91 = io_op_bits_data[6];
assign _T_92 = io_op_bits_data[7];
assign _T_93 = {_T_91,_T_92};
assign _T_94 = {_T_89,_T_90};
assign _T_95 = {_T_94,_T_93};
assign _T_96 = {_T_87,_T_88};
assign _T_97 = {_T_85,_T_86};
assign _T_98 = {_T_97,_T_96};
assign _T_99 = {_T_98,_T_95};
assign buffer_in = _T_84 ? io_op_bits_data : _T_99;
assign _T_100 = totalCoarseDel > 12'h0;
assign _T_101 = sample_d & stop;
assign _T_102 = setup_d | _T_101;
assign shift = _T_100 ? _T_102 : sample_d;
assign _T_103 = buffer[6:0];
assign _T_104 = buffer[7:1];
assign _T_105 = shift ? _T_103 : _T_104;
assign _T_106 = buffer[0];
assign _T_107 = sample_d ? samples_0 : _T_106;
assign _T_108 = {_T_105,_T_107};
assign _T_109 = buffer[5:0];
assign _T_110 = buffer[7:2];
assign _T_111 = shift ? _T_109 : _T_110;
assign _T_112 = buffer[1:0];
assign _T_113 = sample_d ? samples_1 : _T_112;
assign _T_114 = {_T_111,_T_113};
assign _T_115 = buffer[3:0];
assign _T_116 = buffer[7:4];
assign _T_117 = shift ? _T_115 : _T_116;
assign _T_119 = sample_d ? rxd_fin : _T_115;
assign _T_120 = {_T_117,_T_119};
assign _T_122 = proto_0 ? _T_108 : 8'h0;
assign _T_123 = proto_1 ? _T_114 : 8'h0;
assign _T_124 = proto_2 ? _T_120 : 8'h0;
assign _T_125 = _T_122 | _T_123;
assign _T_126 = _T_125 | _T_124;
assign _T_130 = buffer_in[7:4];
assign _T_184 = cref == 1'h0;
assign _T_185 = beat & _T_184;
assign _GEN_23 = _T_185 ? 1'h1 : stop;
assign accept = _T_181 ? _GEN_23 : stop;
assign txd_in = accept ? _T_130 : _T_116;
assign _T_132 = accept ? io_ctrl_fmt_proto : ctrl_fmt_proto;
assign txd_sel_0 = 2'h0 == _T_132;
assign txd_sel_1 = 2'h1 == _T_132;
assign txd_sel_2 = 2'h2 == _T_132;
assign txd_shf_0 = txd_in[3];
assign txd_shf_1 = txd_in[3:2];
assign _T_134 = txd_sel_0 ? txd_shf_0 : 1'h0;
assign _T_135 = txd_sel_1 ? txd_shf_1 : 2'h0;
assign _T_136 = txd_sel_2 ? txd_in : 4'h0;
assign _GEN_75 = {{1'd0}, _T_134};
assign _T_137 = _GEN_75 | _T_135;
assign _GEN_76 = {{2'd0}, _T_137};
assign _T_138 = _GEN_76 | _T_136;
assign _T_186 = accept & done;
assign _T_187 = 1'h0 == io_op_bits_fn;
assign _GEN_9 = xfr ? _T_184 : 1'h0;
assign _GEN_14 = beat ? _GEN_9 : 1'h0;
assign _GEN_21 = stop ? 1'h0 : _GEN_14;
assign _GEN_24 = _T_185 ? 1'h0 : _GEN_21;
assign _GEN_28 = _T_181 ? _GEN_24 : _GEN_21;
assign _GEN_43 = _T_187 ? 1'h1 : _GEN_28;
assign _GEN_56 = io_op_valid ? _GEN_43 : _GEN_28;
assign setup = _T_186 ? _GEN_56 : _GEN_28;
assign _T_141 = proto_1 & ctrl_fmt_iodir;
assign txen_2 = proto_2 & ctrl_fmt_iodir;
assign txen_1 = _T_141 | txen_2;
assign _T_158 = done | last_d;
assign _T_159 = ctrl_fmt_endian == 1'h0;
assign _T_161 = buffer[1];
assign _T_162 = buffer[2];
assign _T_163 = buffer[3];
assign _T_164 = buffer[4];
assign _T_165 = buffer[5];
assign _T_166 = buffer[6];
assign _T_167 = buffer[7];
assign _T_168 = {_T_166,_T_167};
assign _T_169 = {_T_164,_T_165};
assign _T_170 = {_T_169,_T_168};
assign _T_171 = {_T_162,_T_163};
assign _T_172 = {_T_106,_T_161};
assign _T_173 = {_T_172,_T_171};
assign _T_174 = {_T_173,_T_170};
assign _T_178 = cref ^ cinv;
assign _GEN_7 = xfr ? _T_178 : sck;
assign _GEN_10 = _T_184 ? decr : {{4'd0}, scnt};
assign _GEN_12 = beat ? _GEN_7 : sck;
assign _GEN_15 = beat ? _GEN_10 : {{4'd0}, scnt};
assign _GEN_19 = stop ? sck : _GEN_12;
assign _GEN_22 = stop ? {{4'd0}, scnt} : _GEN_15;
assign _T_188 = io_op_bits_cnt == 8'h0;
assign _GEN_49 = io_op_valid ? {{4'd0}, io_op_bits_cnt} : _GEN_22;
assign _GEN_62 = _T_186 ? _GEN_49 : _GEN_22;
assign io_port_sck = sck;
assign io_port_dq_0_o = txd[0];
assign io_port_dq_0_oe = proto_0 | txen_1;
assign io_port_dq_1_o = txd[1];
assign io_port_dq_1_oe = _T_141 | txen_2;
assign io_port_dq_2_o = txd[2];
assign io_port_dq_2_oe = proto_2 & ctrl_fmt_iodir;
assign io_port_dq_3_o = txd[3];
assign io_port_dq_3_oe = proto_2 & ctrl_fmt_iodir;
assign io_op_ready = accept & done;
assign io_rx_valid = done;
assign io_rx_bits = _T_159 ? buffer : _T_174;
	
always @(posedge clock, posedge reset) begin
  if (reset) begin
    ctrl_sck_div <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (!(_T_187)) begin
        if (io_op_bits_fn) begin
          if (io_op_bits_stb) begin
            ctrl_sck_div <= io_ctrl_sck_div;
          end
        end
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    ctrl_sck_pol <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (!(_T_187)) begin
        if (io_op_bits_fn) begin
          if (io_op_bits_stb) begin
            ctrl_sck_pol <= io_ctrl_sck_pol;
          end
        end
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    ctrl_sck_pha <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (!(_T_187)) begin
        if (io_op_bits_fn) begin
          if (io_op_bits_stb) begin
            ctrl_sck_pha <= io_ctrl_sck_pha;
          end
        end
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    ctrl_fmt_proto <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (io_op_bits_stb) begin
        ctrl_fmt_proto <= io_ctrl_fmt_proto;
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    ctrl_fmt_endian <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (io_op_bits_stb) begin
        ctrl_fmt_endian <= io_ctrl_fmt_endian;
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    ctrl_fmt_iodir <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (io_op_bits_stb) begin
        ctrl_fmt_iodir <= io_ctrl_fmt_iodir;
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    setup_d <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (_T_187) begin
        setup_d <= 1'h1;
      end else begin
        if (_T_181) begin
          if (_T_185) begin
            setup_d <= 1'h0;
          end else begin
            if (stop) begin
              setup_d <= 1'h0;
            end else begin
              if (beat) begin
                if (xfr) begin
                  setup_d <= _T_184;
                end else begin
                  setup_d <= 1'h0;
                end
              end else begin
                setup_d <= 1'h0;
              end
            end
          end
        end else begin
          if (stop) begin
            setup_d <= 1'h0;
          end else begin
            if (beat) begin
              if (xfr) begin
                setup_d <= _T_184;
              end else begin
                setup_d <= 1'h0;
              end
            end else begin
              setup_d <= 1'h0;
            end
          end
        end
      end
    end else begin
      if (_T_181) begin
        if (_T_185) begin
          setup_d <= 1'h0;
        end else begin
          if (stop) begin
            setup_d <= 1'h0;
          end else begin
            if (beat) begin
              if (xfr) begin
                setup_d <= _T_184;
              end else begin
                setup_d <= 1'h0;
              end
            end else begin
              setup_d <= 1'h0;
            end
          end
        end
      end else begin
        if (stop) begin
          setup_d <= 1'h0;
        end else begin
          if (beat) begin
            if (xfr) begin
              setup_d <= _T_184;
            end else begin
              setup_d <= 1'h0;
            end
          end else begin
            setup_d <= 1'h0;
          end
        end
      end
    end
  end else begin
    if (_T_181) begin
      if (_T_185) begin
        setup_d <= 1'h0;
      end else begin
        setup_d <= _GEN_21;
      end
    end else begin
      setup_d <= _GEN_21;
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    scnt <= 8'h0;
  end else begin
    scnt <= _GEN_62[7:0];
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    tcnt <= 0;
  end
  else if (sched) begin
    tcnt <= ctrl_sck_div;
  end else begin
    tcnt <= decr;
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    del_cntr <= 12'h4;
  end else begin
    if (_T_47) begin
      del_cntr <= _T_50;
    end else begin
      if (_T_46) begin
        del_cntr <= totalCoarseDel;
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    sample_d <= 1'h0;
  end else begin
    sample_d <= _T_51;
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    xfr <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      xfr <= _T_187;
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    cref <= 1'h1;
  end else begin
    if (!(stop)) begin
      if (beat) begin
        cref <= _T_184;
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    del_cntr_last <= 12'h4;
  end else begin
    if (_T_55) begin
      del_cntr_last <= _T_58;
    end else begin
      if (_T_54) begin
        del_cntr_last <= totalCoarseDel;
      end
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    last_d <= 1'h0;
  end else begin
    last_d <= _T_59;
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    sck <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (_T_187) begin
        sck <= cinv;
      end else begin
        if (io_op_bits_fn) begin
          if (io_op_bits_stb) begin
            sck <= io_ctrl_sck_pol;
          end else begin
            if (_T_181) begin
              if (_T_185) begin
                sck <= ctrl_sck_pol;
              end else begin
                if (!(stop)) begin
                  if (beat) begin
                    if (xfr) begin
                      sck <= _T_178;
                    end
                  end
                end
              end
            end else begin
              if (!(stop)) begin
                if (beat) begin
                  if (xfr) begin
                    sck <= _T_178;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_181) begin
            if (_T_185) begin
              sck <= ctrl_sck_pol;
            end else begin
              if (!(stop)) begin
                if (beat) begin
                  if (xfr) begin
                    sck <= _T_178;
                  end
                end
              end
            end
          end else begin
            if (!(stop)) begin
              if (beat) begin
                if (xfr) begin
                  sck <= _T_178;
                end
              end
            end
          end
        end
      end
    end else begin
      if (_T_181) begin
        if (_T_185) begin
          sck <= ctrl_sck_pol;
        end else begin
          sck <= _GEN_19;
        end
      end else begin
        sck <= _GEN_19;
      end
    end
  end else begin
    if (_T_181) begin
      if (_T_185) begin
        sck <= ctrl_sck_pol;
      end else begin
        sck <= _GEN_19;
      end
    end else begin
      sck <= _GEN_19;
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    buffer <= 0;
  end
  else if (_T_186) begin
    if (io_op_valid) begin
      if (_T_187) begin
        if (_T_84) begin
          buffer <= io_op_bits_data;
        end else begin
          buffer <= _T_99;
        end
      end else begin
        buffer <= _T_126;
      end
    end else begin
      buffer <= _T_126;
    end
  end else begin
    buffer <= _T_126;
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    txd <= 4'h0;
  end else begin
    if (setup) begin
      txd <= _T_138;
    end
  end
end
always @(posedge clock, posedge reset) begin
  if (reset) begin
    done <= 1'h1;
  end else begin
    if (_T_186) begin
      if (io_op_valid) begin
        if (_T_187) begin
          done <= _T_188;
        end else begin
          done <= _T_158;
        end
      end else begin
        done <= _T_158;
      end
    end else begin
      done <= _T_158;
    end
  end
end
endmodule
