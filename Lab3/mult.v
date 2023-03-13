`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2020 09:46:16 PM
// Design Name: 
// Module Name: mult
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


module mult(
input [3:0] sw,
output [3:0] an,
output [6:0] seg,
output dp);

assign an = 4'b1110;
assign dp = 1;

wire [3:0] res;

bcd bcd0(.sw(res), .an(an), .seg(seg), .dp(dp));
assign res[3] = sw[3] & sw[2] & sw[1] & sw[0];
assign res[2] = (sw[3] & ~sw[2] & sw[1]) | (sw[3] & sw[1] & ~sw[0]);
assign res[1] = (sw[3] & ~sw[2] & sw[0]) | (sw[3] & ~sw[1] & sw[0]) | (~sw[3] & sw[2] & sw[1]) | (sw[2] & sw[1] & ~sw[0]);
assign res[0] = sw[2] & sw[0];

endmodule
