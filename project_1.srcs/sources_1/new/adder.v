`timescale 1ns/ 1ps  
module adder(a,b,o);
parameter N=64;
input [N-1:0] a,b;
output [N-1:0] o;
wire [N-1:0] carry;
genvar i;

generate 
for(i=0;i<N;i=i+1)
begin: generate_N_bit_Adder
  if(i==0) 
    halfAdder f(a[0],b[0],o[0],carry[0]);
  else
    fullAdder f(a[i],b[i],carry[i-1],o[i],carry[i]);
end
endgenerate
endmodule 
