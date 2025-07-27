`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 06:06:50 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk,rst,Rdata,ALUres,EX_MEMRd,MemtoReg,RegWrite,RdataMEM,ALUresMEM,MEM_WBRd,MemtoRegMEM,RegWriteMEM);
input [31:0] Rdata,ALUres;
input clk,rst;
input [3:0]EX_MEMRd;
output reg [31:0]RdataMEM,ALUresMEM;
output reg [3:0]MEM_WBRd;
input MemtoReg,RegWrite;
output reg MemtoRegMEM,RegWriteMEM;

always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        MEM_WBRd<=0;
        RdataMEM<=0;
        ALUresMEM<=0;
        MemtoRegMEM<=0;
        RegWriteMEM<=0;
    end
    else
    begin
    MEM_WBRd<=EX_MEMRd;
    RdataMEM<=Rdata;
    ALUresMEM<=ALUres;
    MemtoRegMEM<=MemtoReg;
    RegWriteMEM<=RegWrite;
    end
end


endmodule
