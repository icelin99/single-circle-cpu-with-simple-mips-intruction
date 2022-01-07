`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 09:56:18
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,b,
    input [2:0] control,
    output reg [31:0] result,
    output reg zero
    );
    //reg [31:0] result;
    always@(*)
        begin
            case(control)
                3'b000: result <= a&b; // and
                3'b001: result <= a|b;  //or
                3'b010:begin
                             result <=  a+b; // add
                             if(result[31] != a[31] && result[31] != b[31])
                                $display("add overflow");
                                //$stop;  //overflow
                       end
                3'b011: result <= b << a;  // sll
                3'b100: result <= b >>a;  // srl
                3'b101: result <= a|~b;  // xor
                3'b110:begin
                            result <= a-b;  //sub
                            if((a[31] != b[31] && result[31]==b[31]) || (a!=b && result ==0))
                                $display("sub overflow");
                                //$stop;
                       end
                3'b111: case({a[31],b[31]})  //slt
                            2'b00: result <= (a<b) ? 1:0;//both positive
                            2'b01: result <=0; // a is positive, b is negative
                            2'b10: result <=1;
                            2'b11: result <= (a>b)? 1:0; // both negative
                        endcase
            endcase   
            zero = (result == 0)? 1:0;
        end
        
        //assign aluout = result;
endmodule
