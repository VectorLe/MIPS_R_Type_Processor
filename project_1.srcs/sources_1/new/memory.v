module memory(clk, read, write, address, write_data, read_data);
input clk;
input read; //read enable
input write; //write enable. It can only read OR write, if both are enabled it will do nothing.
input[4:0] address;
input[31:0] write_data;
output reg [31:0] read_data;
reg [31:0] mem[0:31]; //32 separate 32-bit memory "slots", if we want more we can simply change this number, but we should also change the bit size of address
always @(posedge clk)
begin
    if (write && !read) mem[address] = write_data;
    else if (!write && read) read_data = mem[address];
end
endmodule
