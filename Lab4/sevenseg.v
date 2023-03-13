`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2020 08:50:09 PM
// Design Name: 
// Module Name: sevenseg
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


module sevenseg(
input clk,
input [15:0] sw,
input reset,
output reg [3:0] an = 4'b1110,
output reg [6:0] seg
    );
    wire [3:0] res1 = sw[3:0];
    wire [3:0] res2 = sw[7:4];
    wire [3:0] res3 = sw[11:8];
    wire [3:0] res4 = sw[15:12];
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire [6:0] seg3;
    wire [6:0] seg4;

    bcd bcd0(.sw(res1), .seg(seg1));// State 0  
    bcd bcd1(.sw(res2), .seg(seg2));
    bcd bcd2(.sw(res3), .seg(seg3));
    bcd bcd3(.sw(res4), .seg(seg4));
      wire slow_clk; // Create a wire for the slow_clk that will be generated from the clock divider
  PartCclkdiv c1(clk, slow_clk); // Instantiate the clock divider module
     
     // Create variables to hold current and next state
    reg [1:0] current_state = 0;
    reg [1:0] next_state = 0;
 always @(*) begin
        case(current_state) // Using the current state, determine the output and next state
        0: begin 
        if(reset == 1)next_state = 0;
        else begin
        next_state = 1;
        an = 4'b1110;
        seg = seg1;
        end
            end     
        1: begin // State 1
            if(reset == 1) next_state = 0; // If the OFF button is pushed, set next state to 0 where LED is off
            else begin
            next_state = 2; 
            an = 4'b1101;
            seg = seg2;
            end
            end 
        2: begin // State 2
            if(reset == 1) next_state = 0; 
            else next_state = 3; 
            an = 4'b1011;
            seg = seg3;
            end 
         
         3: begin
         next_state = 0;
         an = 4'b0111;
         seg = seg4;
         end
        default: begin // Default state, in case not all conditions are covered by the above cases
            next_state = 0;
            end
        endcase
    
    end
    
    // Sequential logic portion of FSM - update registers with new state
    // Note that "posedge slow_clk" is now in the sensitivity list of the always block. This means tha the always block
    // will only run on the rising edge of the divided clock signal - 100Hz.
    always @(posedge slow_clk) begin
        current_state <= next_state;
    end
    
endmodule
