module EX2MEM(clk,btnc_i,ALU_result_i,ALU_result_r,EX_rdata2_i,ID_EX_MemtoReg_i,ID_EX_RegWrite_i,ID_EX_MemRead_i,ID_EX_MemWrite_i,ID_EX_write_register_i,ID_EX_instruction_i,ID_EX_type_i,ID_EX_RegWrite_r,ID_EX_write_register_r,ID_EX_instruction_r,ID_EX_type_r
			,EX_MEM_ALU_result_i,EX_MEM_ALU_result_r,EX_MEM_rdata2_i,EX_MEM_MemtoReg_i,EX_MEM_RegWrite_i,EX_MEM_MemRead_i,EX_MEM_MemWrite_i,EX_MEM_write_register_i,EX_MEM_instruction_i,EX_MEM_type_i,EX_MEM_RegWrite_r,EX_MEM_write_register_r,EX_MEM_instruction_r,EX_MEM_type_r);
input clk,btnc_i,ID_EX_MemtoReg_i,ID_EX_RegWrite_i,ID_EX_MemRead_i,ID_EX_MemWrite_i,ID_EX_type_i,ID_EX_RegWrite_r,ID_EX_type_r;
input [31:0]ALU_result_i,ALU_result_r,EX_rdata2_i,ID_EX_write_register_i,ID_EX_instruction_i,ID_EX_write_register_r,ID_EX_instruction_r;
output EX_MEM_MemtoReg_i,EX_MEM_RegWrite_i,EX_MEM_MemRead_i,EX_MEM_MemWrite_i,EX_MEM_type_i,EX_MEM_RegWrite_r,EX_MEM_type_r;
output [31:0]EX_MEM_ALU_result_i,EX_MEM_ALU_result_r,EX_MEM_rdata2_i,EX_MEM_write_register_i,EX_MEM_instruction_i,EX_MEM_write_register_r,EX_MEM_instruction_r;
reg EX_MEM_MemtoReg_i,EX_MEM_RegWrite_i,EX_MEM_MemRead_i,EX_MEM_MemWrite_i,EX_MEM_type_i,EX_MEM_RegWrite_r,EX_MEM_type_r;
reg [31:0]EX_MEM_ALU_result_i,EX_MEM_ALU_result_r,EX_MEM_rdata2_i,EX_MEM_write_register_i,EX_MEM_instruction_i,EX_MEM_write_register_r,EX_MEM_instruction_r;



always@(posedge clk)begin
if(!btnc_i)begin
	EX_MEM_ALU_result_i<=0;
	EX_MEM_ALU_result_r<=0;
	EX_MEM_rdata2_i<=0;
	EX_MEM_MemtoReg_i<=0;
	EX_MEM_RegWrite_i<=0;
	EX_MEM_MemRead_i<=0;
	EX_MEM_MemWrite_i<=0;
	EX_MEM_write_register_i<=0;
	EX_MEM_instruction_i<=0;
	EX_MEM_type_i<=0;
	EX_MEM_RegWrite_r<=0;
	EX_MEM_write_register_r<=0;
	EX_MEM_instruction_r<=0;
	EX_MEM_type_r<=0;
end
else begin
	EX_MEM_ALU_result_i<=ALU_result_i;
	EX_MEM_ALU_result_r<=ALU_result_r;
	EX_MEM_rdata2_i<=EX_rdata2_i;
	EX_MEM_MemtoReg_i<=ID_EX_MemtoReg_i;
	EX_MEM_RegWrite_i<=ID_EX_RegWrite_i;
	EX_MEM_MemRead_i<=ID_EX_MemRead_i;
	EX_MEM_MemWrite_i<=ID_EX_MemWrite_i;
	EX_MEM_write_register_i<=ID_EX_write_register_i;
	EX_MEM_instruction_i<=ID_EX_instruction_i;
	EX_MEM_type_i<=ID_EX_type_i;
	EX_MEM_RegWrite_r<=ID_EX_RegWrite_r;
	EX_MEM_write_register_r<=ID_EX_write_register_r;
	EX_MEM_instruction_r<=ID_EX_instruction_r;
	EX_MEM_type_r<=ID_EX_type_r;
end
end
endmodule