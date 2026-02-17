module ID_stage(clk,btnc_i,IF_ID_type_i,IF_ID_type_j,IF_ID_type_r,IF_ID_instruction_i,IF_ID_instruction_j,IF_ID_instruction_r
				,write_data_i,write_data_r,MEM_WB_write_register_i,MEM_WB_write_register_r,MEM_WB_RegWrite_i,MEM_WB_RegWrite_r
				,jump,jump_dir,ALUSrc,MemtoReg_i,RegWrite_i,MemRead_i,MemWrite_i,Branch_i,ALUOp1_i,ALUOp0_i,bne_i,RegWrite_r,ALUOp1_r,ALUOp0_r
				,signextend,rdata1_i,rdata2_i,write_register_i,rdata1_r,rdata2_r,write_register_r
				,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10);
input clk,btnc_i,IF_ID_type_i,IF_ID_type_j,IF_ID_type_r,MEM_WB_RegWrite_i,MEM_WB_RegWrite_r;
input [31:0]IF_ID_instruction_i,IF_ID_instruction_j,IF_ID_instruction_r,write_data_i,write_data_r,MEM_WB_write_register_i,MEM_WB_write_register_r;
output jump,ALUSrc,MemtoReg_i,RegWrite_i,MemRead_i,MemWrite_i,Branch_i,ALUOp1_i,ALUOp0_i,bne_i,RegWrite_r,ALUOp1_r,ALUOp0_r;
output [31:0]jump_dir,signextend,rdata1_i,rdata2_i,write_register_i,rdata1_r,rdata2_r,write_register_r;
reg jump;
reg [31:0]jump_dir;
reg [31:0]signextend,rdata1_i,rdata2_i,write_register_i;
reg ALUSrc,MemtoReg_i,RegWrite_i,MemRead_i,MemWrite_i,Branch_i,ALUOp1_i,ALUOp0_i,bne_i;
reg [31:0]rdata1_r,rdata2_r,write_register_r;
reg RegWrite_r,ALUOp1_r,ALUOp0_r;
reg [31:0]r1_ad_i,r2_ad_i,r1_ad_r,r2_ad_r;
wire [31:0]rdata1_i_temp,rdata2_i_temp,rdata1_r_temp,rdata2_r_temp;
wire [31:0]reg1_temp,reg2_temp,reg3_temp,reg4_temp,reg5_temp,reg6_temp,reg7_temp,reg8_temp,reg9_temp,reg10_temp;
output [31:0]reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10;

assign reg1=reg1_temp;
assign reg2=reg2_temp;
assign reg3=reg3_temp;
assign reg4=reg4_temp;
assign reg5=reg5_temp;
assign reg6=reg6_temp;
assign reg7=reg7_temp;
assign reg8=reg8_temp;
assign reg9=reg9_temp;
assign reg10=reg10_temp;

register register(.clk(clk),.btnc_i(btnc_i),.r1_ad_i(r1_ad_i),.r2_ad_i(r2_ad_i),.r1_ad_r(r1_ad_r),.r2_ad_r(r2_ad_r)
				,.write_data_i(write_data_i),.write_data_r(write_data_r),.MEM_WB_write_register_i(MEM_WB_write_register_i)
				,.MEM_WB_write_register_r(MEM_WB_write_register_r),.MEM_WB_RegWrite_i(MEM_WB_RegWrite_i),.MEM_WB_RegWrite_r(MEM_WB_RegWrite_r)
				,.rdata1_i(rdata1_i_temp),.rdata2_i(rdata2_i_temp),.rdata1_r(rdata1_r_temp),.rdata2_r(rdata2_r_temp)
				,.reg1(reg1_temp),.reg2(reg2_temp),.reg3(reg3_temp),.reg4(reg4_temp),.reg5(reg5_temp),.reg6(reg6_temp),.reg7(reg7_temp),.reg8(reg8_temp),.reg9(reg9_temp),.reg10(reg10_temp));


always@(*)begin
///////J
	if(IF_ID_type_j)begin
		jump=1;
		jump_dir=IF_ID_instruction_j[25:0];
	end
	else begin
		jump_dir=32'b11111111111111111111111111111111;
		jump=0;
	end
///////

