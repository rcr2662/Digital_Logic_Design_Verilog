`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 04:54:46 PM
// Design Name: 
// Module Name: cla
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


module cla(
    input clk, load, 
    input [3:0] a, b, 
    input Cin, 
    output [4:0] total
    );
    wire [3:0] G, P, C; 
    wire [4:0] S;
    assign G = a & b;
    assign P = (a ^ b);
    assign C[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) + (P[3] & P[2] & P[1] & P[0] & Cin); 
    assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
    assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
    assign C[0] = G[0] | (P[0] & Cin);
    
    
    assign S[4] = C[3];
    assign S[3:1] = P[3:1] ^ C[2:0];
    assign S[0] = P[0] ^ Cin;
    
    loadreg reg1(.clk(clk), .D(S), .Q(total), .load(load));
    
endmodule
