module ALU(clk,btnc_i,ALU1,ALU2,ALU_control,ALU_result);
input clk,btnc_i;
input [31:0]ALU1,ALU2;
input [3:0]ALU_control;
output [31:0]ALU_result;
reg [31:0]ALU_result;


always@(*)begin
	if (ALU_control==4'b0010) ALU_result=ALU1+ALU2;
	else if(ALU_control==4'b0110) ALU_result=ALU1-ALU2;
	else if(ALU_control==4'b0000) ALU_result=ALU1&ALU2;
	else if(ALU_control==4'b0001) ALU_result=ALU1|ALU2;
	else if(ALU_control==4'b0111)begin
		if(ALU1<ALU2) ALU_result=32'b00000000000000000000000000000001;
		else ALU_result=32'b00000000000000000000000000000000;
	end
	else ALU_result=ALU_result;
end
endmodule
