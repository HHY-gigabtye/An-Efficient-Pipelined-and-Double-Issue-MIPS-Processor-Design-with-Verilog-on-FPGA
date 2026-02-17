module EX_stage(clk,btnc_i,ID_EX_ALUSrc,ID_EX_Branch_i,ID_EX_ALUOp1_i,ID_EX_ALUOp0_i,ID_EX_bne_i,ID_EX_ALUOp1_r,ID_EX_ALUOp0_r,ID_EX_type_i,ID_EX_type_r,forwardA_i,forwardA_r,forwardB_i,forwardB_r
				,ID_EX_program_counter,ID_EX_signextend,ID_EX_rdata1_i,ID_EX_rdata2_i,ID_EX_rdata1_r,ID_EX_rdata2_r,ID_EX_instruction_i,ID_EX_instruction_r,MEM_WB_ALU_result_r,EX_MEM_ALU_result_r,MEM_WB_read_data_i,zero,PCSrc,add_result,ALU_result_i,ALU_result_r,EX_rdata2_i);
input clk,btnc_i,ID_EX_ALUSrc,ID_EX_Branch_i,ID_EX_ALUOp1_i,ID_EX_ALUOp0_i,ID_EX_bne_i,ID_EX_ALUOp1_r,ID_EX_ALUOp0_r,ID_EX_type_i,ID_EX_type_r;
input [2:0]forwardA_i,forwardA_r,forwardB_i,forwardB_r;
input [31:0]ID_EX_program_counter,ID_EX_signextend,ID_EX_rdata1_i,ID_EX_rdata2_i,ID_EX_rdata1_r,ID_EX_rdata2_r,ID_EX_instruction_i,ID_EX_instruction_r,MEM_WB_ALU_result_r,EX_MEM_ALU_result_r,MEM_WB_read_data_i;
output zero,PCSrc;
output [31:0]add_result,ALU_result_i,ALU_result_r,EX_rdata2_i;
reg PCSrc,zero;
reg [31:0]ALU1_i,ALU2_i,ALU1_r,ALU2_r,ALU_result_i,ALU_result_r,add_result,EX_rdata2_i;
reg [3:0]ALU_control_i,ALU_control_r;
wire [31:0]ALU_result_i_temp,ALU_result_r_temp;

ALU ALU_i(.clk(clk),.btnc_i(btnc_i),.ALU1(ALU1_i),.ALU2(ALU2_i),.ALU_control(ALU_control_i),.ALU_result(ALU_result_i_temp));
ALU ALU_r(.clk(clk),.btnc_i(btnc_i),.ALU1(ALU1_r),.ALU2(ALU2_r),.ALU_control(ALU_control_r),.ALU_result(ALU_result_r_temp));


