`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 09:03:04 PM
// Design Name: 
// Module Name: clks
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


module clks(
input clk,
output [15:0] led
 );
 

 reg l12 = 0;
 reg l13 = 0;
 reg l14 = 0;
 reg l15 = 0;
 reg [11:0] count = 0;
 reg [3:0] countl12 = 0;
 reg [3:0] countl13 = 0;
 reg [3:0] countl14 = 0;
 reg [3:0] countl15 = 0;
 
 assign led[0] = count[0];
 assign led[1] = count[1];
 assign led[2] = count[2];
 assign led[3] = count[3];
 assign led[4] = count[4];
 assign led[5] = count[5];
 assign led[6] = count[6];
 assign led[7] = count[7];
 assign led[8] = count[8];
 assign led[9] = count[9];
 assign led[10] = count[10];
 assign led[11] = count[11];
 assign led[12] = l12;
 assign led[13] = l13;
 assign led[14] = l14;
 assign led[15] = l15;
 
 always@(posedge clk) count = count + 1;

 always@(posedge clk)begin
 countl12 = countl12 + 1;
 if(countl12 == 9)begin
 countl12 = 0;
 l12 = ~l12;
 end
 end
 
 always@(posedge l12)begin
 countl13 = countl13 + 1;
 if(countl13 == 5)begin
  countl13 = 0;
  l13 = ~l13;
 end
 end
 
 always@(posedge l13)begin
 countl14 = countl14 + 1;
 if(countl14 == 5) begin
 countl14 = 0;
 l14 = ~l14;
 end
 end
 
 always@(posedge l14)begin
 countl15 = countl15 + 1;
 if(countl15 == 5) begin
 countl15 = 0;
 l15 = ~l15;
 end
 end
 
endmodule
