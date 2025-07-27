`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:25:25 PM
// Design Name: 
// Module Name: Regfile
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


module Regfile(clk,rst,Rr1,Rr2,Wreg,Wdata,RegWrite,Rdata1,Rdata2

    );
    input clk,rst;
    input [3:0] Rr1,Rr2,Wreg;
    input [31:0]Wdata;
    input RegWrite;
    output reg [31:0] Rdata1,Rdata2;
    
    reg [31:0]r[31:0];
        integer i;
        
     initial
        begin
            r[0]=32'd0;
          r[1]=32'd0;
          r[2]=32'h00010013;
          r[3]=32'h00001ba2;
          r[4]=32'd0;
          r[5]=32'h000234cf;
          r[6]=32'h000234cb;
          r[7]=32'd0;
          r[8]=32'd0;
          r[9]=32'h00054231;
          r[10]=32'd0;
          r[11]=32'd0;
          
        end
    
    always@(*)
    begin
        
        Rdata1<=r[Rr1];
        
        Rdata2<=r[Rr2];
    end
    always@(negedge clk)
    begin
        if(RegWrite)
                begin
                    r[Wreg]=Wdata;
                end
    end
    
endmodule
