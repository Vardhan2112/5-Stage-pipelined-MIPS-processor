`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 04:41:14 PM
// Design Name: 
// Module Name: fwd_unit
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


module fwd_unit(ID_EXRs,ID_EXRt,EX_MEMRd,MEM_WBRd,EX_MEMRegWrite,MEM_WBRegWrite,FA,FB);

input [3:0] ID_EXRs,ID_EXRt,EX_MEMRd,MEM_WBRd;
input EX_MEMRegWrite,MEM_WBRegWrite;
output reg [1:0]FA,FB;

always@(*)
    begin
        FA=2'b00;
        FB=2'b00;
    //EX hazard
        if((EX_MEMRegWrite==1) && (EX_MEMRd!=0) && (EX_MEMRd==ID_EXRs))
            FA=2'b10;
        if((EX_MEMRegWrite==1) && (EX_MEMRd!=0) && (EX_MEMRd==ID_EXRt))
            FB=2'b10;
            
         //MEM hazard   
        if((MEM_WBRegWrite==1) && (MEM_WBRd!=0) && (MEM_WBRd==ID_EXRs))
            FA=2'b01;
        if((MEM_WBRegWrite==1) && (MEM_WBRd!=0) && (MEM_WBRd==ID_EXRt))
            FB=2'b01;
    end

endmodule
