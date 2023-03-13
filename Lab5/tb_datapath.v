`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 08:47:00 PM
// Design Name: 
// Module Name: tb_datapath
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


module tb_datapath;
reg clk = 0;
reg load=1;
reg sel = 0;
reg Cin;
reg [15:0] sw;
wire [15:0] led;
 
 datapath uut(.clk(clk), .load(load), .sel(sel), .Cin(Cin), .sw(sw), .led(led));
 
always #5 clk = ~clk;

initial begin
sw[15:12]= 4'b0000; sw[7:4] = 4'b0000; sw[11:8] = 4'b0000;sw[3:0] = 4'b0000; Cin = 0;
#50
sw[15:12] = 4'b0000;sw[7:4] = 4'b0000; sw[11:8] = 4'b0001;; sw[3:0] = 4'b0001; Cin = 1;
#50
sw[15:12] = 4'b0001;sw[7:4] = 4'b0001; sw[11:8] = 4'b0101;sw[3:0] = 4'b0101; Cin = 0;
#50
load = 0;
sel = 1;
#50
sw[15:12] = 4'b0111;sw[7:4] = 4'b0111; sw[11:8] = 4'b0111;sw[3:0] = 4'b0111; Cin = 0;
#50
load = 1;
#50
sw[15:12] = 4'b1000;sw[7:4] = 4'b1000; sw[11:8] = 4'b0111;sw[3:0] = 4'b0111; Cin = 1;
#50
sw[15:12] = 4'b1100;sw[7:4] = 4'b1100; sw[11:8] = 4'b0100;sw[3:0] = 4'b0100; Cin = 0;
#50
sw[15:12] = 4'b1000;sw[7:4] = 4'b1000; sw[11:8] = 4'b1000; sw[3:0] = 4'b1000; Cin = 1;
#50
sw[15:12] = 4'b1001;sw[7:4] = 4'b1001; sw[11:8] = 4'b1010;sw[3:0] = 4'b1010; Cin = 1;
#50
sw[15:12] = 4'b1111;sw[7:4] = 4'b1111; sw[11:8] = 4'b1111; sw[3:0] = 4'b1111;Cin = 0;
#50;
end
endmodule
