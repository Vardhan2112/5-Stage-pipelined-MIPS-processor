`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:42:47 PM
// Design Name: 
// Module Name: ID
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


module ID(clk,rst,in,Wdata,st,rd1,rd2,ext,MemRead,MemtoReg,MemWrite,ALUSrc,ALUop,RegWrite);
input [31:0] in,Wdata;
input clk,rst;
input st;
output [31:0] rd1,rd2;
output reg [31:0] ext;
output  MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
output [1:0]ALUop;


Regfile  r1(clk,rst,in[23:20],in[19:16],in[27:24],Wdata,1'b0,rd1,rd2);
control c1(MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,ALUop,st,in[31:28]);

always@(*)
         begin
            if(in[15])
                begin
                    ext[31:16]=16'hffff;
                    ext[15:0]=in[15:0];
                end
            else
                begin
                    ext[31:16]=16'h0000;
                    ext[15:0]=in[15:0];
                end  
         end

endmodule
