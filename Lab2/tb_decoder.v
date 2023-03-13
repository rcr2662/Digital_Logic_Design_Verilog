`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 08:14:30 PM
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder;

reg enable, up, left, right;
wire combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7;

decoder uut(.up(up), .left(left), .right(right), .enable(enable));
    
    initial begin
    enable=0; up=0; left=0; right=0;
    #10
    enable=0; up=0; left=0; right=1;
    #10
    enable=0; up=0; left=1; right=0;
    #10
    enable=0; up=0; left=1; right=1;
    #10
    enable=0; up=1; left=0; right=0;
    #10
    enable=0; up=1; left=0; right=1;
    #10
    enable=0; up=1; left=1; right=0;
    #10
    enable=0; up=1; left=1; right=1;
    #10
    enable=1; up=0; left=0; right=0;
    #10
    enable=1; up=0; left=0; right=1;
    #10
    enable=1; up=0; left=1; right=0;
    #10
    enable=1; up=0; left=1; right=1;
    #10
    enable=1; up=1; left=0; right=0;
    #10
    enable=1; up=1; left=0; right=1;
    #10
    enable=1; up=1; left=1; right=0;
    #10
    enable=1; up=1; left=1; right=1;
    #10;
    end
endmodule
