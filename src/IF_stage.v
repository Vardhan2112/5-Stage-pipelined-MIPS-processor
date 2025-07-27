`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 07:45:24 PM
// Design Name: 
// Module Name: IF_stage
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


module IF_stage(clk,rst,PCWrite,inst);
input clk,rst;
input PCWrite;
output [31:0] inst;

wire pc4;
reg [31:0]pc;
wire [31:0]pcin/*next value*/,pcout/*current value*/;

always@(posedge clk or posedge rst)
begin
    if(rst)
        pc<=32'd0;
    else
        begin
            if(PCWrite)
                pc<=pc+4;//update on clk edge
        end
end
assign pc4=pcout+4;//then pc+4
assign pcin=pc4;//mux logic first



assign pcout=pc;

imem m(.clk(clk),.rst(rst),.in(inst),.EnIW(1'b1),.pc(pc));





endmodule

