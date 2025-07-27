`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 08:10:37 PM
// Design Name: 
// Module Name: tb
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


module tb();
    reg clk,rst;
top dut(clk,rst);

initial
    begin
    rst=1;
    #10;
    rst=0;
    end
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    initial begin
    #110;
    $finish;
   end

endmodule
