`timescale 1ns/ 1ps
module MIPS_registerfile(regWrite,CLK,read_reg1,read_reg2,write_reg,write_data,read_data1,read_data2);
    input [4:0] read_reg1,read_reg2,write_reg;
    input [31:0] write_data;
    input regWrite,CLK;
    output reg [31:0] read_data1,read_data2;  
    reg [31:0] regarray [0:31];
    
   initial begin
        regarray[0] = 0;
        regarray[1] = 1;
        regarray[2] = 2;
        regarray[3] = 3;
        regarray[4] = 4;
        regarray[5] = 5;
        regarray[6] = 6;
        regarray[7] = 7;
        regarray[8] = 8;
        regarray[9] = 9;
        regarray[10] = 10;
        regarray[11] = 11;
        regarray[12] = 12;
        regarray[13] = 13;
        regarray[14] = 14;
        regarray[15] = 15;
        regarray[16] = 16;
        regarray[17] = 17;
        regarray[18] = 18;
        regarray[19] = 19;
        regarray[20] = 20;
        regarray[21] = 21;
        regarray[22] = 22;
        regarray[23] = 23;
        regarray[24] = 24;
        regarray[25] = 25;
        regarray[26] = 26;
        regarray[27] = 27;
        regarray[28] = 28;
        regarray[29] = 29;
        regarray[30] = 30;
        regarray[31] = 31;
    end 

always @(posedge CLK)
 begin
 if (regWrite == 1)
  begin
   regarray[write_reg] <= write_data;
    end
 end
 always @(negedge CLK)
 begin
  read_data1 <= regarray[read_reg1];
  read_data2 <= regarray[read_reg2];
 end
endmodule
