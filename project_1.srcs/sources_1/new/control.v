module control(
input clk, input  [5:0] in,
output reg instrCont,
output reg regDstBranch,
output reg memRead,
output reg memToReg,
output reg memWrite,
output reg [1:0] ALUop,
output reg ALUsrc,
output reg regWrite);
always @ (posedge clk)
    case(in)
    0: begin instrCont = 1; regDstBranch = 0; memRead = 0; memToReg = 0; ALUop = 1; memWrite = 0; ALUsrc = 0; regWrite = 1; end
    35: begin instrCont = 0; regDstBranch = 0; memRead = 1; memToReg = 0; ALUop = 0; memWrite = 0; ALUsrc = 0; regWrite = 1; end
    43: begin instrCont = 0; regDstBranch = 0; memRead = 0; memToReg = 0; ALUop = 1; memWrite = 1; ALUsrc = 0; regWrite = 0; end //change to multiply
    default: begin instrCont = 0; regDstBranch = 0; memRead = 0; memToReg = 0; ALUop = 0; memWrite = 0; ALUsrc = 0; regWrite = 0; end
endcase
endmodule
