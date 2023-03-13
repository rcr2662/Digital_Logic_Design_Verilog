`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2020 01:27:42 PM
// Design Name: 
// Module Name: tb_mux
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


module tb_mux;
reg sw1, sw0, up, down, left, right;
wire led0;

multiplexer m(.sw1(sw1), .sw0(sw0), .up(up), .down(down), .left(left), .right(right));

initial begin
sw1=0; sw0=0; up=0; down=0; left=0; right=0;
#10
sw1=0; sw0=0; up=1; down=0; left=0; right=0;
#10
sw1=0; sw0=0; up=0; down=1; left=1; right=0;
#10
sw1=0; sw0=1; up=0; down=0; left=1; right=0;
#10
sw1=0; sw0=1; up=1; down=0; left=1; right=0;
#10
sw1=0; sw0=1; up=0; down=0; left=0; right=0;
#10
sw1=1; sw0=0; up=0; down=0; left=0; right=0;
#10
sw1=1; sw0=0; up=0; down=1; left=0; right=0;
#10
sw1=1; sw0=0; up=1; down=0; left=0; right=0;
#10
sw1=1; sw0=1; up=0; down=0; left=0; right=0;
#10
sw1=1; sw0=1; up=0; down=1; left=0; right=0;
#10
sw1=1; sw0=1; up=0; down=0; left=0; right=1;
#10;
end
endmodule
