`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 11:19:30
// Design Name: 
// Module Name: signext
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


module signext(
    input [15:0] a,
    input [1:0] signextsignal,
    output reg [31:0] y
    );
    always@(*)
        case(signextsignal)
            2'b00: y = {{16{a[15]}}, a};
            2'b10: y = {16'b0, a};
            2'b11: y = {16'b1111111111111111, a};
            default: y = {{16{a[15]}},a};
        endcase
endmodule
