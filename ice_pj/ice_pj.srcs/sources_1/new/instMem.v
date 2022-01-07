`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 10:38:27
// Design Name: 
// Module Name: instMem
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


module instMem(
    input [5:0] a,
    output [31:0] instr
    );
    reg [31:0] instRAM[63:0]; // no more than 16 instructions, 32*64
    
    initial begin
        $readmemh("C:/Users/lenovo/Desktop/ice_pj/memfile.dat", instRAM);
    end
    assign instr = instRAM[a];
endmodule
