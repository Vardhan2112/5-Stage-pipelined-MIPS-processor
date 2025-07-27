`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 06:34:28 PM
// Design Name: 
// Module Name: control
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


module control(MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,ALUop,st,opcode );

output reg MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
output reg [1:0] ALUop;
input [3:0] opcode;
input st;

always@(*)
begin

        MemRead <= 0;
        MemtoReg <= 0;
        MemWrite<=0;
        ALUSrc<=0;
        RegWrite<=0;
        ALUop<=2'b00;

    if(!st)
    begin
    case(opcode)
    4'b0000://add 
    begin

        MemRead <= 0;
        MemtoReg <= 0;
        MemWrite<=0;
        ALUSrc<=0;
        RegWrite<=1;
        ALUop<=2'b00;
        
    end
    
    4'b0001://nandi
        begin
    
            MemRead <= 0;
            MemtoReg <= 0;
            MemWrite<=0;
            ALUSrc<=1;
            RegWrite<=1;
            ALUop<=2'b10;
            
        end
        
    4'b0011://sub
            begin
        
                MemRead <= 0;
                MemtoReg <= 0;
                MemWrite<=0;
                ALUSrc<=0;
                RegWrite<=1;
                ALUop<=2'b01;
                
            end
    4'b0111://lw
        begin
        
            MemRead <= 1;
            MemtoReg <= 1;
            MemWrite<=0;
            ALUSrc<=1;
            RegWrite<=1;
            ALUop<=2'b00;
            
        end

    4'b1111://nor
        begin
        
            MemRead <= 0;
            MemtoReg <= 0;
            MemWrite<=0;
            ALUSrc<=0;
            RegWrite<=1;
            ALUop<=2'b11;
            
        end   
    endcase
    end
    else//st=1
    begin
       MemRead <= 0;
       MemtoReg <= 0;
       MemWrite<=0;
       ALUSrc<=0;
       RegWrite<=0;
       ALUop<=2'bxx; 
    end
end   
    
endmodule
