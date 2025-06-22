`timescale 1ns/1ps
module alu_tb;
    reg  [7:0] A;
    reg  [7:0] B;
    reg  [3:0] opcode;
    wire [7:0] result;
    wire       zero, carry, overflow, sign;


    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .zero(zero),
        .carry(carry),
        .overflow(overflow),
        .sign(sign)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);
        $display("Time | Opcode |   A   |   B   | Result | Z | C | V | S");
        $display("------------------------------------------------------");


        test_op(OP_ADD, 8'd15, 8'd10);
        test_op(OP_SUB, 8'd15, 8'd20);
        test_op(OP_INC, 8'd255, 8'd0);
        test_op(OP_DEC, 8'd0,   8'd0);
        test_op(OP_AND, 8'hF0,  8'h0F);
        test_op(OP_OR,  8'hF0,  8'h0F);
        test_op(OP_XOR, 8'hAA,  8'hFF);
        test_op(OP_NOT, 8'h55,  8'd0);
        test_op(OP_SHL, 8'b10011001, 8'd0);
        test_op(OP_SHR, 8'b10011001, 8'd0);
        test_op(OP_ROL, 8'b10011001, 8'd0);
        test_op(OP_ROR, 8'b10011001, 8'd0);

        $finish;
    end


    task test_op;
        input [3:0] op;
        input [7:0] aval;
        input [7:0] bval;
        begin
            opcode = op;
            A      = aval;
            B      = bval;
            #5;
            $display(" %0dns |   %b   | %3d | %3d |   %3d   | %b | %b | %b | %b", 
                     $time, opcode, A, B, result, zero, carry, overflow, sign);
        end
    endtask

    localparam OP_ADD = 4'b0000;
    localparam OP_SUB = 4'b0001;
    localparam OP_INC = 4'b0010;
    localparam OP_DEC = 4'b0011;
    localparam OP_AND = 4'b0100;
    localparam OP_OR  = 4'b0101;
    localparam OP_XOR = 4'b0110;
    localparam OP_NOT = 4'b0111;
    localparam OP_SHL = 4'b1000;
    localparam OP_SHR = 4'b1001;
    localparam OP_ROL = 4'b1010;
    localparam OP_ROR = 4'b1011;
endmodule
