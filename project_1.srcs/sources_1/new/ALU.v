module ALU(
    input clk,
    input [1:0] sel,
    input [31:0] a, b,
    output reg [63:0] out
    );
    wire [63:0] product;
    wire [31:0] sum, diff;
    
    adder plus(.a(a), .b(b), .o(sum));
    subtractor minus(.a(a), .b(b), .cin(1), .o(diff));
    multiplier mul(.clk(clk), .a(a), .b(b), .out(product));
    
    always @(posedge clk)
      begin
        case (sel)
          0: out = sum;
          1: out = diff;
          2: out = product;
        endcase
      end
endmodule
