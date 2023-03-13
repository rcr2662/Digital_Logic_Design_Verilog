`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 05:55:16 PM
// Design Name: 
// Module Name: rca
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


module rca(
input clk, load, 
input [3:0] a, b, 
input Cin, 
output [4:0] total
    );
wire [3:0] data; 
wire [3:0] Co;  
adder add0(.a(a[0]), .b(b[0]), .Cin(Cin), .Cout(Co[0]), .S(data[0]));
adder add1(.a(a[1]), .b(b[1]), .Cin(Co[0]), .Cout(Co[1]), .S(data[1])); 
adder add2(.a(a[2]), .b(b[2]), .Cin(Co[1]), .Cout(Co[2]), .S(data[2]));
adder add3(.a(a[3]), .b(b[3]), .Cin(Co[2]), .Cout(Co[3]), .S(data[3])); 
wire[4:0] sum;
assign sum[4] = Co[3];
assign sum[3:0] = data[3:0];
loadreg reg0(.clk(clk), .D(sum), .Q(total), .load(load));
 
endmodule
