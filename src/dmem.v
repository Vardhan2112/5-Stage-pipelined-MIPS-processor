`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:20:54 PM
// Design Name: 
// Module Name: dmem
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


module Dmem(clk,rst,Rdata,MemWrite,MemRead,addr,Wdata);

input [31:0] Wdata,addr;
input MemWrite,MemRead;
output reg [31:0] Rdata;
input rst,clk;

reg [7:0]mem[24:0];

always@(*)
        begin
            mem[32'h00000000]=8'h00;
            mem[32'h00000001]=8'h23;
            mem[32'h00000002]=8'h18;
            mem[32'h00000003]=8'h22;
    
            mem[32'h00000004]=8'h00;
            mem[32'h00000005]=8'h86;
            mem[32'h00000006]=8'h00;
            mem[32'h00000007]=8'h14;
    
            mem[32'h00000008]=8'h04;
            mem[32'h00000009]=8'h00;
            mem[32'h0000000a]=8'h41;
            mem[32'h0000000b]=8'h28;
            
            mem[32'h0000000c]=8'hcc;
            mem[32'h0000000d]=8'hdd;
            
            if(MemRead)
            Rdata={mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]};
            
  
            
        end

always@(posedge clk or posedge rst)
begin
    if(MemWrite)
            begin
                mem[addr+3]=Wdata[31:24];
                mem[addr+2]=Wdata[23:16];
                mem[addr+1]=Wdata[15:8];
                mem[addr]=Wdata[7:0];
            end
end
endmodule
