`timescale 1ns/ 1ps
module subtractor(a, b, cin, o);
input [31:0] a;
input [31:0] b;
input cin;
output reg [31:0] o;
reg [32:0] c;
integer i;

always @ (a or b or cin)
  begin
    c[0]=cin;
    if (cin == 0) 
    begin
      for ( i=0; i<32 ; i=i+1)
        begin
         o[i]= a[i]^b[i]^c[i];
         c[i+1]= (a[i]&b[i])|(a[i]&c[i])|(b[i]&c[i]);
        end
      end
    else if (cin == 1) begin
      for ( i=0; i<32 ; i=i+1)
        begin
          o[i]= a[i]^(~ b[i])^c[i];
          c[i+1]= (a[i]&(~b[i]))|(a[i]&c[i])|((~b[i])&c[i]);
        end
      end
    end
endmodule
