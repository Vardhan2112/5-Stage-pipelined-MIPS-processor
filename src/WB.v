`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 06:27:57 PM
// Design Name: 
// Module Name: WB
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


module WB(clk,rst,Rdata,ALUres,MEM_WBRd,RegWrite,MemtoReg,Wdata);
input clk,rst;
input [31:0]Rdata,ALUres;
input [3:0]MEM_WBRd;
input MemtoReg;
output [31:0]Wdata;
input RegWrite;

assign Wdata=MemtoReg?Rdata:ALUres;

Regfile  r2(clk,rst,4'd0,4'd0,MEM_WBRd,Wdata,RegWrite);

endmodule
