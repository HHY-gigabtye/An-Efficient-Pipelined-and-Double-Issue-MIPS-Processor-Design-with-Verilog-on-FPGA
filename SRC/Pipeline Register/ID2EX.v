module ID2EX(clk,btnc_i,ALUSrc,MemtoReg_i,RegWrite_i,MemRead_i,MemWrite_i,Branch_i,ALUOp1_i,ALUOp0_i,bne_i,RegWrite_r,ALUOp1_r,ALUOp0_r
			,PCSrc,hazard,IF_ID_type_i,IF_ID_type_r,IF_ID_program_counter,signextend,rdata1_i,rdata2_i,write_register_i,rdata1_r,rdata2_r,write_register_r,IF_ID_instruction_i,IF_ID_instruction_r
			,ID_EX_ALUSrc,ID_EX_MemtoReg_i,ID_EX_RegWrite_i,ID_EX_MemRead_i,ID_EX_MemWrite_i,ID_EX_Branch_i,ID_EX_ALUOp1_i,ID_EX_ALUOp0_i,ID_EX_bne_i,ID_EX_RegWrite_r,ID_EX_ALUOp1_r,ID_EX_ALUOp0_r,ID_EX_type_i,ID_EX_type_r
			,ID_EX_program_counter,ID_EX_signextend,ID_EX_rdata1_i,ID_EX_rdata2_i,ID_EX_write_register_i,ID_EX_rdata1_r,ID_EX_rdata2_r,ID_EX_write_register_r,ID_EX_instruction_i,ID_EX_instruction_r);
			
input clk,btnc_i,ALUSrc,MemtoReg_i,RegWrite_i,MemRead_i,MemWrite_i,Branch_i,ALUOp1_i,ALUOp0_i,bne_i,RegWrite_r,ALUOp1_r,ALUOp0_r,PCSrc,hazard,IF_ID_type_i,IF_ID_type_r;
input [31:0]IF_ID_program_counter,signextend,rdata1_i,rdata2_i,write_register_i,rdata1_r,rdata2_r,write_register_r,IF_ID_instruction_i,IF_ID_instruction_r;
output ID_EX_ALUSrc,ID_EX_MemtoReg_i,ID_EX_RegWrite_i,ID_EX_MemRead_i,ID_EX_MemWrite_i,ID_EX_Branch_i,ID_EX_ALUOp1_i,ID_EX_ALUOp0_i,ID_EX_bne_i,ID_EX_RegWrite_r,ID_EX_ALUOp1_r,ID_EX_ALUOp0_r,ID_EX_type_i,ID_EX_type_r;
output [31:0]ID_EX_program_counter,ID_EX_signextend,ID_EX_rdata1_i,ID_EX_rdata2_i,ID_EX_write_register_i,ID_EX_rdata1_r,ID_EX_rdata2_r,ID_EX_write_register_r,ID_EX_instruction_i,ID_EX_instruction_r;
reg ID_EX_ALUSrc,ID_EX_MemtoReg_i,ID_EX_RegWrite_i,ID_EX_MemRead_i,ID_EX_MemWrite_i,ID_EX_Branch_i,ID_EX_ALUOp1_i,ID_EX_ALUOp0_i,ID_EX_bne_i,ID_EX_RegWrite_r,ID_EX_ALUOp1_r,ID_EX_ALUOp0_r,ID_EX_type_i,ID_EX_type_r;
reg [31:0]ID_EX_program_counter,ID_EX_signextend,ID_EX_rdata1_i,ID_EX_rdata2_i,ID_EX_write_register_i,ID_EX_rdata1_r,ID_EX_rdata2_r,ID_EX_write_register_r,ID_EX_instruction_i,ID_EX_instruction_r;

always@(posedge clk)begin
	if(!btnc_i)begin
		ID_EX_ALUSrc<=0;
		ID_EX_MemtoReg_i<=0;
		ID_EX_RegWrite_i<=0;
		ID_EX_MemRead_i<=0;
		ID_EX_MemWrite_i<=0;
		ID_EX_Branch_i<=0;
		ID_EX_ALUOp1_i<=0;
		ID_EX_ALUOp0_i<=0;
		ID_EX_bne_i<=0;
		ID_EX_signextend<=0;
		ID_EX_rdata1_i<=0;
		ID_EX_rdata2_i<=0;
		ID_EX_write_register_i<=0;
		ID_EX_instruction_i<=0;
		ID_EX_type_i<=0;
		
		ID_EX_RegWrite_r<=0;
		ID_EX_ALUOp1_r<=0;
		ID_EX_ALUOp0_r<=0;
		ID_EX_program_counter<=0;
		ID_EX_rdata1_r<=0;
		ID_EX_rdata2_r<=0;
		ID_EX_write_register_r<=0;
		ID_EX_instruction_r<=0;
		ID_EX_type_r<=0;
	end
	else begin
		if(PCSrc||hazard)begin
			ID_EX_ALUSrc<=0;
			ID_EX_MemtoReg_i<=0;
			ID_EX_RegWrite_i<=0;
			ID_EX_MemRead_i<=0;
			ID_EX_MemWrite_i<=0;
			ID_EX_Branch_i<=0;
			ID_EX_ALUOp1_i<=0;
			ID_EX_ALUOp0_i<=0;
			ID_EX_bne_i<=0;
			ID_EX_signextend<=0;
			ID_EX_rdata1_i<=0;
			ID_EX_rdata2_i<=0;
			ID_EX_write_register_i<=0;
			ID_EX_instruction_i<=0;
			ID_EX_type_i<=0;
		
			ID_EX_RegWrite_r<=0;
			ID_EX_ALUOp1_r<=0;
			ID_EX_ALUOp0_r<=0;
			ID_EX_program_counter<=0;
			ID_EX_rdata1_r<=0;
			ID_EX_rdata2_r<=0;
			ID_EX_write_register_r<=0;
			ID_EX_instruction_r<=0;
			ID_EX_type_r<=0;
		end
		else begin
			ID_EX_ALUSrc<=ALUSrc;
			ID_EX_MemtoReg_i<=MemtoReg_i;
			ID_EX_RegWrite_i<=RegWrite_i;
			ID_EX_MemRead_i<=MemRead_i;
			ID_EX_MemWrite_i<=MemWrite_i;
			ID_EX_Branch_i<=Branch_i;
			ID_EX_ALUOp1_i<=ALUOp1_i;
			ID_EX_ALUOp0_i<=ALUOp0_i;
			ID_EX_bne_i<=bne_i;
			ID_EX_signextend<=signextend;
			ID_EX_rdata1_i<=rdata1_i;
			ID_EX_rdata2_i<=rdata2_i;
			ID_EX_write_register_i<=write_register_i;
			ID_EX_instruction_i<=IF_ID_instruction_i;
			ID_EX_type_i<=IF_ID_type_i;
		
			ID_EX_RegWrite_r<=RegWrite_r;
			ID_EX_ALUOp1_r<=ALUOp1_r;
			ID_EX_ALUOp0_r<=ALUOp0_r;
			ID_EX_program_counter<=IF_ID_program_counter;
			ID_EX_rdata1_r<=rdata1_r;
			ID_EX_rdata2_r<=rdata2_r;
			ID_EX_write_register_r<=write_register_r;
			ID_EX_instruction_r<=IF_ID_instruction_r;
			ID_EX_type_r<=IF_ID_type_r;
		end
	end
end
endmodule
