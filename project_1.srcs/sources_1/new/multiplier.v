`timescale 1ns/ 1ps
module multiplier( input clk,input [31:0] a,input [31:0] b,output reg [63:0] out);
reg [63:0] AQ;
integer i;

always @(posedge clk)
begin            
  AQ = a;
  for(i=0; i<32; i=i+1)
  begin
     if( AQ[0] == 1'b1 )
         AQ[63:32] = AQ[63:32]+b;
     AQ = AQ>>1;
  end
    out = AQ;
end
endmodule

