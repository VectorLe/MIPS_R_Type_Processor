`timescale 1ns / 1ps

module sevenSeg(
    input [31:0] value,
    input clk,
    output reg [6:0] a_to_g,
    output reg [7:0] an //side of display used
);

//assign an1 = 8'b11111111; // used to disable the MSB four digit on the board 
// if you like to see a glitch on the design, try to remove the an1 and keep it floating, the glitch will help on the MSB digit :) 

// internal wires and register for connections 
wire [2:0] s;
reg  [3:0] digit;
wire [7:0] aen;
reg  [19:0] clkdiv;

assign s = clkdiv[19:17]; 
assign aen = 8'b11111111;  // enable all digits

//Quad 4-to-1 xx                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Mux: mux44
always @(s, value)
begin
    case (s)
        0: digit = value[3:0];
        1: digit = value[7:4];
        2: digit = value[11:8];
        3: digit = value[15:12];
        4: digit = value[19:16];
        5: digit = value[23:20];
        6: digit = value[27:24];
        7: digit = value[31:28];
        default: digit = value[3:0];
    endcase
end

// 7-segment decoder : hex7seg
always @ (digit)
    begin 
        case(digit)
              0: a_to_g = 7'b0000001;
              1: a_to_g = 7'b1001111;
              2: a_to_g = 7'b0010010;
              3: a_to_g = 7'b0000110;
              4: a_to_g = 7'b1001100;
              5: a_to_g = 7'b0100100;
              6: a_to_g = 7'b0100000;
              7: a_to_g = 7'b0001111;
              8: a_to_g = 7'b0000000;
              9: a_to_g = 7'b0000100;
             'hA: a_to_g = 7'b0001000;
             'hB: a_to_g = 7'b1100000;
             'hC: a_to_g = 7'b0110001;
             'hD: a_to_g = 7'b1000010;
             'hE: a_to_g = 7'b0110000;
             'hF: a_to_g = 7'b0111000;
            default: a_to_g = 7'b0000001; //0 
        endcase 
    end
    
 // digit select: anode 
 always@(s, aen)
    begin 
        an = 8'b11111111;
        if(aen[s] == 1)
            an[s] = 0;
    end         
    
 
    
 endmodule