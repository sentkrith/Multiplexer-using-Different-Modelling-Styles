`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 11:21:25
// Design Name: 
// Module Name: bh
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


module bh(s1, s0, i0, i1, i2, i3, y);
    input s1, s0;
    input i0, i1, i2, i3;
    output reg y;

    always @(*) begin
        case ({s1, s0})
            2'b00: y = i0;
            2'b01: y = i1;
            2'b10: y = i2;
            2'b11: y = i3;
            default: y = 0;
        endcase
    end

endmodule
