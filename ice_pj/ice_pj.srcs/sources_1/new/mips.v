`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 15:42:15
// Design Name: 
// Module Name: mips
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



module mips(
    input clk, reset,
    output [31:0] pc,
    input  [31:0] instr,
    output        memwrite,
    output [31:0] aluout, writedata,
    input  [31:0] readdata
    );
    
    wire  memtoreg, branch, pcsrc, zero, alusrc, regdst, regwrite, jump;
    wire [1:0] signextsignal;
    wire [2:0] alucontrol;
    
    controller  c(instr[31:26], instr[5:0], zero, 
                    memtoreg, memwrite, pcsrc, alusrc, 
                    regdst, regwrite, jump, alucontrol, signextsignal);
    
    datapath    dp(clk, reset, memtoreg, pcsrc, alusrc, 
                    regdst, regwrite, jump,
                    alucontrol, zero, pc, instr,
                    aluout, writedata, readdata, signextsignal);
endmodule
