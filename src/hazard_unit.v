`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 04:55:12 PM
// Design Name: 
// Module Name: hazard_unit
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


module hazard_unit(ID_EXRd,IF_IDRt,IF_IDRs,ID_EXMemRead,PCWrite,IF_IDWrite,st);
input [3:0]ID_EXRd,IF_IDRt,IF_IDRs;
input ID_EXMemRead;
output reg PCWrite,IF_IDWrite,st;

always@(*)
begin
    st=1'b0;
    PCWrite=1'b1;
    IF_IDWrite=1'b1;
    
    if((ID_EXMemRead==1) && ((ID_EXRd==IF_IDRs) || (ID_EXRd==IF_IDRt)))//LW check and dest reg or source match
        begin
            st=1'b1;
            PCWrite=1'b0;
            IF_IDWrite=1'b0;
        end
    else
        begin
            st=1'b0;
            PCWrite=1'b1;
            IF_IDWrite=1'b1;
        end
end

 
endmodule
