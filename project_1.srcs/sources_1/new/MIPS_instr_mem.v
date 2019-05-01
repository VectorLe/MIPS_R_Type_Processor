module MIPS_instr_mem(CLK, pc_addr,instr);
    input CLK;
    input [3:0] pc_addr;
    output reg [31:0] instr;
    parameter n = 16;
    reg [31:0] rom [n-1:0];
    initial
        begin
               //bits      6     |5   |5   |5   |5    |6
               //          opcode|rt  |rs  |rd  |shamt|func   //shamt=shift amt, no need
               rom[0] = 32'b00000000110000101001000000000001; //multiply  reg 6 with reg 2 (store in register 18)
               rom[1] = 32'b00000001111010000001000000000010; //subtract 15 by 8 (store in register 2)
               rom[2] = 32'b10101100010001010000000000000000; //add 2 and  (store in 0?)
               rom[3] = 32'b00000000110001000001100000000000; //add 6 and 4 (store in 3?)
               rom[4] = 32'b10001101010000010000000000000000; //add 10 and 1 (store in 0?)
               rom[5] = 32'b00000000011000110000000000000010; //multiply 3 and 3
               rom[6] = 32'b00000001000001110000000000000001; //subtract 8 by 7
               rom[7] = 32'b00000001111000010000000000000001; //subtract 15 by 1
               rom[8] = 32'b00000000010001010000000000000010; //multiply 2 and 5
               rom[9] = 32'b00000000011010000000000000000000; //add 3 and 8
               rom[10] = 32'b00000000010001000000000000000000; //add 2 and 4
               rom[11] = 32'b00000000000000000000000000000000;
               rom[12] = 32'b00000000000000000000000000000000;
               rom[13] = 32'b00000000000000000000000000000000;
               rom[14] = 32'b00000000000000000000000000000000;
               rom[15] = 32'b00000000000000000000000000000000;
        end
    always @(posedge CLK)
        begin
            instr = rom[pc_addr];
        end 
endmodule