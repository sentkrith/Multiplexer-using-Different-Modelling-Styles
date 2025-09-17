`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 11:14:38
// Design Name: 
// Module Name: gl
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


module gl(y, i0, i1, i2, i3, s1, s0);
  output y;
  input i0, i1, i2, i3;
  input s1, s0;
  wire s1bar, s0bar;
  wire w1, w2, w3, w4;
  
  not n1(s1bar, s1);
  not n2(s0bar, s0);
  and a1(w1, i0, s1bar, s0bar);
  and a2(w2, i1, s1bar, s0);
  and a3(w3, i2, s1, s0bar);
  and a4(w4, i3, s1, s0);
  or  a5(y, w1, w2, w3, w4);
endmodule

