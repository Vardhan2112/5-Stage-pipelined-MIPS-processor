`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 04:24:26 PM
// Design Name: 
// Module Name: EX
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


module EX(clk,rst,ext,rd1,rd2,ALUop,ALUSrc,EX_MEMALUres,MEM_WBres,FA,FB,ALUres);
input [31:0] rd1,rd2,ext;
input [1:0] ALUop;
input [1:0]FA,FB;
input [31:0]EX_MEMALUres,MEM_WBres;
input ALUSrc;
input clk,rst;
output [31:0] ALUres;

reg [31:0] b;
reg [31:0]a;
reg [31:0] b2;


always@(*) 
begin
    case(FA)
        2'b00:
            a=rd1;
        2'b10:
            a=EX_MEMALUres;
        2'b01:
            a=MEM_WBres;
    endcase
    
    case(FB)
        2'b00:
            b2=rd2;
        2'b10:
            b2=EX_MEMALUres;
        2'b01:
            b2=MEM_WBres;
    endcase
    
    b=ALUSrc?ext:b2;
end


ALU alu(clk,rst,ALUres,ALUop,a,b);




endmodule