///////I
	if(IF_ID_type_i)begin
		if(IF_ID_instruction_i[15]==1) signextend={16'b1111111111111111,IF_ID_instruction_i[15:0]};
		else signextend={16'b0000000000000000,IF_ID_instruction_i[15:0]};
		case(IF_ID_instruction_i[31:26])
			6'b000000:ALUSrc=1'b0;
			6'b100011:ALUSrc=1'b1;
			6'b101011:ALUSrc=1'b1;
			6'b000100:ALUSrc=1'b0;
			6'b000101:ALUSrc=1'b0;
			6'b011100:ALUSrc=1'b0;
			default ALUSrc=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:MemtoReg_i=1'b0;
			6'b100011:MemtoReg_i=1'b1;
			default MemtoReg_i=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:RegWrite_i=1'b1;
			6'b100011:RegWrite_i=1'b1;
			6'b101011:RegWrite_i=1'b0;
			6'b000100:RegWrite_i=1'b0;
			6'b000101:RegWrite_i=1'b0;
			6'b011100:RegWrite_i=1'b1;
			default RegWrite_i=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:MemRead_i=1'b0;
			6'b100011:MemRead_i=1'b1;
			6'b101011:MemRead_i=1'b0;
			6'b000100:MemRead_i=1'b0;
			6'b000101:MemRead_i=1'b0;
			6'b011100:MemRead_i=1'b0;
			default MemRead_i=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:MemWrite_i=1'b0;
			6'b100011:MemWrite_i=1'b0;
			6'b101011:MemWrite_i=1'b1;
			6'b000100:MemWrite_i=1'b0;
			6'b000101:MemWrite_i=1'b0;
			6'b011100:MemWrite_i=1'b0;
			default MemWrite_i=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:Branch_i=1'b0;
			6'b100011:Branch_i=1'b0;
			6'b101011:Branch_i=1'b0;
			6'b000100:Branch_i=1'b1;
			6'b000101:Branch_i=1'b0;
			6'b011100:Branch_i=1'b0;
			default Branch_i=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:ALUOp1_i=1'b1;
			6'b100011:ALUOp1_i=1'b0;
			6'b101011:ALUOp1_i=1'b0;
			6'b000100:ALUOp1_i=1'b0;
			6'b000101:ALUOp1_i=1'b0;
			6'b011100:ALUOp1_i=1'b1;
			default ALUOp1_i=1'b0;
		endcase
		case(IF_ID_instruction_i[31:26])
			6'b000000:ALUOp0_i=1'b0;
			6'b100011:ALUOp0_i=1'b0;
			6'b101011:ALUOp0_i=1'b0;
			6'b000100:ALUOp0_i=1'b1;
			6'b000101:ALUOp0_i=1'b1;
			6'b011100:ALUOp0_i=1'b0;
			default ALUOp0_i=1'b0;
		endcase
		if(IF_ID_instruction_i[31:26]==6'b000101)bne_i=1'b1;
		else bne_i=1'b0;
		r1_ad_i=IF_ID_instruction_i[25:21];
		write_register_i=IF_ID_instruction_i[20:16];
		r2_ad_i=write_register_i;
		rdata1_i=rdata1_i_temp;
		rdata2_i=rdata2_i_temp;
	end
	else begin
		ALUSrc=1'b0;
		MemtoReg_i=1'b0;
		RegWrite_i=1'b0;
		MemRead_i=1'b0;
		MemWrite_i=1'b0;
		Branch_i=1'b0;
		ALUOp1_i=1'b0;
		ALUOp0_i=1'b0;
		signextend=0;
		rdata1_i=0;
		rdata2_i=0;
		write_register_i=0;
		r1_ad_i=0;
		r2_ad_i=0;
	end
/////

///////R

	if(IF_ID_type_r)begin
		case(IF_ID_instruction_r[31:26])
			6'b000000:RegWrite_r=1'b1;
			6'b100011:RegWrite_r=1'b1;
			6'b101011:RegWrite_r=1'b0;
			6'b000100:RegWrite_r=1'b0;
			6'b000101:RegWrite_r=1'b0;
			6'b011100:RegWrite_r=1'b1;
			default RegWrite_r=1'b0;
		endcase
		case(IF_ID_instruction_r[31:26])
			6'b000000:ALUOp1_r=1'b1;
			6'b100011:ALUOp1_r=1'b0;
			6'b101011:ALUOp1_r=1'b0;
			6'b000100:ALUOp1_r=1'b0;
			6'b000101:ALUOp1_r=1'b0;
			6'b011100:ALUOp1_r=1'b1;
			default ALUOp1_r=1'b0;
		endcase
		case(IF_ID_instruction_r[31:26])
			6'b000000:ALUOp0_r=1'b0;
			6'b100011:ALUOp0_r=1'b0;
			6'b101011:ALUOp0_r=1'b0;
			6'b000100:ALUOp0_r=1'b1;
			6'b000101:ALUOp0_r=1'b1;
			6'b011100:ALUOp0_r=1'b0;
			default ALUOp0_r=1'b0;
		endcase
		r1_ad_r=IF_ID_instruction_r[25:21];
		r2_ad_r=IF_ID_instruction_r[20:16];
		write_register_r=IF_ID_instruction_r[15:11];
		rdata1_r=rdata1_r_temp;
		rdata2_r=rdata2_r_temp;
	end
	else begin
		RegWrite_r=1'b0;
		ALUOp1_r=1'b0;
		ALUOp0_r=1'b0;
		write_register_r=0;
		rdata1_r=0;
		rdata2_r=0;
		r1_ad_r=0;
		r2_ad_r=0;
	end
/////
end
endmodule
