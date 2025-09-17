`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 11:19:42
// Design Name: 
// Module Name: sf
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


module sf(i0, i1, i2, i3,s1, s0,y);
    input i0, i1, i2, i3;
    input s1, s0;
    output y;
    wire s1_bar, s0_bar;
    wire w0, w1, w2, w3;

    not (s1_bar, s1);
    not (s0_bar, s0);

    and (w0, i0, s1_bar, s0_bar);
    and (w1, i1, s1_bar, s0);
    and (w2, i2, s1, s0_bar);
    and (w3, i3, s1, s0);

    or (y, w0, w1, w2, w3);
endmodule

