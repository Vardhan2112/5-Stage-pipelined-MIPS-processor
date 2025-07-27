`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 04:19:56 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(clk,rst,rd1,rd2,ext,IF_IDRs,IF_IDRt,IF_IDRd,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,ALUop,rd1ID,rd2ID,extID,ID_EXRs,ID_EXRt,ID_EXRd,MemReadID,MemtoRegID,MemWriteID,ALUSrcID,RegWriteID,ALUopID);

input [31:0] ext,rd1,rd2;
input [3:0] IF_IDRs,IF_IDRt,IF_IDRd;
input clk,rst;
output reg [31:0] rd1ID,rd2ID,extID;
output reg [3:0] ID_EXRs,ID_EXRt,ID_EXRd;
input MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
input [1:0]ALUop;

output reg MemReadID,MemtoRegID,MemWriteID,ALUSrcID,RegWriteID;
output reg [1:0] ALUopID;


always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        rd1ID<=0;
        rd2ID<=0;
        extID<=0;
        ID_EXRs<=0;
        ID_EXRt<=0;
        ID_EXRd<=0;
        MemReadID<=0;
        MemtoRegID<=0;
        MemWriteID<=0;
        ALUSrcID<=0;
        RegWriteID<=0;
        ALUopID<=0;
    end
    else
    begin
    rd1ID<=rd1;
    rd2ID<=rd2;
    extID<=ext;
    ID_EXRs<=IF_IDRs;
    ID_EXRt<=IF_IDRt;
    ID_EXRd<=IF_IDRd;
    MemReadID<=MemRead;
    MemtoRegID<=MemtoReg;
    MemWriteID<=MemWrite;
    ALUSrcID<=ALUSrc;
    RegWriteID<=RegWrite;
    ALUopID<=ALUop;
    end
end

endmodule
