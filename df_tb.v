`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 11:27:06
// Design Name: 
// Module Name: df_tb
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

module df_tb;
    reg I0, I1, I2, I3, S1, S0;
    wire Y;
    df dut(.i0(I0),.i1(I1),.i2(I2),.i3(I3),.s1(S1),.s0(S0),.y(Y));

    initial
    begin
        I0=1'b0; I1=1'b1; I2=1'b1; I3=1'b1; S1=1'b0; S0=1'b0;
        #100
        I0=1'b0; I1=1'b1; I2=1'b1; I3=1'b1; S1=1'b0; S0=1'b1;
        #100
        I0=1'b0; I1=1'b1; I2=1'b1; I3=1'b1; S1=1'b1; S0=1'b0;
        #100
        I0=1'b0; I1=1'b1; I2=1'b1; I3=1'b1; S1=1'b1; S0=1'b1;
    end
endmodule
