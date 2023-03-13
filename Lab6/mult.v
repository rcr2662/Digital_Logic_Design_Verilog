`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 12:52:16 AM
// Design Name: 
// Module Name: mult
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


module mult(
input clk,          //Use clk, no need for a clk div
input start,        //Center button
input [7:0] sw,     //Multiplicands - sw[7:4] & sw[3:0]
output stop,        //Stop signal (LED[15])
output reg [7:0] product    //Product - LED[7:0]
    );
    reg [2:0] count, nextcount;
    reg [2:0] cs, ns; // cs = current state, ns = next state
    reg stop_buf;
    reg [8:0] partial=0;
    assign stop = stop_buf;
    // Initialize state and output variables
    initial begin
        count = 0;
        nextcount = 0;
        cs = 0;
        ns = 0;
        product = 0;
    end
    
        always @(cs, count, start, stop) begin
        case(cs)
        0: begin // Initial state - set counter to 0
           stop_buf = 0 ;
           if(nextcount >3)stop_buf = 1;
           else if(start) ns = 1;
           else begin
            ns = 0; // Go to wait state
            
            end
            end
        1: begin // Wait state - wait for either up or down (but not both) to be triggered
	    // Need to specify output in every state to prevent latches being inferred (which can cause unpredictable behavior)
            partial[7:4] <= 0; 
            partial[3:0] <= sw[3:0];
           
            // Note how I specify every possible case for ns - very important also to prevent inferred latches
           ns <= 2;
            end
        2: begin // Count-down state
            if(partial[0]) ns <= 3;
            else ns <= 4; 
            end
        3: begin // Count-up state
           partial[8:4] <= product[7:4] + sw[7:4];
           ns <= 4;         
            end
        4: begin // Count-down state
          partial = partial >> 1;
          nextcount = count + 1;
          if(nextcount<4)ns <= 2;
          else ns = 0;
            end
         default: begin
            nextcount <= 0;
            ns <= 0;
            end
        endcase
    end
    
    // HLSM driver w/ reset - Update all registers at same time
    always @(posedge clk) begin
        if(stop) begin
            cs <= 0;
            count <= 0;
            end
        else begin 
            cs <= ns;
            count <= nextcount;
            product<= partial;
            end
        end
endmodule
