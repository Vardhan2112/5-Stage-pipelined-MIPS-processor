`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 05:56:07 PM
// Design Name: 
// Module Name: MEM
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


module MEM(clk,rst,ALUres,wdata,MemRead,MemWrite,Rdata);

input [31:0] ALUres,wdata;
input clk,rst;
input MemRead,MemWrite;
output [31:0]Rdata;


Dmem d1(clk,rst,Rdata,MemWrite,MemRead,ALUres,wdata);


endmodule
