`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 03:18:14 PM
// Design Name: 
// Module Name: ALUcontrol
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
// Create Date: 02/27/2025 04:35:28 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUcontrol(output reg [3:0] ALUctrl,
input [1:0] ALUop,
input [5:0] func  
);  
 
   always@(*)
   begin
   //casex is used to implement the don't care (x) conditions 
    casex(ALUop)
       2'b00:
            ALUctrl=4'b0010;//for lw/sw only (add)
            /*casex(opcode)we need to use ALUop of length 3
                6'b10x011:ALUctrl=4'b0010;//lw or sw
                6'b001000:ALUctrl=4'b0010;//addi
                6'b001101:ALUctrl=4'b0001;//ori
                6'b001010:ALUctrl=4'b0111;//slti
            endcase
            */
       2'b01:
            ALUctrl=4'b0110;//sub for beq
       2'b1x:
            begin
                casex(func)
                    6'bxx0000: ALUctrl=4'b0010;//add
                    6'bxx0010: ALUctrl=4'b0110;//sub
                    6'bxx0100: ALUctrl=4'b0000;//and
                    6'bxx0101: ALUctrl=4'b0001;//or
                    6'bxx1010: ALUctrl=4'b0111;//slt
                endcase  
            end
     endcase       
   end  
endmodule

