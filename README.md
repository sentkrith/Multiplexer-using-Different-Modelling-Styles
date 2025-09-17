# SIMULATION AND IMPLEMENTATION OF 4:1 MULTIPLEXER

AIM
To design and simulate a 4:1 Multiplexer (MUX) using Verilog HDL in four different modeling styles—Gate-Level, Data Flow, Behavioral, and Structural—and to verify its functionality through a testbench using the Vivado 2023.1 simulation environment. The experiment aims to understand how different abstraction levels in Verilog can be used to describe the same digital logic circuit and analyze their performance.

APPARATUS REQUIRED
Vivado 2023.1
Procedure
Open Vivado 2023.1.
Create a New RTL Project and give a name (e.g., Mux4_to_1).
Add/create your Verilog files and testbench.
Select an FPGA part (e.g., xc7a35ticsg324-1L).
Run Synthesis to check for errors.
Run Simulation → Run Behavioral Simulation.
Observe the waveforms of inputs and outputs.
Adjust simulation time if needed (e.g., 1000ns).
Save the project and take screenshots of results.
Close simulation.
Logic Diagram
![WhatsApp Image 2025-09-17 at 7 37 23 PM](https://github.com/user-attachments/assets/0ad97e02-2c03-4bc8-b493-4f1f97561793)



Verilog Code
`timescale 1ns / 1ps

module mux_4_to_1(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    input wire [1:0] s,
    output reg y
    );

    always @(*)
    begin
        case(s)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
            default: y = 1'bx;
        endcase
    end

endmodule
4:1 MUX Gate-Level Implementation- Testbench
`timescale 1ns / 1ps

module mux_4_to_1_tb;

    reg tb_a;
    reg tb_b;
    reg tb_c;
    reg tb_d;
    reg [1:0] tb_s;
    wire tb_y;

    mux_4_to_1 dut (
        .a(tb_a),
        .b(tb_b),
        .c(tb_c),
        .d(tb_d),
        .s(tb_s),
        .y(tb_y)
    );

    initial begin
        // Test Case 1
        tb_a = 1'b1; tb_b = 1'b0; tb_c = 1'b1; tb_d = 1'b0;
        
        tb_s = 2'b00; #10;
        tb_s = 2'b01; #10;
        tb_s = 2'b10; #10;
        tb_s = 2'b11; #10;

        // Test Case 2
        tb_a = 1'b0; tb_b = 1'b1; tb_c = 1'b0; tb_d = 1'b1;

        tb_s = 2'b00; #10;
        tb_s = 2'b01; #10;
        tb_s = 2'b10; #10;
        tb_s = 2'b11; #10;
        
        #20;
        $finish;
    end

endmodule

Simulated Output Structural Modelling
![WhatsApp Image 2025-09-17 at 7 37 23 PM (1)](https://github.com/user-attachments/assets/bfe68c30-4d49-4df0-aa96-5486fbae7e8d)


CONCLUSION
In this experiment, a 4:1 Multiplexer was successfully designed and simulated using Verilog HDL across four different modeling styles: Gate-Level, Data Flow, Behavioral, and Structural.The simulation results verified the correct functionality of the MUX, with all implementations producing identical outputs for the given input conditions.
