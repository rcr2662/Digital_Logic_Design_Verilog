`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2020 07:42:17 PM
// Design Name: 
// Module Name: PartCclkdiv
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


module PartCclkdiv(
input clk,
output slow_clk
    );
      reg [3:0] count1 = 0; // Initialize clock cycle counter to 0
      reg [3:0] count2 = 2;
      wire clk1;
      wire clk2;
      wire clk_out;
      assign clk1 = count1[3];
      assign clk2 = count2[3];
      assign clk_out = clk1 | clk2;
    assign slow_clk = clk_out; // Tie buffer to output
    
    // Note that the sensitivity list now contains "posedge clk"
    // This means that the always block will only run when the clk has a rising edge (transitions from 0 to 1)
    always @(posedge clk) begin
        // Increment cycle counter
        
        // Check if target number of cycles has elapsed for 100Hz slow clock - in this case, 500,000 cycles
        if(count1 == 4)count1 = 0;
         else  count1 = count1 + 1;
        end
    always @(negedge clk) begin
        // Increment cycle counter
        
        // Check if target number of cycles has elapsed for 100Hz slow clock - in this case, 500,000 cycles
        if(count2 == 4)count2 = 0;
         else  count2 = count2 + 1;
        end 
endmodule
