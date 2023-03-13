`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 02:33:28 PM
// Design Name: 
// Module Name: tb_mult
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


module tb_mult;
reg clk = 0;          //Use clk, no need for a clk div
reg start;        //Center button
reg [7:0] sw;   //Multiplicands - sw[7:4] & sw[3:0]
wire stop;        //Stop signal (LED[15])
wire [7:0] product ;   //Product - LED[7:0]

 mult uut(.clk(clk), .start(start), .sw(sw), .stop(stop), .product(product)); 
 
  always #5 clk = ~clk;
  
  initial begin
start = 0;
//sw[7:0] = 0;
//sw[7:4] = 1;
//sw[3:0] = 1;
//sw[7:4] = 1;
//sw[3:0] = 10;
//sw[7:4] = 2;
//sw[3:0] = 5;
//sw[7:4] = 7;
//sw[3:0] = 9;
//sw[7:4] = 15;
//sw[3:0] = 10;
sw[7:4] = 15;
sw[3:0] = 15;
#10 
start = 1;
#10
start = 0;

end
  
endmodule
