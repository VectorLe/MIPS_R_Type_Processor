module benchtest();
reg clk = 0;
reg [3:0] dataIn;
wire [31:0] dataOut;
top uut(clk, dataIn, dataOut);
initial begin forever #1 clk = ~clk; end

initial begin
dataIn = 0; #10
dataIn = 1; #10
dataIn = 2; #10
dataIn = 3; #10
dataIn = 4; #10
dataIn = 5;
end
endmodule
