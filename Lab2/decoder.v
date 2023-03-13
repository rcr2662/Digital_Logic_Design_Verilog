`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2020 10:04:02 AM
// Design Name: 
// Module Name: decoder
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


module decoder(
//Creates four input ports
input enable, up, left, right,
output combo0, combo1, combo2, combo3, combo4, combo5, combo6, combo7
    );
    
    //Structural
// wire notup;
// wire notleft;
// wire notright;
    
//    not not0(notup, up);
//    not not1(notleft, left);
//    not not2(notright, right);
    
//    and g0(combo0, enable, notup, notleft, notright);
//    and g1(combo1, enable, notup, notleft, right);
//    and g2(combo2, enable, notup, left, notright);
//    and g3(combo3, enable, notup, left, right);
//    and g4(combo4, enable, up, notleft, notright);
//    and g5(combo5, enable, up, notleft, right);
//    and g6(combo6, enable, up, left, notright);
//    and g7(combo7, enable, up, left, right);
    
    
    //Dataflow
    assign combo0 = enable & ~up & ~left & ~right;
    assign combo1 = enable & ~up & ~left & right;
    assign combo2 = enable & ~up & left & ~right;
    assign combo3 = enable & ~up & left & right;
    assign combo4 = enable & up & ~left & ~right;
    assign combo5 = enable & up & ~left & right;
    assign combo6 = enable & up & left & ~right;
    assign combo7 = enable & up & left & right;
    
    //Behavioral
//    reg [7:0] combo_buf = 8'b00000000;
//    assign combo0 = combo_buf[0];
//    assign combo1 = combo_buf[1];
//    assign combo2 = combo_buf[2];
//    assign combo3 = combo_buf[3];
//    assign combo4 = combo_buf[4];
//    assign combo5 = combo_buf[5];
//    assign combo6 = combo_buf[6];
//    assign combo7 = combo_buf[7];
//    always @(*) begin
//    case ({enable, up, left, right})
//    4'b1000: combo_buf = 8'b00000001;
//    4'b1001: combo_buf = 8'b00000010;
//    4'b1010: combo_buf = 8'b00000100;
//    4'b1011: combo_buf = 8'b00001000;
//    4'b1100: combo_buf = 8'b00010000;
//    4'b1101: combo_buf = 8'b00100000;
//    4'b1110: combo_buf = 8'b01000000;
//    4'b1111: combo_buf = 8'b10000000;
//    default: combo_buf = 8'b00000000;
//    endcase
//    end
endmodule
