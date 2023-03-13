`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 03:27:57 PM
// Design Name: 
// Module Name: tb_adders
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


module tb_adders;
reg clk=0;
reg load = 1; 
reg [3:0] a, b;
reg Cin;
wire [4:0] totalA;
wire [4:0] totalB;
rca uut1(.clk(clk), .load(load), .a(a), .b(b), .Cin(Cin), .total(totalA));
cla uut2(.clk(clk), .load(load), .a(a), .b(b), .Cin(Cin), .total(totalB));
always #5 clk = ~clk;

initial begin
a = 4'b0000; b = 4'b0000; Cin = 0;
#100
//load = 0;
//#10
a = 4'b0000; b = 4'b0001; Cin = 1;
#100
a = 4'b0001; b = 4'b0101; Cin = 0;
#100
a = 4'b0111; b = 4'b0111; Cin = 0;
#100
a = 4'b1000; b = 4'b0111; Cin = 1;
#100
a = 4'b1100; b = 4'b0100; Cin = 0;
#100
a = 4'b1000; b = 4'b1000; Cin = 1;
#100
a = 4'b1001; b = 4'b1010; Cin = 1;
#100
a = 4'b1111; b = 4'b1111; Cin = 0;
#100;
end
endmodule
