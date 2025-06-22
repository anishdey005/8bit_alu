module alu (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [3:0] opcode,
    output reg  [7:0] result,
    output reg        zero,
    output reg        carry,
    output reg        overflow,
    output reg        sign
);

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

    reg [8:0] temp; 

    always @(*) begin

        zero     = 1'b0;
        carry    = 1'b0;
        overflow = 1'b0;
        sign     = 1'b0;
        temp     = 9'd0;
        result   = 8'd0;

        case (opcode)
            OP_ADD: begin
                temp   = {1'b0, A} + {1'b0, B};
                result = temp[7:0];
                carry  = temp[8];
                overflow = (A[7] == B[7]) && (result[7] != A[7]);
            end

            OP_SUB: begin
                temp   = {1'b0, A} - {1'b0, B};
                result = temp[7:0];
                carry  = ~temp[8];  
                overflow = (A[7] != B[7]) && (result[7] != A[7]);
            end

            OP_INC: begin
                temp   = {1'b0, A} + 9'd1;
                result = temp[7:0];
                carry  = temp[8];
            end

            OP_DEC: begin
                temp   = {1'b0, A} - 9'd1;
                result = temp[7:0];
                carry  = ~temp[8];
            end

            OP_AND: begin
                result = A & B;
            end

            OP_OR: begin
                result = A | B;
            end

            OP_XOR: begin
                result = A ^ B;
            end

            OP_NOT: begin
                result = ~A;
            end

            OP_SHL: begin
                temp   = {A, 1'b0};
                result = temp[7:0];
                carry  = temp[8];
            end

            OP_SHR: begin
                carry  = A[0];
                result = A >> 1;
            end

            OP_ROL: begin
                result = {A[6:0], A[7]};
            end

            OP_ROR: begin
                result = {A[0], A[7:1]};
            end

            default: begin
                result = 8'd0;
            end
        endcase

        zero = (result == 8'd0);
        // Sign flag
        sign = result[7];
    end
endmodule
