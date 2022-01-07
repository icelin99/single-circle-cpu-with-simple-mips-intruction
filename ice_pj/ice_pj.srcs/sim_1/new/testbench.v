`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 17:42:43
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
    reg clk;
    reg reset;
    wire [31:0] writedata, dataadr;
    wire memwrite;
    wire [31:0] pc, instr, readdata;
    
    top top(clk, reset, writedata, dataadr, memwrite,pc, instr, readdata);
    
    initial #230 $finish;
    initial begin
        reset <= 1; 
        #2; reset <= 0;
        end
        
    always
        begin
            clk <= 1;
            #5; clk <= 0;
            #5;
        end
        
        // check result
    always@(negedge clk)
        begin 
            if(memwrite) begin
                if(dataadr == 84 && writedata == 7) begin
                    $display ("simulation succeed");
                    //$stop;
                end else if (dataadr != 80) begin
                    $display("simulation failed");
                    $stop;
                end
             end
        end
endmodule
