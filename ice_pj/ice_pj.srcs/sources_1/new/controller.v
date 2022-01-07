`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/24 13:01:16
// Design Name: 
// Module Name: controller
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


module aludec(
    input [5:0] op,funct, // instr[31:26], instr[5:0]
    input [1:0] aluop,
    output reg [2:0] alucontrol
    );
    always@(*)
        case(aluop)
            2'b00: begin
                    alucontrol <= 3'b010; //add  (for sw, lw addi)
                    $display("sw/lw/addi");
                   end
            2'b01: begin
                    alucontrol <= 3'b110; // sub  (for beq)
                    $display("BEQ");
                   end
            default: 
                case(op)
                    6'b001101: alucontrol <= 3'b001; // ORI
                    6'b001100: alucontrol <=3'b000; // ANDI
                    6'b001010: alucontrol <= 3'b111; //SLTI
                
                    default: 
                        case(funct) // r-type 
                            6'b100000: alucontrol <= 3'b010; //add
                            6'b100010: alucontrol <= 3'b110;  //sub
                            6'b100100: alucontrol <= 3'b000;  //and
                            6'b100101: alucontrol <= 3'b001; //or
                            6'b101010: alucontrol<=3'b111; //slt
                            
                            default: alucontrol <= 3'bxxx; //???
                         endcase
                endcase
        endcase
endmodule


module maindec(
    input [5:0]op,funct,
    output memtoreg, memwrite,
    output wire branch, // if don't set wire, there will be 'Z' in simulation
    output alusrc,
    output regdst, regwrite,
    output jump,
    output [1:0] aluop,
    output [1:0] signextsignal
    );
    reg [8:0] controls;
    
    assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg,jump, aluop} = controls;
    
    always@(*)
        case(op)
            6'b000000: case(funct)
                        6'b000000: begin
                                    controls <= 9'b000000010;
                                    $display("Controller nop");
                                   end
                        default:   controls <= 9'b110000010;  //Rtype
                       endcase
            6'b100011: controls <= 9'b101001000; //lw
            6'b101011: controls <= 9'b001010000; //sw
            6'b000100: controls <= 9'b000100001;  //beq
            6'b001000: controls <= 9'b101000000; // addi
            6'b001100: controls <= 9'b101000011;  //andi
            6'b001101: controls <= 9'b101000011;  // ori
            6'b001010: controls <= 9'b101000011;  //slti
            6'b000010: controls <= 9'b000000100;  //j
            default: controls <=9'bxxxxxxxx; //???
        endcase
        assign signextsignal = (op == 6'b001100)? 2'b11: ((op==6'b001101)?2'b10:2'b00);
endmodule     

module controller(
    input [5:0] op, funct, // op = instr[31:26],  funct = instr[5:0]
    input zero,
    output memtoreg, memwrite,
    output pcsrc, alusrc,
    output regdst, regwrite,
    output jump,
    output [2:0] alucontrol,
    output [1:0] signextsignal
    );
    wire [1:0] aluop;
    wire branch;
    
    maindec md(op,funct, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop, signextsignal);
    aludec ad(op,funct, aluop, alucontrol);
    
    assign pcsrc = branch & zero;
endmodule
