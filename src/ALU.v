`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:29:30 PM
// Design Name: 
// Module Name: ALU
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

module ALU(clk,rst,ALUresult,ALUop,a,b
    );
    input clk,rst;
    input [1:0] ALUop;
    input [31:0] a,b;
    output reg [31:0] ALUresult;

        
    always@(*)
    begin        
        case(ALUop)
            2'b00://add
                ALUresult=a+b;
            2'b01://sub
                ALUresult=a-b;
            2'b10://nand
                ALUresult=~(a&b);
            2'b11://nor
                ALUresult=~(a|b);
               
            //default:ALUresult<=0;
        endcase         
    end
endmodule
