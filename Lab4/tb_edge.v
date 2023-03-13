`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 08:49:19 PM
// Design Name: 
// Module Name: tb_edge
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


module tb_edge;

reg clk = 0;
reg sw;
wire led;
edge_detector c(clk, sw, led);
always #5 clk = ~clk;
 
 always begin 
sw=0;
#50
sw=1;
#50;
end 
endmodule
