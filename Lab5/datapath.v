`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 07:19:54 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
input clk, load, sel, Cin,
input [15:0] sw,
output [15:0] led
    );
wire [4:0] res1;
wire [4:0] res2;
reg [15:0] res;
assign led = res;
rca rca1(.clk(clk), .load(load), .a(sw[7:4]), .b(sw[3:0]), .Cin(Cin), .total(res1));
cla cla1(.clk(clk), .load(load), .a(sw[15:12]), .b(sw[11:8]), .Cin(Cin), .total(res2));

always @(*) begin
        case(sel) 
        0: begin
        res[15:5] = 0;
        res[4:0] = res1;
        end
        1: begin
        res[15:13] = 0;
        res[12:8] = res2;
        res[7:0] = 0;
        end
        endcase
        end
endmodule
