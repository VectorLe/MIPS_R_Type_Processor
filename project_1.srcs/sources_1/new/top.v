`timescale 1ns/ 1ps
module top(input clk, input [3:0] dataIn, output [31:0] dataOut);//output [6:0] a_to_g, output [7:0] an );//output [31:0] dataOut);
wire[31:0] instr,
           //dataOut,//!
           leftAddResult,
           rightAddResult,
           regReadData1,
           regReadData2,
           aeToMux,
           muxToALU,
           ALUresult,
           muxToRegWrite,
           memToMux;
wire[4:0] writeReg;
wire[1:0]  ALUopCode;
wire[1:0] ALUop;
wire instrCont, regDatBranch, memRead, memToReg, memWrite, ALUsrc, regWrite;
assign dataOut = muxToRegWrite;
    MIPS_instr_mem intrMem(clk, dataIn, instr);
    control ctrl(clk, instr[31:26], instrCont, regDatBranch, memRead, memToReg, memWrite, ALUop, ALUsrc, regWrite);
    MIPS_registerfile registers(regWrite, clk, instr[25:21], instr[20:16], writeReg, muxToRegWrite, regReadData1, regReadData2);
    memory mem(clk, memRead, memWrite, ALUresult, regReadData2, memToMux);
    signExt ae(instr[15:0], aeToMux);
    ALUcontrol ALUcon(ALUop, instr[1:0], ALUopCode);
    

    ALU bottomRightALU(clk, ALUopCode, regReadData1, muxToALU, ALUresult);
    
    mux2_1 instrReg(instr[20:16], instr[15:11], instrCont, writeReg);
    mux2_1 regALU(regReadData2, aeToMux, ALUsrc, muxToALU);
    mux2_1 ALUmem(ALUresult, memToMux, memToReg, muxToRegWrite);
    
   // sevenSeg display( dataOut, clk, a_to_g, an);
endmodule
