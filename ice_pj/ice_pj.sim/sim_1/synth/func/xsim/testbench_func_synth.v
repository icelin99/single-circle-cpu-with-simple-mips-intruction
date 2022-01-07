// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
// Date        : Fri Dec 24 19:52:37 2021
// Host        : St-30 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/lenovo/ice_pj/ice_pj.sim/sim_1/synth/func/xsim/testbench_func_synth.v
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module datapath
   (ADDRB,
    dataadr_OBUF,
    clk_IBUF_BUFG);
  output [4:0]ADDRB;
  output [0:0]dataadr_OBUF;
  input clk_IBUF_BUFG;

  wire [4:0]ADDRB;
  wire clk_IBUF_BUFG;
  wire [0:0]dataadr_OBUF;

  regfile rf
       (.ADDRC(ADDRB),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .dataadr_OBUF(dataadr_OBUF));
endmodule

module mips
   (dataadr_OBUF,
    clk_IBUF_BUFG);
  output [5:0]dataadr_OBUF;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire [5:0]dataadr_OBUF;

  datapath dp
       (.ADDRB(dataadr_OBUF[4:0]),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .dataadr_OBUF(dataadr_OBUF[5]));
endmodule

module regfile
   (ADDRC,
    dataadr_OBUF,
    clk_IBUF_BUFG);
  output [4:0]ADDRC;
  output [0:0]dataadr_OBUF;
  input clk_IBUF_BUFG;

  wire [4:0]ADDRC;
  wire clk_IBUF_BUFG;
  wire [0:0]dataadr_OBUF;
  wire [31:0]rd20;
  wire rd21;
  wire [1:0]NLW_rf_reg_r2_0_31_30_31_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "mips/dp/rf/rf" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r2_0_31_30_31
       (.ADDRA(ADDRC),
        .ADDRB(ADDRC),
        .ADDRC(ADDRC),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIA({1'b0,1'b0}),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA({rd20[31],rd20[0]}),
        .DOB(rd20[3:2]),
        .DOC({rd20[29],rd20[4]}),
        .DOD(NLW_rf_reg_r2_0_31_30_31_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(1'b1));
  LUT2 #(
    .INIT(4'h8)) 
    \writedata_OBUF[26]_inst_i_1 
       (.I0(rd21),
        .I1(rd20[2]),
        .O(ADDRC[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \writedata_OBUF[27]_inst_i_1 
       (.I0(rd21),
        .I1(rd20[3]),
        .O(ADDRC[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \writedata_OBUF[28]_inst_i_1 
       (.I0(rd21),
        .I1(rd20[4]),
        .O(ADDRC[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \writedata_OBUF[29]_inst_i_1 
       (.I0(rd21),
        .I1(rd20[29]),
        .O(dataadr_OBUF));
  LUT2 #(
    .INIT(4'h8)) 
    \writedata_OBUF[30]_inst_i_1 
       (.I0(rd21),
        .I1(rd20[0]),
        .O(ADDRC[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \writedata_OBUF[31]_inst_i_1 
       (.I0(rd21),
        .I1(rd20[31]),
        .O(ADDRC[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \writedata_OBUF[31]_inst_i_2 
       (.I0(rd21),
        .I1(rd20[4]),
        .I2(rd20[3]),
        .I3(rd20[31]),
        .I4(rd20[0]),
        .I5(rd20[2]),
        .O(rd21));
endmodule

(* NotValidForBitStream *)
module top
   (clk,
    reset,
    writedata,
    dataadr,
    memwrite);
  input clk;
  input reset;
  output [31:0]writedata;
  output [31:0]dataadr;
  output memwrite;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]dataadr;
  wire [5:0]dataadr_OBUF;
  wire memwrite;
  wire [31:0]writedata;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \dataadr_OBUF[0]_inst 
       (.I(dataadr_OBUF[0]),
        .O(dataadr[0]));
  OBUF \dataadr_OBUF[10]_inst 
       (.I(dataadr_OBUF[4]),
        .O(dataadr[10]));
  OBUF \dataadr_OBUF[11]_inst 
       (.I(dataadr_OBUF[5]),
        .O(dataadr[11]));
  OBUF \dataadr_OBUF[12]_inst 
       (.I(dataadr_OBUF[0]),
        .O(dataadr[12]));
  OBUF \dataadr_OBUF[13]_inst 
       (.I(dataadr_OBUF[1]),
        .O(dataadr[13]));
  OBUF \dataadr_OBUF[14]_inst 
       (.I(dataadr_OBUF[2]),
        .O(dataadr[14]));
  OBUF \dataadr_OBUF[15]_inst 
       (.I(dataadr_OBUF[3]),
        .O(dataadr[15]));
  OBUF \dataadr_OBUF[16]_inst 
       (.I(dataadr_OBUF[4]),
        .O(dataadr[16]));
  OBUF \dataadr_OBUF[17]_inst 
       (.I(dataadr_OBUF[5]),
        .O(dataadr[17]));
  OBUF \dataadr_OBUF[18]_inst 
       (.I(dataadr_OBUF[0]),
        .O(dataadr[18]));
  OBUF \dataadr_OBUF[19]_inst 
       (.I(dataadr_OBUF[1]),
        .O(dataadr[19]));
  OBUF \dataadr_OBUF[1]_inst 
       (.I(dataadr_OBUF[1]),
        .O(dataadr[1]));
  OBUF \dataadr_OBUF[20]_inst 
       (.I(dataadr_OBUF[2]),
        .O(dataadr[20]));
  OBUF \dataadr_OBUF[21]_inst 
       (.I(dataadr_OBUF[3]),
        .O(dataadr[21]));
  OBUF \dataadr_OBUF[22]_inst 
       (.I(dataadr_OBUF[4]),
        .O(dataadr[22]));
  OBUF \dataadr_OBUF[23]_inst 
       (.I(dataadr_OBUF[5]),
        .O(dataadr[23]));
  OBUF \dataadr_OBUF[24]_inst 
       (.I(dataadr_OBUF[0]),
        .O(dataadr[24]));
  OBUF \dataadr_OBUF[25]_inst 
       (.I(dataadr_OBUF[1]),
        .O(dataadr[25]));
  OBUF \dataadr_OBUF[26]_inst 
       (.I(dataadr_OBUF[2]),
        .O(dataadr[26]));
  OBUF \dataadr_OBUF[27]_inst 
       (.I(dataadr_OBUF[3]),
        .O(dataadr[27]));
  OBUF \dataadr_OBUF[28]_inst 
       (.I(dataadr_OBUF[4]),
        .O(dataadr[28]));
  OBUF \dataadr_OBUF[29]_inst 
       (.I(dataadr_OBUF[5]),
        .O(dataadr[29]));
  OBUF \dataadr_OBUF[2]_inst 
       (.I(dataadr_OBUF[2]),
        .O(dataadr[2]));
  OBUF \dataadr_OBUF[30]_inst 
       (.I(dataadr_OBUF[0]),
        .O(dataadr[30]));
  OBUF \dataadr_OBUF[31]_inst 
       (.I(dataadr_OBUF[1]),
        .O(dataadr[31]));
  OBUF \dataadr_OBUF[3]_inst 
       (.I(dataadr_OBUF[3]),
        .O(dataadr[3]));
  OBUF \dataadr_OBUF[4]_inst 
       (.I(dataadr_OBUF[4]),
        .O(dataadr[4]));
  OBUF \dataadr_OBUF[5]_inst 
       (.I(dataadr_OBUF[5]),
        .O(dataadr[5]));
  OBUF \dataadr_OBUF[6]_inst 
       (.I(dataadr_OBUF[0]),
        .O(dataadr[6]));
  OBUF \dataadr_OBUF[7]_inst 
       (.I(dataadr_OBUF[1]),
        .O(dataadr[7]));
  OBUF \dataadr_OBUF[8]_inst 
       (.I(dataadr_OBUF[2]),
        .O(dataadr[8]));
  OBUF \dataadr_OBUF[9]_inst 
       (.I(dataadr_OBUF[3]),
        .O(dataadr[9]));
  OBUF memwrite_OBUF_inst
       (.I(1'b0),
        .O(memwrite));
  mips mips
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .dataadr_OBUF(dataadr_OBUF));
  OBUF \writedata_OBUF[0]_inst 
       (.I(dataadr_OBUF[0]),
        .O(writedata[0]));
  OBUF \writedata_OBUF[10]_inst 
       (.I(dataadr_OBUF[4]),
        .O(writedata[10]));
  OBUF \writedata_OBUF[11]_inst 
       (.I(dataadr_OBUF[5]),
        .O(writedata[11]));
  OBUF \writedata_OBUF[12]_inst 
       (.I(dataadr_OBUF[0]),
        .O(writedata[12]));
  OBUF \writedata_OBUF[13]_inst 
       (.I(dataadr_OBUF[1]),
        .O(writedata[13]));
  OBUF \writedata_OBUF[14]_inst 
       (.I(dataadr_OBUF[2]),
        .O(writedata[14]));
  OBUF \writedata_OBUF[15]_inst 
       (.I(dataadr_OBUF[3]),
        .O(writedata[15]));
  OBUF \writedata_OBUF[16]_inst 
       (.I(dataadr_OBUF[4]),
        .O(writedata[16]));
  OBUF \writedata_OBUF[17]_inst 
       (.I(dataadr_OBUF[5]),
        .O(writedata[17]));
  OBUF \writedata_OBUF[18]_inst 
       (.I(dataadr_OBUF[0]),
        .O(writedata[18]));
  OBUF \writedata_OBUF[19]_inst 
       (.I(dataadr_OBUF[1]),
        .O(writedata[19]));
  OBUF \writedata_OBUF[1]_inst 
       (.I(dataadr_OBUF[1]),
        .O(writedata[1]));
  OBUF \writedata_OBUF[20]_inst 
       (.I(dataadr_OBUF[2]),
        .O(writedata[20]));
  OBUF \writedata_OBUF[21]_inst 
       (.I(dataadr_OBUF[3]),
        .O(writedata[21]));
  OBUF \writedata_OBUF[22]_inst 
       (.I(dataadr_OBUF[4]),
        .O(writedata[22]));
  OBUF \writedata_OBUF[23]_inst 
       (.I(dataadr_OBUF[5]),
        .O(writedata[23]));
  OBUF \writedata_OBUF[24]_inst 
       (.I(dataadr_OBUF[0]),
        .O(writedata[24]));
  OBUF \writedata_OBUF[25]_inst 
       (.I(dataadr_OBUF[1]),
        .O(writedata[25]));
  OBUF \writedata_OBUF[26]_inst 
       (.I(dataadr_OBUF[2]),
        .O(writedata[26]));
  OBUF \writedata_OBUF[27]_inst 
       (.I(dataadr_OBUF[3]),
        .O(writedata[27]));
  OBUF \writedata_OBUF[28]_inst 
       (.I(dataadr_OBUF[4]),
        .O(writedata[28]));
  OBUF \writedata_OBUF[29]_inst 
       (.I(dataadr_OBUF[5]),
        .O(writedata[29]));
  OBUF \writedata_OBUF[2]_inst 
       (.I(dataadr_OBUF[2]),
        .O(writedata[2]));
  OBUF \writedata_OBUF[30]_inst 
       (.I(dataadr_OBUF[0]),
        .O(writedata[30]));
  OBUF \writedata_OBUF[31]_inst 
       (.I(dataadr_OBUF[1]),
        .O(writedata[31]));
  OBUF \writedata_OBUF[3]_inst 
       (.I(dataadr_OBUF[3]),
        .O(writedata[3]));
  OBUF \writedata_OBUF[4]_inst 
       (.I(dataadr_OBUF[4]),
        .O(writedata[4]));
  OBUF \writedata_OBUF[5]_inst 
       (.I(dataadr_OBUF[5]),
        .O(writedata[5]));
  OBUF \writedata_OBUF[6]_inst 
       (.I(dataadr_OBUF[0]),
        .O(writedata[6]));
  OBUF \writedata_OBUF[7]_inst 
       (.I(dataadr_OBUF[1]),
        .O(writedata[7]));
  OBUF \writedata_OBUF[8]_inst 
       (.I(dataadr_OBUF[2]),
        .O(writedata[8]));
  OBUF \writedata_OBUF[9]_inst 
       (.I(dataadr_OBUF[3]),
        .O(writedata[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
