module forwarding_unit(clk,btnc_i,EX_MEM_RegWrite_r,MEM_WB_RegWrite_r,MEM_WB_RegWrite_i,EX_MEM_write_register_r,instruction,MEM_WB_instruction_i,MEM_WB_instruction_r,MEM_WB_write_register_r,forwardA,forwardB);
input clk,btnc_i,EX_MEM_RegWrite_r,MEM_WB_RegWrite_r,MEM_WB_RegWrite_i;
input [31:0]EX_MEM_write_register_r,instruction,MEM_WB_instruction_i,MEM_WB_instruction_r,MEM_WB_write_register_r;
output [2:0]forwardA,forwardB;
reg [2:0]forwardA,forwardB;


always@(*)begin
	if((EX_MEM_write_register_r!=0)&&(EX_MEM_RegWrite_r==1)&&(EX_MEM_write_register_r==instruction[25:21]))forwardA=3'b010;
	else if((MEM_WB_instruction_i[31:26]!=6'b100011)&&(MEM_WB_write_register_r!=0)&&(MEM_WB_RegWrite_r==1)&&(MEM_WB_write_register_r==instruction[25:21]))forwardA=3'b001;
	else if((MEM_WB_instruction_i[31:26]==6'b100011)&&(MEM_WB_instruction_i[31:26]!=6'b101011)&&(MEM_WB_RegWrite_i==1)&&(MEM_WB_instruction_i[20:16]==instruction[25:21]))forwardA=3'b011;
	else if((MEM_WB_instruction_i[31:26]==6'b100011)&&(MEM_WB_instruction_i[31:26]!=6'b101011)&&(MEM_WB_RegWrite_i==1)&&(MEM_WB_instruction_r[15:11]==instruction[25:21]))forwardA=3'b111;
	else forwardA=3'b000;
	if((EX_MEM_write_register_r!=0)&&(EX_MEM_RegWrite_r==1)&&(EX_MEM_write_register_r==instruction[20:16]))forwardB=3'b010;
	else if((MEM_WB_instruction_i[31:26]!=6'b100011)&&(MEM_WB_write_register_r!=0)&&(MEM_WB_RegWrite_r==1)&&(MEM_WB_write_register_r==instruction[20:16]))forwardB=3'b001;
	else if((MEM_WB_instruction_i[31:26]==6'b100011)&&(MEM_WB_instruction_i[31:26]!=6'b101011)&&(MEM_WB_RegWrite_i==1)&&(MEM_WB_instruction_i[20:16]==instruction[20:16]))forwardB=3'b011;
	else if((MEM_WB_instruction_i[31:26]==6'b100011)&&(MEM_WB_instruction_i[31:26]!=6'b101011)&&(MEM_WB_RegWrite_i==1)&&(MEM_WB_instruction_r[15:11]==instruction[20:16]))forwardB=3'b111;
	else forwardB=3'b000;
end
endmodule
