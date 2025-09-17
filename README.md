# SIMULATION AND IMPLEMENTATION OF 4:1 MULTIPLEXER

# AIM
To design and simulate a 4:1 Multiplexer (MUX) using Verilog HDL in four different modeling styles—Gate-Level, Data Flow, Behavioral, and Structural—and to verify its functionality through a testbench using the Vivado 2023.1 simulation environment. The experiment aims to understand how different abstraction levels in Verilog can be used to describe the same digital logic circuit and analyze their performance.

# APPARATUS REQUIRED
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

# Logic Diagram
<img width="1014" height="807" alt="image" src="https://github.com/user-attachments/assets/b74506cc-aa74-4256-862d-bbad11abdc73" />


# Truth Table
<img width="873" height="464" alt="image" src="https://github.com/user-attachments/assets/0af78cc7-3f91-4be9-8c60-69db8acf8570" />


# Verilog Code
4:1 MUX Gate-Level Implementation
Gate Level Modelling - Skeleton
```
module mux4_1(y, i0, i1, i2, i3, s1, s0);
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
```
4:1 MUX Gate-Level Implementation- Testbench
```
module mux4_1_tb;
    reg I0, I1, I2, I3, S1, S0;
    wire Y;
    mux4_1 dut(.i0(I0), .i1(I1), .i2(I2), .i3(I3), .s1(S1), .s0(S0), .y(Y));
    
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
```
Simulated Output Gate Level Modelling

<img width="1577" height="915" alt="image" src="https://github.com/user-attachments/assets/3f76233c-211a-4709-a262-318558a0311d" />


4:1 MUX Data flow Modelling
```
module mux4_1_df(i0,i1,i2,i3,s1,s0,y);
    input i0;
    input i1;
    input i2;
    input i3;
    input s1;
    input s0;
    output y;

    assign y = ( ~s1 & ~s0 & i0 ) |
               ( ~s1 &  s0 & i1 ) |
               (  s1 & ~s0 & i2 ) |
               (  s1 &  s0 & i3 );
endmodule
```
4:1 MUX Data flow Modelling- Testbench
```
module mux4_1_df_tb;
    reg I0, I1, I2, I3, S1, S0;
    wire Y;
    mux4_1_df dut(.i0(I0),.i1(I1),.i2(I2),.i3(I3),.s1(S1),.s0(S0),.y(Y));

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
```
Simulated Output Dataflow Modelling
![WhatsApp Image 2025-09-17 at 11 37 27_c1e75e33](https://github.com/user-attachments/assets/03767585-8a5c-40af-a2b9-a4f919d8e8fc)


4:1 MUX Behavioral Implementation
```
module mux4_1_bh(s1, s0, i0, i1, i2, i3, y);
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
```
4:1 MUX Behavioral Modelling- Testbench
```
`timescale 1ns/1ps
module mux4_1_bh_tb;
    reg i0, i1, i2, i3;
    reg s1, s0;
    wire y;

    
    mux4_1_bh dut(
        .s1(s1),
        .s0(s0),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .y(y)
    );

    initial begin
        
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b1; i3 = 1'b1; s1 = 1'b0; s0 = 1'b0;
        #100;
        s0 = 1'b1; s1 = 1'b0;
        #100;
        s0 = 1'b0; s1 = 1'b1;
        #100;
        s0 = 1'b1; s1 = 1'b1;
        #100;
        $finish;
    end
endmodule
```
Simulated Output Behavioral Modelling
![WhatsApp Image 2025-09-17 at 11 41 01_d541678f](https://github.com/user-attachments/assets/ec9c78c4-d03e-40b8-a19b-6b1ab9ae3554)


4:1 MUX Structural Implementation
<img width="1471" height="821" alt="image" src="https://github.com/user-attachments/assets/19c1fd5a-d70f-409b-9090-edacc40b8425" />


```
module mux4_1_structural(i0, i1, i2, i3,s1, s0,y);
    input i0, i1, i2, i3,
    input s1, s0,
    output y
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
```
Testbench Implementation
```
`timescale 1ns / 1ps
module mux4_1_structural_tb;
    reg i0, i1, i2, i3;
    reg s1, s0;
    wire y;

    mux4_1_structural dut(
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .s1(s1), .s0(s0),
        .y(y)
    );

    initial begin
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b1; i3 = 1'b1; s1 = 1'b0; s0 = 1'b0;
        #100;
        s0 = 1'b1; s1 = 1'b0;
        #100;
        s0 = 1'b0; s1 = 1'b1;
        #100;
        s0 = 1'b1; s1 = 1'b1;
        #100;
        $finish;
    end
endmodule
```
Simulated Output Structural Modelling
![WhatsApp Image 2025-09-17 at 11 43 58_c9d9ef06](https://github.com/user-attachments/assets/317b4065-af3a-45e3-ad79-29bc5f2f3db8)


CONCLUSION

In this experiment, a 4:1 Multiplexer was successfully designed and simulated using Verilog HDL across four different modeling styles: Gate-Level, Data Flow, Behavioral, and Structural.The simulation results verified the correct functionality of the MUX, with all implementations producing identical outputs for the given input conditions.
