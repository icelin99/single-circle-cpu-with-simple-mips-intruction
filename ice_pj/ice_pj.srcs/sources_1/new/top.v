`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 15:48:36
// Design Name: 
// Module Name: top
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


module top(
    input clk, reset, 
    output [31:0] writedata, dataadr,
    output memwrite,
    output [31:0] pc, instr, readdata
    );
    
    //wire  [31:0] pc, instr, readdata;
    
    //instantiate processor and memories
    mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
    
    instMem imem(pc[7:2], instr);
    dataMem dmem(clk, memwrite, dataadr, writedata, readdata);
endmodule
