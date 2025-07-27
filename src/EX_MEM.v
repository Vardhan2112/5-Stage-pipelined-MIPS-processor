`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 03:41:26 PM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(clk,rst,ALUres,ID_EXRd,MemRead,MemWrite,MemtoReg,RegWrite,ALUresEX,EX_MEMRd,MemReadEX,MemWriteEX,MemtoRegEX,RegWriteEX);
input [31:0] ALUres;
input [3:0] ID_EXRd;
output reg [31:0] ALUresEX;
output reg [3:0] EX_MEMRd;
input clk,rst;
input MemRead,MemWrite,MemtoReg,RegWrite;
output reg MemReadEX,MemWriteEX,MemtoRegEX,RegWriteEX;


always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        ALUresEX<=0;
        EX_MEMRd<=0;
        MemReadEX<=0;
        MemWriteEX<=0;
        MemtoRegEX<=0;
        RegWriteEX<=0;
    end
    else
        begin;
        ALUresEX<=ALUres;
        EX_MEMRd<=ID_EXRd;
        MemReadEX<=MemRead;
        MemWriteEX<=MemWrite;
        MemtoRegEX<=MemtoReg;
        RegWriteEX<=RegWrite;
        end
end

endmodule
