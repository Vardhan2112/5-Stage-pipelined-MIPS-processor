`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:19:12 PM
// Design Name: 
// Module Name: imem
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 03:23:50 PM
// Design Name: 
// Module Name: Imem
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


module imem(
    clk,rst,in,EnIW,pc
    );
    input [31:0]pc;
    input EnIW;
    input clk,rst;
    output reg [31:0]in;
    reg [7:0]mem[23:0];
 
    initial
        begin
      //add r1,r2,r3
            mem[32'h00000000]=8'h01;
            mem[32'h00000001]=8'h23;
            mem[32'h00000002]=8'h00;
            mem[32'h00000003]=8'h00;
    
    //nandi r4,r1,cbed
            mem[32'h00000004]=8'h14;
            mem[32'h00000005]=8'h10;
            mem[32'h00000006]=8'hcb;
            mem[32'h00000007]=8'hed;
    
    //sub r7,r6,r5
            mem[32'h00000008]=8'h37;
            mem[32'h00000009]=8'h65;
            mem[32'h0000000a]=8'h00;
            mem[32'h0000000b]=8'h00;
            
   //lw r8,5(r7)
            mem[32'h0000000c]=8'h78;
            mem[32'h0000000d]=8'h70;
            mem[32'h0000000e]=8'h00;
            mem[32'h0000000f]=8'h05;
            
   //nor r10,r8,r9
             mem[32'h00000010]=8'hfa;
             mem[32'h00000011]=8'h89;
             mem[32'h00000012]=8'h00;
             mem[32'h00000013]=8'h00;  
           
            
               
            
        end
        
 always@(*)
 begin
 if(EnIW)
    begin
        in={mem[pc],mem[pc+1],mem[pc+2],mem[pc+3]};
    end
 end
    
endmodule

