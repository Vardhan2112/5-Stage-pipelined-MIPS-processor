`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 07:22:16 PM
// Design Name: 
// Module Name: top
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


module top(clk,rst);
input clk,rst;

wire [31:0]inst;
wire PCWrite;

IF_stage if1(clk,rst,PCWrite,inst);

wire [31:0]in;
wire IF_IDWrite;

IF_ID if_id(clk,rst,inst,IF_IDWrite,in);

wire [31:0]Wdata,rd1,rd2,ext;
wire MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
wire [1:0]ALUop;
wire st;

ID  id(clk,rst,in,Wdata,st,rd1,rd2,ext,MemRead,MemtoReg,MemWrite,ALUSrc,ALUop,RegWrite);


wire [31:0]rd1ID,rd2ID,extID;
wire MemReadID,MemtoRegID,MemWriteID,ALUSrcID,RegWriteID;
wire [1:0]ALUopID;
wire [3:0]ID_EXRd,ID_EXRs,ID_EXRt;

ID_EX id_ex(clk,rst,rd1,rd2,ext,in[23:20],in[19:16],in[27:24],MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,ALUop,rd1ID,rd2ID,extID,ID_EXRs,ID_EXRt,ID_EXRd,MemReadID,MemtoRegID,MemWriteID,ALUSrcID,RegWriteID,ALUopID);

//hazard
hazard_unit  hu(ID_EXRd,in[19:16],in[23:20],MemReadID,PCWrite,IF_IDWrite,st);

wire [31:0]ALUres;
wire [1:0]FA,FB;
wire [3:0]EX_MEMRd,MEM_WBRd;
wire MemReadEX,MemWriteEX,MemtoRegEX,RegWriteEX;
wire MemtoRegMEM,RegWriteMEM;
wire [31:0]ALUresEX;

//fwd_unit
fwd_unit  fu(ID_EXRs,ID_EXRt,EX_MEMRd,MEM_WBRd,RegWriteEX,RegWriteMEM,FA,FB);

EX ex(clk,rst,extID,rd1ID,rd2ID,ALUopID,ALUSrcID,ALUresEX,Wdata,FA,FB,ALUres);



EX_MEM  ex_mem(clk,rst,ALUres,ID_EXRd,MemReadID,MemWriteID,MemtoRegID,RegWriteID,ALUresEX,EX_MEMRd,MemReadEX,MemWriteEX,MemtoRegEX,RegWriteEX);

wire [31:0]Rdata;

MEM mem(clk,rst,ALUresEX,32'd0,MemReadEX,MemWriteEX,Rdata);


wire [31:0]RdataMEM,ALUresMEM;

MEM_WB mem_wb(clk,rst,Rdata,ALUresEX,EX_MEMRd,MemtoRegEX,RegWriteEX,RdataMEM,ALUresMEM,MEM_WBRd,MemtoRegMEM,RegWriteMEM);

WB wb(clk,rst,RdataMEM,ALUresMEM,MEM_WBRd,RegWriteMEM,MemtoRegMEM,Wdata);



endmodule
