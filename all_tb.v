`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 11:47:51
// Design Name: 
// Module Name: all_tb
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

`timescale 1ns / 1ps
module all_tb;
    reg [3:0] i;       // i[0]=i0, i[1]=i1, i[2]=i2, i[3]=i3
    reg [1:0] s;       // s[1]=s1, s[0]=s0
    wire y_gate;
    wire y_dataflow;
    wire y_behavioral;
    wire y_structural;

    gl dut_gate (
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s1(s[1]),
        .s0(s[0]),
        .y(y_gate)
    );

    mux4_1_df dut_dataflow (
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s1(s[1]),
        .s0(s[0]),
        .y(y_dataflow)
    );

    four_one_mux_behaviour dut_behavioral (
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s1(s[1]),
        .s0(s[0]),
        .y(y_behavioral)
    );

    mux4_1_structural dut_structural (
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s1(s[1]),
        .s0(s[0]),
        .y(y_structural)
    );

    initial begin
        // Initialize inputs
        i = 4'b0000;
        s = 2'b00;
        #2  {s, i} = 6'b00_0000;
        #2  {s, i} = 6'b00_0001;
        #2  {s, i} = 6'b01_0010;
        #2  {s, i} = 6'b10_0100;
        #2  {s, i} = 6'b11_1000;
        #2  {s, i} = 6'b01_1100;
        #2  {s, i} = 6'b10_1010;
        #2  {s, i} = 6'b11_0110;
        #2  {s, i} = 6'b00_1111;
        #2  $stop;
    end

    initial begin
        $monitor("Time=%0t | s1=%b s0=%b | Inputs: i0=%b i1=%b i2=%b i3=%b | Y_gate=%b | Y_dataflow=%b | Y_behavioral=%b | Y_structural=%b",
                 $time, s[1], s[0], i[0], i[1], i[2], i[3], y_gate, y_dataflow, y_behavioral, y_structural);
    end
endmodule
