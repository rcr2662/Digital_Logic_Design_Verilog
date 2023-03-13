`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 06:39:02 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
input clk, // clk signal - periodic clock signal that drives the FSM
    input sw,  // On button (btnR) - turns the LED on
    output reg led // LED - Turns on and off. Note that led is a reg, not a wire.
                   // This is because we are only updating it in always blocks and nowhere else,
                   // whereas before, we were updating it from gates or boolean expressions.
    );
    
    wire slow_clk; // Create a wire for the slow_clk that will be generated from the clock divider
    clkdiv c1(clk, slow_clk); // Instantiate the clock divider module
    
     // Create variables to hold current and next state
    reg [1:0] current_state = 0;
    reg [1:0] next_state = 0;
 always @(*) begin
        case(current_state) // Using the current state, determine the output and next state
        0: begin // State 0
            led = 0; // Set output - in this case, turn LED off
            if(sw == 1) next_state = 1; // If the ON button is pushed, set next state to state 1 where LED is on
            else next_state = 0; // Else, stay in state 0
            end 
        1: begin // State 1
            led = 1; // Set output - in this case, turn LED on
            if(sw == 0) next_state = 0; // If the OFF button is pushed, set next state to 0 where LED is off
            else next_state = 2; // Else, stat in state 1
            end 
        2: begin // State 2
            led = 0; // Set output - in this case, turn LED off
            if(sw == 1) next_state = 2; 
            else next_state = 0; 
            end 
        default: begin // Default state, in case not all conditions are covered by the above cases
            led = 0;
            next_state = 0;
            end
        endcase
    
    end
    
    // Sequential logic portion of FSM - update registers with new state
    // Note that "posedge slow_clk" is now in the sensitivity list of the always block. This means tha the always block
    // will only run on the rising edge of the divided clock signal - 100Hz.
    always @(slow_clk) begin
        current_state <= next_state;
    end
    
endmodule
