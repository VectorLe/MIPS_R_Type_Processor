module ALUcontrol(
input [1:0] ALUop,
input [1:0] instruct,
output reg [1:0] opCode
    );
always @(*)
//if ALUOP is 0 => take the instruction number
//else what the opcode wants it to do
    opCode = instruct[1:0];
endmodule

