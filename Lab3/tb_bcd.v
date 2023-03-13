`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2020 05:56:55 PM
// Design Name: 
// Module Name: tb_bcd
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


module tb_bcd;

reg [3:0] sw;
wire [6:0] seg;

bcd uut(.sw(sw), .seg(seg));

initial begin

sw=4'b0000;
#10
sw=4'b0001;
#10
sw=4'b0010;
#10
sw=4'b0011;
#10
sw=4'b0100;
#10
sw=4'b0101;
#10
sw=4'b0110;
#10
sw=4'b0111;
#10
sw=4'b1000;
#10
sw=4'b1001;
#10
sw=4'b1010;
#10
sw=4'b1011;
#10
sw=4'b1100;
#10
sw=4'b1101;
#10
sw=4'b1110;
#10
sw=4'b1111;
#10;
end

endmodule
