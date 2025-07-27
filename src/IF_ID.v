`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 04:14:11 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(clk,rst,inst,IF_IDWrite,in);
input clk,rst;
input [31:0]inst;
input IF_IDWrite;
output reg [31:0]in;

always@(posedge clk or posedge rst)
begin
if(rst)
    begin
        in<=0;
    end
    else
        if(IF_IDWrite)
        begin
            in<=inst;
        end
end

endmodule
