`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2020 01:12:22 PM
// Design Name: 
// Module Name: bcd
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


module bcd(
input [3:0] sw,
output [3:0] an,
output [6:0] seg,
output dp);

assign an = 4'b1110;
assign dp = 1;

//Structural
//wire nsw0;
//wire nsw1;
//wire nsw2;
//wire nsw3;
//wire [3:0] resa;
//wire [3:0] resb;
//wire [2:0] resc;
//wire [3:0] resd;
//wire [2:0] rese;
//wire [3:0] resf;
//wire [2:0] resg;

//    not not0(nsw0, sw[0]);
//    not not1(nsw1, sw[1]);
//    not not2(nsw2, sw[2]);
//    not not3(nsw3, sw[3]);

//    and anda0(resa[0], sw[3], sw[2], nsw1, sw[0]);
//    and anda1(resa[1], sw[3], nsw2, sw[1], sw[0]);
//    and anda2(resa[2], nsw3, sw[2], nsw1, nsw0);
//    and anda3(resa[3], nsw3, nsw2, nsw1, sw[0]);
//    or  ora0(seg[6], resa[0], resa[1], resa[2], resa[3]);
    
//    and andb0(resb[0], sw[3], sw[2], nsw0);
//    and andb1(resb[1], sw[3], sw[1], sw[0]);
//    and andb2(resb[2], sw[2], sw[1], nsw0);
//    and andb3(resb[3], nsw3, sw[2], nsw1, sw[0]);
//    or  orb0(seg[5], resb[0], resb[1], resb[2], resb[3]);
    
//    and andc0(resc[0], sw[3], sw[2], sw[1]);
//    and andc1(resc[1], sw[3], sw[2], nsw0);
//    and andc2(resc[2], nsw3, nsw2, sw[1], nsw0);
//    or  orc1(seg[4], resc[0], resc[1], resc[2]);
    
//    and andd0(resd[0], nsw2, nsw1, sw[0]);
//    and andd1(resd[1], nsw3, sw[2], nsw1, nsw0);
//    and andd2(resd[2], sw[2], sw[1], sw[0]);
//    and andd4(resd[3], sw[3], nsw2, sw[1], nsw0);
//    or  ord0(seg[3], resd[0], resd[1], resd[2], resd[3]);
    
//    and ande0(rese[0], nsw2, nsw1, sw[0]);
//    and ande1(rese[1], nsw3, sw[2], nsw1);
//    and ande2(rese[2], nsw3, sw[0]);
//    or  ore0(seg[2], rese[0], rese[1], rese[2]);
    
//    and andf0(resf[0], nsw3, nsw2, sw[1]);
//    and andf1(resf[1], nsw3, nsw2, sw[0]);
//    and andf2(resf[2], nsw3, sw[1], sw[0]);
//    and andf3(resf[3], sw[3], sw[2], nsw1, sw[0]);
//    or  orf0(seg[1], resf[0], resf[1], resf[2], resf[3]);
    
//    and andg0(resg[0], nsw3, nsw2, nsw1);
//    and andg1(resg[1], nsw3, sw[2], sw[1], sw[0]);
//    and andg2(resg[2], sw[3], sw[2], nsw1, nsw0);
//    or  org0(seg[0], resg[0], resg[1], resg[2]);
    
//Dataflow 

//assign seg[6] = (sw[3]&sw[2]&~sw[1]&sw[0]) | (sw[3]&~sw[2]&sw[1]&sw[0]) | (~sw[3]&sw[2]&~sw[1]&~sw[0]) | (~sw[3]&~sw[2]&~sw[1]&sw[0]);
//assign seg[5] = (sw[3]&sw[2]&~sw[0]) | (sw[3]&sw[1]&sw[0]) | (sw[2]&sw[1]&~sw[0]) | (~sw[3]&sw[2]&~sw[1]&sw[0]);
//assign seg[4] = (sw[3]&sw[2]&sw[1]) | (sw[3]&sw[2]&~sw[0]) | (~sw[3]&~sw[2]&sw[1]&~sw[0]); 
//assign seg[3] = (sw[2]&sw[1]&sw[0]) | (~sw[2]&~sw[1]&sw[0]) | (sw[3]&~sw[2]&sw[1]&~sw[0]) | (~sw[3]&sw[2]&~sw[1]&~sw[0]);
//assign seg[2] = (~sw[3]&sw[0]) | (~sw[3]&sw[2]&~sw[1]) | (~sw[2]&~sw[1]&sw[0]); 
//assign seg[1] = (~sw[3]&~sw[2]&sw[1]) | (~sw[3]&~sw[2]&sw[0]) | (~sw[3]&sw[1]&sw[0]) | (sw[3]&sw[2]&~sw[1]&sw[0]); 
//assign seg[0] = (~sw[3]&~sw[2]&~sw[1]) | (~sw[3]&sw[2]&sw[1]&sw[0]) | (sw[3]&sw[2]&~sw[1]&~sw[0]); 

//Behavioral

reg [6:0] seg_buf;
assign seg[6:0] = seg_buf [6:0];
always@(*) begin
case({sw[3:0]})
4'b0000: seg_buf = 7'b0000001;
4'b0001: seg_buf = 7'b1001111;
4'b0010: seg_buf = 7'b0010010;
4'b0011: seg_buf = 7'b0000110;
4'b0100: seg_buf = 7'b1001100;
4'b0101: seg_buf = 7'b0100100;
4'b0110: seg_buf = 7'b0100000;
4'b0111: seg_buf = 7'b0001111;
4'b1000: seg_buf = 7'b0000000;
4'b1001: seg_buf = 7'b0001100;
4'b1010: seg_buf = 7'b0001000;
4'b1011: seg_buf = 7'b1100000;
4'b1100: seg_buf = 7'b0110001;
4'b1101: seg_buf = 7'b1000010;
4'b1110: seg_buf = 7'b0110000;
4'b1111: seg_buf = 7'b0111000;
default: seg_buf = 7'b1111111;
    endcase
    end
endmodule
