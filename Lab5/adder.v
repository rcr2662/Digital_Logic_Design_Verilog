`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 05:45:03 PM
// Design Name: 
// Module Name: adder
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


module adder(
input a, b, Cin, 
output S, Cout
    );
    
 assign S = (~Cin & ~a & b) | (~Cin & a & ~b) | (Cin & ~a & ~b) | (Cin & a & b);
 assign Cout = (a & b) | (Cin & a) | (Cin & b);
   
endmodule
