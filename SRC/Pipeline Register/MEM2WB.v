module MEM2WB(clk,btnc_i,EX_MEM_ALU_result_r,EX_MEM_RegWrite_i,EX_MEM_write_register_i,EX_MEM_instruction_i,EX_MEM_RegWrite_r,EX_MEM_write_register_r,EX_MEM_instruction_r,EX_MEM_type_r,EX_MEM_type_i,EX_MEM_MemtoReg_i,read_data_i
			,MEM_WB_RegWrite_i,MEM_WB_RegWrite_r,MEM_WB_type_r,MEM_WB_type_i,MEM_WB_MemtoReg_i,MEM_WB_ALU_result_r,MEM_WB_write_register_i,MEM_WB_instruction_i,MEM_WB_write_register_r,MEM_WB_instruction_r,MEM_WB_read_data_i);
input clk,btnc_i,EX_MEM_RegWrite_i,EX_MEM_RegWrite_r,EX_MEM_type_r,EX_MEM_type_i,EX_MEM_MemtoReg_i;
input [31:0]EX_MEM_ALU_result_r,EX_MEM_write_register_i,EX_MEM_instruction_i,EX_MEM_write_register_r,EX_MEM_instruction_r,read_data_i;
output MEM_WB_RegWrite_i,MEM_WB_RegWrite_r,MEM_WB_type_r,MEM_WB_type_i,MEM_WB_MemtoReg_i;
output [31:0]MEM_WB_ALU_result_r,MEM_WB_write_register_i,MEM_WB_instruction_i,MEM_WB_write_register_r,MEM_WB_instruction_r,MEM_WB_read_data_i;
reg MEM_WB_RegWrite_i,MEM_WB_RegWrite_r,MEM_WB_type_r,MEM_WB_type_i,MEM_WB_MemtoReg_i;
reg [31:0]MEM_WB_ALU_result_r,MEM_WB_write_register_i,MEM_WB_instruction_i,MEM_WB_write_register_r,MEM_WB_instruction_r,MEM_WB_read_data_i;



always@(posedge clk)begin
if(!btnc_i)begin
	MEM_WB_ALU_result_r<=0;
	MEM_WB_RegWrite_i<=0;
	MEM_WB_write_register_i<=0;
	MEM_WB_instruction_i<=0;
	MEM_WB_RegWrite_r<=0;
	MEM_WB_write_register_r<=0;
	MEM_WB_instruction_r<=0;
	MEM_WB_type_r<=0;
	MEM_WB_type_i<=0;
	MEM_WB_MemtoReg_i<=0;
	MEM_WB_read_data_i<=0;
end
else begin
	MEM_WB_ALU_result_r<=EX_MEM_ALU_result_r;
	MEM_WB_RegWrite_i<=EX_MEM_RegWrite_i;
	MEM_WB_write_register_i<=EX_MEM_write_register_i;
	MEM_WB_instruction_i<=EX_MEM_instruction_i;
	MEM_WB_RegWrite_r<=EX_MEM_RegWrite_r;
	MEM_WB_write_register_r<=EX_MEM_write_register_r;
	MEM_WB_instruction_r<=EX_MEM_instruction_r;
	MEM_WB_type_r<=EX_MEM_type_r;
	MEM_WB_type_i<=EX_MEM_type_i;
	MEM_WB_MemtoReg_i<=EX_MEM_MemtoReg_i;
	MEM_WB_read_data_i<=read_data_i;
end
end
endmodule
