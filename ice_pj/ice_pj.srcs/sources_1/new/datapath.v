`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 15:22:27
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input clk, reset,
    input memtoreg, pcsrc,
    input alusrc, regdst, 
    input regwrite, jump,
    input [2:0] alucontrol,
    output zero,
    output [31:0] pc,
    input [31:0] instr,
    output [31:0] aluout, writedata,
    input [31:0] readdata,
    input [1:0] signextsignal
    );
    wire [4:0] writereg;
    wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    wire [31:0] signimm, signimmsh;
    wire [31:0] srca, srcb;
    wire [31:0] result;
    
    // next pc signal
    flopr #(32) pcreg(clk, reset, pcnext, pc); // input pcnext, output pc = pcnext
    
    // pcplus4  = pc + 4
    adder       pcadd1(pc, 32'b100, pcplus4);
    
    // sign extend, signimm = {{16{instr[15]}, instr[15:0]}
    signext     se(instr[15:0], signextsignal, signimm);
    
    // shift left, signimmsh = signimm << 2
    sl2         immsh(signimm, signimmsh);
    
    // signimm shift left result + pcplus4 = pcbranch
    adder       pcadd2(pcplus4, signimmsh, pcbranch);
    
    //beq    if(rs == rt)  pcnextbr = pc+4 + (signimm<<2), else =pc+4
    mux2 #(32)  pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    //jump 
    mux2 #(32)  pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, 
                        jump, pcnext);
    
    regfile     rf(clk, regwrite, instr[25:21], instr[20:16], 
                    writereg, result, srca, writedata);  // result correspond to wd(writedata)
    
    //write reg number
    mux2 #(5)   wrmux(instr[20:16], instr[15:11], regdst, writereg);
    
    // if (memtoreg) result = readdata, else = aluout
    mux2 #(32)  resmux(aluout, readdata, memtoreg, result);
    
    // if(alusrc)   srcb = signimm, else = writedata
    mux2 #(32)  srcbmux(writedata, signimm, alusrc, srcb);
    
    alu         alu_(srca, srcb, alucontrol, aluout, zero); 
    
endmodule
