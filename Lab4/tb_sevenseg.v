`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 03:49:46 PM
// Design Name: 
// Module Name: tb_sevenseg
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


module tb_sevenseg;
reg clk = -1;
reg [15:0] sw = 0;
reg reset = 0;
wire [3:0] an;
wire [6:0] seg;

 sevenseg sev(clk, sw, reset, an, seg);
 always #5 clk = ~clk;
initial begin
 sw=0;
  #20;
  end
 always begin
 sw = sw +1;
 #20;

 end
 
endmodule
