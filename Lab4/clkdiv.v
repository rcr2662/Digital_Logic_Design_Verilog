`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 06:30:36 PM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
input clk,
output slow_clk
    );
    reg [3:0] count = 0; // Initialize clock cycle counter to 0
    reg clk_out = 0; // Buffer for output clock
    assign slow_clk = clk_out; // Tie buffer to output
    
    // Note that the sensitivity list now contains "posedge clk"
    // This means that the always block will only run when the clk has a rising edge (transitions from 0 to 1)
    always @(posedge clk) begin
        // Increment cycle counter
        count = count + 1;
        
        // Check if target number of cycles has elapsed for 100Hz slow clock - in this case, 500,000 cycles
        if(count == 5) begin
            count = 0; // Reset the cycle counter to zero
            clk_out = ~clk_out; // Toggle the output bit that represents the clock

        end
    end 
endmodule
