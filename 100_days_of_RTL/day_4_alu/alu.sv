// Design and verify a 8-bit ALU which supports the following encoded operations:
/*
3'b000	ADD	-
3'b001	SUB	-
3'b010	SLL	Vector a should left shift using bits 2:0 of vector b
3'b011	LSR	Vector a should right shift using bits 2:0 of vector b
3'b100	AND	-
3'b101	OR	-
3'b110	XOR	-
3'b111	EQL	Output should be 1 when equal otherwise 0
*/

module alu (
    input logic [7:0]a,
    input logic [7:0]b,
    input logic [2:0]encode_op,

    output logic [7:0]alu_o
);

logic carry;

always@(*) begin //can't use always_comb 
    case(encode_op)
    3'b000: {carry, alu_o}= {1'b0, a} + {1'b0, b};
    //3'b000: alu_o = a+b;
    3'b001: alu_o = a-b;
    3'b010: alu_o = a[7:0]<<b[2:0];
    3'b011: alu_o = a[7:0]>>b[2:0];
    3'b100: alu_o = a&b;
    3'b101: alu_o = a|b;
    3'b110: alu_o = a^b;
    3'b111: alu_o = a == b;

    endcase
end


endmodule


