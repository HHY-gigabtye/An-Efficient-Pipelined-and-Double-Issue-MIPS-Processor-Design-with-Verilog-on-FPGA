module mips_tb;
reg clk,btnc_i;
reg [31:0]in;
wire [31:0]out;

TopModule TopModule(.clk(clk),.btnc_i(btnc_i),.in(in),.out(out));

always #10 clk<=~clk;

initial begin
btnc_i=1'b0;
clk=1'b0;
in=32'b10000111011001010100001100100001;
#525
btnc_i=~btnc_i;
#10000	$finish;
end


endmodule