`timescale 1ns/ 1ps
module MIPS_register(reset_n, CLK, D,Q);
    input CLK,reset_n;
    parameter n = 4;
    input [n-1:0] D;
    output reg [n-1:0] Q;
    
    always @(posedge CLK or negedge reset_n)
    if (!reset_n)
        Q <= 0;
    else if (CLK == 1)
        Q <= D;    
    
endmodule
