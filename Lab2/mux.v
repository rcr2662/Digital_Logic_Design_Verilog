`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Reyes
// 
// Create Date: 02/13/2020 11:13:03 AM
// Design Name: 
// Module Name: mux
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


module mux(
input sw1, sw0, up, down, left, right,
output led0
    );
    
    //Structural
//wire notsw1;
//wire notsw0;
//wire zero;
//wire one;
//wire two;
//wire three;

//    not not0(notsw1, sw1);
//    not not1(notsw0, sw0);
    
//    and g0(zero, up, notsw1, notsw0);
//    and g1(one, down, notsw1, sw0);
//    and g2(two, left, sw1, notsw0);
//    and g3(three, right, sw1, sw0);
//    or  g4(led0, zero, one, two, three);
    
    //Dataflow
    
//     assign led0 = (up & ~sw1 & ~sw0) | (down & ~sw1 & sw0) | (left & sw1 & ~sw0) | (right & sw1 & sw0);
    
    //Behavioral
    
    reg led0_buf = 0;
    assign led0= led0_buf;
    always@(*) begin
    case ({sw1, sw0})
    2'b00: led0_buf = up;
    2'b01: led0_buf = down;
    2'b10: led0_buf = left;
    2'b11: led0_buf = right;
    endcase
    end
endmodule
