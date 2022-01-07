`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 11:14:23
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input we,  // write enable
    input [4:0] ra1, ra2,
    input [4:0]wa,  // write address
    input [31:0] wd,  //write data
    output [31:0] rd1, rd2
    );
    
    reg [31:0] rf[31:0];
    
    always@(posedge clk)
        if(we)
            begin
                rf[wa] <= wd;
                $display("R%d = %h", wa, wd);
            end
    assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
    assign rd2 = (ra2 != 0) ? rf[ra2]: 0;
endmodule
