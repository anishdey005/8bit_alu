# 8bit_alu
Overview

This project implements a modular 8-bit Arithmetic Logic Unit (ALU) in Verilog HDL. The ALU supports a variety of arithmetic, logical, and bitwise operations based on a 4-bit opcode input. This project demonstrates basic digital design principles, behavioral modeling, and simulation workflows in Verilog.

Features

8-bit inputs: A and B

Supported Operations (via opcode):

0000 – ADD (A + B)

0001 – SUB (A - B)

0010 – AND

0011 – OR

0100 – XOR

0101 – NOT (A)

0110 – SHL (A << 1)

0111 – SHR (A >> 1)

1000 – ROL (Rotate Left)

1001 – ROR (Rotate Right)

1010 – INC (A + 1)

1011 – DEC (A - 1)

Output:

Y: 8-bit result

C: Carry flag

Z: Zero flag

V: Overflow flag

S: Sign flag (MSB)

File Structure

8bit-ALU-Verilog/
├── src/
│   └── alu.v              # ALU design file
├── tb/
│   └── alu_tb.v           # Testbench
├── waves/
│   └── alu_waveform.png   # Simulation waveform (optional)
├── doc/
│   └── ALU_Project_Report.pdf # Project documentation
├── README.md

Simulation Instructions

Using Icarus Verilog and GTKWave:

# Step 1: Compile
iverilog -o alu_tb tb/alu_tb.v src/alu.v

# Step 2: Simulate
vvp alu_tb

# Step 3: View Waveform
gtkwave alu.vcd


