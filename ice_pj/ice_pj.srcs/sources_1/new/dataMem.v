`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 11:05:03
// Design Name: 
// Module Name: dataMem
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

// write data into dateMem
module dataMem(
    input clk, we,
    input [31:0] dataadr, writedata, 
    output [31:0] readdata
    );
    
    reg [31:0] dataRAM[63:0];
    assign readdata = dataRAM[dataadr[31:2]]; // word aligned
    
    always @(posedge clk)
        if(we) dataRAM[dataadr[31:2]] <= writedata;
endmodule