always@(*)begin
/////I
	if(ID_EX_type_i)begin
		case(forwardA_i)
			3'b001:ALU1_i=MEM_WB_ALU_result_r;
			3'b010:ALU1_i=EX_MEM_ALU_result_r;
			3'b011:ALU1_i=MEM_WB_read_data_i;
			3'b111:ALU1_i=MEM_WB_ALU_result_r;
			3'b000:ALU1_i=ID_EX_rdata1_i;
			default:ALU1_i=ID_EX_rdata1_i;
		endcase
		if(ID_EX_ALUSrc)begin
			ALU2_i=ID_EX_signextend;
			case(forwardB_i)
			3'b001:EX_rdata2_i=MEM_WB_ALU_result_r;
			3'b010:EX_rdata2_i=EX_MEM_ALU_result_r;
			3'b011:EX_rdata2_i=MEM_WB_read_data_i;
			3'b111:EX_rdata2_i=MEM_WB_ALU_result_r;
			3'b000:EX_rdata2_i=ID_EX_rdata2_i;
			default:EX_rdata2_i=ID_EX_rdata2_i;
			endcase
		end
		else begin
			case(forwardB_i)
			3'b001:EX_rdata2_i=MEM_WB_ALU_result_r;
			3'b010:EX_rdata2_i=EX_MEM_ALU_result_r;
			3'b011:EX_rdata2_i=MEM_WB_read_data_i;
			3'b111:EX_rdata2_i=MEM_WB_ALU_result_r;
			3'b000:EX_rdata2_i=ID_EX_rdata2_i;
			default:EX_rdata2_i=ID_EX_rdata2_i;
			endcase
			ALU2_i=EX_rdata2_i;
		end

		if(ID_EX_ALUOp1_i==0&&ID_EX_ALUOp0_i==0)ALU_control_i=4'b0010;
		else if(ID_EX_ALUOp1_i==0&&ID_EX_ALUOp0_i==1)ALU_control_i=4'b0110;
		else if(ID_EX_ALUOp1_i==1&&ID_EX_ALUOp0_i==0&&ID_EX_instruction_i[5:0]==6'b100000)ALU_control_i=4'b0010;
		else if(ID_EX_ALUOp1_i==1&&ID_EX_ALUOp0_i==0&&ID_EX_instruction_i[5:0]==6'b100010)ALU_control_i=4'b0110;
		else if(ID_EX_ALUOp1_i==1&&ID_EX_ALUOp0_i==0&&ID_EX_instruction_i[5:0]==6'b100100)ALU_control_i=4'b0000;
		else if(ID_EX_ALUOp1_i==1&&ID_EX_ALUOp0_i==0&&ID_EX_instruction_i[5:0]==6'b100101)ALU_control_i=4'b0001;
		else if(ID_EX_ALUOp1_i==1&&ID_EX_ALUOp0_i==0&&ID_EX_instruction_i[5:0]==6'b101010)ALU_control_i=4'b0111;
		else ALU_control_i=ALU_control_i;
		add_result=ID_EX_program_counter+(ID_EX_signextend<<2);
		ALU_result_i=ALU_result_i_temp;
	
		if((ID_EX_Branch_i==1'b1)&&(ALU_result_i==0)) zero=1;
		else if((ALU_result_i!=0)&&(ID_EX_bne_i==1'b1)) zero=1;
		else zero=0;
		PCSrc=(ID_EX_Branch_i||ID_EX_bne_i)&zero;
	end
	else begin
		ALU1_i=0;
		ALU2_i=0;
		ALU_control_i=0;
		ALU_result_i=0;
		zero=0;
		PCSrc=0;
		EX_rdata2_i=0;
	end
//////

/////R
	if(ID_EX_type_r)begin
		case(forwardA_r)
			3'b001:ALU1_r=MEM_WB_ALU_result_r;
			3'b010:ALU1_r=EX_MEM_ALU_result_r;
			3'b011:ALU1_r=MEM_WB_read_data_i;
			3'b111:ALU1_r=MEM_WB_ALU_result_r;
			3'b000:ALU1_r=ID_EX_rdata1_r;
			default:ALU1_r=ID_EX_rdata1_r;
		endcase
		case(forwardB_r)
			3'b001:ALU2_r=MEM_WB_ALU_result_r;
			3'b010:ALU2_r=EX_MEM_ALU_result_r;
			3'b011:ALU2_r=MEM_WB_read_data_i;
			3'b111:ALU2_r=MEM_WB_ALU_result_r;
			3'b000:ALU2_r=ID_EX_rdata2_r;
			default:ALU2_r=ID_EX_rdata2_r;
		endcase

		if(ID_EX_ALUOp1_r==0&&ID_EX_ALUOp0_r==0)ALU_control_r=4'b0010;
		else if(ID_EX_ALUOp1_r==0&&ID_EX_ALUOp0_r==1)ALU_control_r=4'b0110;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b100000)ALU_control_r=4'b0010;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b100010)ALU_control_r=4'b0110;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b100100)ALU_control_r=4'b0000;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b100101)ALU_control_r=4'b0001;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b101010)ALU_control_r=4'b0111;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b000000)ALU_control_r=4'b1000;
		else if(ID_EX_ALUOp1_r==1&&ID_EX_ALUOp0_r==0&&ID_EX_instruction_r[5:0]==6'b000010)ALU_control_r=4'b1001;
		else ALU_control_r=ALU_control_r;
		ALU_result_r=ALU_result_r_temp;
	end
	else begin
		ALU1_r=0;
		ALU2_r=0;
		ALU_control_r=0;
		ALU_result_r=0;
	end
/////
end
endmodule
