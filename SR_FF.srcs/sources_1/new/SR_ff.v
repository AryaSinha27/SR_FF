`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 00:36:24
// Design Name: 
// Module Name: SR_ff
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


module SR_ff(
     input clk,rst_n,
     input s,r,
     output reg q,
     output  q_bar
    );
    
    always@(posedge clk)begin
    if(!rst_n) q<= 0; 
    else begin
    case({s,r}) 
    2'b00: q<= q;
    2'b01: q<=1'b0;
    2'b10: q<=1'b1;
    2'b11: q<=1'bx;
    endcase
    end
    end
    assign q_bar=~q;
endmodule
