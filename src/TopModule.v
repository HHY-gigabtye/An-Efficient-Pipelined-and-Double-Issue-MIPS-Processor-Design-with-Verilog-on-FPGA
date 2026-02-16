module TopModule(clk,btnc_i,in,out);
input clk,btnc_i;
input [31:0]in;
output [31:0]out;
reg [31:0]out;

reg [2:0]forwardA_i,forwardB_i,forwardA_r,forwardB_r;
wire [2:0]forwardA_i_temp,forwardB_i_temp,forwardA_r_temp,forwardB_r_temp;
reg hazard;
wire hazard_temp;
reg [31:0]instruction_i,instruction_j,instruction_r;
wire [31:0]program_counter;
reg type_i,type_j,type_r,finish;
wire [31:0]program_counter_temp,instruction_i_temp,instruction_j_temp,instruction_r_temp;
wire type_i_temp,type_j_temp,type_r_temp,finish_temp;
reg IF_ID_type_i,IF_ID_type_j,IF_ID_type_r;
reg [31:0]IF_ID_program_counter,IF_ID_instruction_i,IF_ID_instruction_j,IF_ID_instruction_r;
wire IF_ID_type_i_temp,IF_ID_type_j_temp,IF_ID_type_r_temp;
wire [31:0]IF_ID_program_counter_temp,IF_ID_instruction_i_temp,IF_ID_instruction_j_temp,IF_ID_instruction_r_temp;
reg jump,ALUSrc,MemtoReg_i,RegWrite_i,MemRead_i,MemWrite_i,Branch_i,ALUOp1_i,ALUOp0_i,bne_i,RegWrite_r,ALUOp1_r,ALUOp0_r;
reg [31:0]jump_dir,signextend,rdata1_i,rdata2_i,write_register_i,rdata1_r,rdata2_r,write_register_r;
wire jump_temp,ALUSrc_temp,MemtoReg_i_temp,RegWrite_i_temp,MemRead_i_temp,MemWrite_i_temp,Branch_i_temp,ALUOp1_i_temp,ALUOp0_i_temp,bne_i_temp,RegWrite_r_temp,ALUOp1_r_temp,ALUOp0_r_temp;
wire [31:0]jump_dir_temp,signextend_temp,rdata1_i_temp,rdata2_i_temp,write_register_i_temp,rdata1_r_temp,rdata2_r_temp,write_register_r_temp;
reg ID_EX_ALUSrc,ID_EX_MemtoReg_i,ID_EX_RegWrite_i,ID_EX_MemRead_i,ID_EX_MemWrite_i,ID_EX_Branch_i,ID_EX_ALUOp1_i,ID_EX_ALUOp0_i,ID_EX_bne_i,ID_EX_RegWrite_r,ID_EX_ALUOp1_r,ID_EX_ALUOp0_r,ID_EX_type_i,ID_EX_type_r;
reg [31:0]ID_EX_program_counter,ID_EX_signextend,ID_EX_rdata1_i,ID_EX_rdata2_i,ID_EX_write_register_i,ID_EX_rdata1_r,ID_EX_rdata2_r,ID_EX_write_register_r,ID_EX_instruction_i,ID_EX_instruction_r;
wire ID_EX_ALUSrc_temp,ID_EX_MemtoReg_i_temp,ID_EX_RegWrite_i_temp,ID_EX_MemRead_i_temp,ID_EX_MemWrite_i_temp,ID_EX_Branch_i_temp,ID_EX_ALUOp1_i_temp,ID_EX_ALUOp0_i_temp,ID_EX_bne_i_temp,ID_EX_RegWrite_r_temp,ID_EX_ALUOp1_r_temp,ID_EX_ALUOp0_r_temp,ID_EX_type_i_temp,ID_EX_type_r_temp;
wire [31:0]ID_EX_program_counter_temp,ID_EX_signextend_temp,ID_EX_rdata1_i_temp,ID_EX_rdata2_i_temp,ID_EX_write_register_i_temp,ID_EX_rdata1_r_temp,ID_EX_rdata2_r_temp,ID_EX_write_register_r_temp,ID_EX_instruction_i_temp,ID_EX_instruction_r_temp;
reg zero,PCSrc;
reg [31:0]add_result,ALU_result_i,ALU_result_r,EX_rdata2_i;
wire zero_temp,PCSrc_temp;
wire [31:0]add_result_temp,ALU_result_i_temp,ALU_result_r_temp,EX_rdata2_i_temp;
reg EX_MEM_MemtoReg_i,EX_MEM_RegWrite_i,EX_MEM_MemRead_i,EX_MEM_MemWrite_i,EX_MEM_type_i,EX_MEM_RegWrite_r,EX_MEM_type_r;
reg [31:0]EX_MEM_ALU_result_i,EX_MEM_ALU_result_r,EX_MEM_rdata2_i,EX_MEM_write_register_i,EX_MEM_instruction_i,EX_MEM_write_register_r,EX_MEM_instruction_r;
wire EX_MEM_MemtoReg_i_temp,EX_MEM_RegWrite_i_temp,EX_MEM_MemRead_i_temp,EX_MEM_MemWrite_i_temp,EX_MEM_type_i_temp,EX_MEM_RegWrite_r_temp,EX_MEM_type_r_temp;
wire [31:0]EX_MEM_ALU_result_i_temp,EX_MEM_ALU_result_r_temp,EX_MEM_rdata2_i_temp,EX_MEM_write_register_i_temp,EX_MEM_instruction_i_temp,EX_MEM_write_register_r_temp,EX_MEM_instruction_r_temp;
reg [31:0]read_data_i;
wire [31:0]read_data_i_temp,out_temp;
reg MEM_WB_RegWrite_i,MEM_WB_RegWrite_r,MEM_WB_type_r,MEM_WB_type_i,MEM_WB_MemtoReg_i;
reg [31:0]MEM_WB_ALU_result_r,MEM_WB_write_register_i,MEM_WB_instruction_i,MEM_WB_write_register_r,MEM_WB_instruction_r,MEM_WB_read_data_i;
wire MEM_WB_RegWrite_i_temp,MEM_WB_RegWrite_r_temp,MEM_WB_type_r_temp,MEM_WB_type_i_temp,MEM_WB_MemtoReg_i_temp;
wire [31:0]MEM_WB_ALU_result_r_temp,MEM_WB_write_register_i_temp,MEM_WB_instruction_i_temp,MEM_WB_write_register_r_temp,MEM_WB_instruction_r_temp,MEM_WB_read_data_i_temp;
reg [31:0]write_data_i,write_data_r;
wire [31:0]write_data_i_temp,write_data_r_temp;
wire reset;

wire [31:0]reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10;
wire [31:0]data1,data2,data3,data4,data5,data6,data7,data8;

/*ila_0 ila (
	.clk(clk), // input wire clk


	.probe0(data1), // input wire [31:0]  probe0  
	.probe1(data2), // input wire [31:0]  probe1 
	.probe2(data3), // input wire [31:0]  probe2 
	.probe3(data4), // input wire [31:0]  probe3 
	.probe4(probe4), // input wire [31:0]  probe4 
	.probe5(data5), // input wire [31:0]  probe5 
	.probe6(data6), // input wire [31:0]  probe6 
	.probe7(data7), // input wire [31:0]  probe7 
	.probe8(data8), // input wire [31:0]  probe8 
	.probe9(btnc_i), // input wire [0:0]  probe9 
	.probe10(instruction_r_temp), // input wire [31:0]  probe10 
	.probe11(0), // input wire [0:0]  probe11 
	.probe12(program_counter), // input wire [31:0]  probe12 
	.probe13(instruction_i_temp), // input wire [31:0]  probe13 
	.probe14(0) // input wire [0:0]  probe14
);*/

debounce debounce(.clk(clk),.din(btnc_i),.dout(reset));


assign program_counter=program_counter_temp;

always@(*)begin
if(finish_temp)begin
	out=out_temp;
end
else begin
//////forwarding
forwardA_i=forwardA_i_temp;
forwardB_i=forwardB_i_temp;
forwardA_r=forwardA_r_temp;
forwardB_r=forwardB_r_temp;
//////
//////hazard
hazard=hazard_temp;
//////
//////IF
instruction_i=instruction_i_temp;
instruction_j=instruction_j_temp;
instruction_r=instruction_r_temp;
type_i=type_i_temp;
type_j=type_j_temp;
type_r=type_r_temp;
finish=finish_temp;
//////
//////IF2ID
IF_ID_type_i=IF_ID_type_i_temp;
IF_ID_type_j=IF_ID_type_j_temp;
IF_ID_type_r=IF_ID_type_r_temp;
IF_ID_program_counter=IF_ID_program_counter_temp;
IF_ID_instruction_i=IF_ID_instruction_i_temp;
IF_ID_instruction_j=IF_ID_instruction_j_temp;
IF_ID_instruction_r=IF_ID_instruction_r_temp;
//////
//////ID
jump=jump_temp;
ALUSrc=ALUSrc_temp;
MemtoReg_i=MemtoReg_i_temp;
RegWrite_i=RegWrite_i_temp;
MemRead_i=MemRead_i_temp;
MemWrite_i=MemWrite_i_temp;
Branch_i=Branch_i_temp;
ALUOp1_i=ALUOp1_i_temp;
ALUOp0_i=ALUOp0_i_temp;
bne_i=bne_i_temp;
RegWrite_r=RegWrite_r_temp;
ALUOp1_r=ALUOp1_r_temp;
ALUOp0_r=ALUOp0_r_temp;
jump_dir=jump_dir_temp;
signextend=signextend_temp;
rdata1_i=rdata1_i_temp;
rdata2_i=rdata2_i_temp;
write_register_i=write_register_i_temp;
rdata1_r=rdata1_r_temp;
rdata2_r=rdata2_r_temp;
write_register_r=write_register_r_temp;
//////
//////ID2EX
ID_EX_ALUSrc=ID_EX_ALUSrc_temp;
ID_EX_MemtoReg_i=ID_EX_MemtoReg_i_temp;
ID_EX_RegWrite_i=ID_EX_RegWrite_i_temp;
ID_EX_MemRead_i=ID_EX_MemRead_i_temp;
ID_EX_MemWrite_i=ID_EX_MemWrite_i_temp;
ID_EX_Branch_i=ID_EX_Branch_i_temp;
ID_EX_ALUOp1_i=ID_EX_ALUOp1_i_temp;
ID_EX_ALUOp0_i=ID_EX_ALUOp0_i_temp;
ID_EX_bne_i=ID_EX_bne_i_temp;
ID_EX_RegWrite_r=ID_EX_RegWrite_r_temp;
ID_EX_ALUOp1_r=ID_EX_ALUOp1_r_temp;
ID_EX_ALUOp0_r=ID_EX_ALUOp0_r_temp;
ID_EX_type_i=ID_EX_type_i_temp;
ID_EX_type_r=ID_EX_type_r_temp;
ID_EX_program_counter=ID_EX_program_counter_temp;
ID_EX_signextend=ID_EX_signextend_temp;
ID_EX_rdata1_i=ID_EX_rdata1_i_temp;
ID_EX_rdata2_i=ID_EX_rdata2_i_temp;
ID_EX_write_register_i=ID_EX_write_register_i_temp;
ID_EX_rdata1_r=ID_EX_rdata1_r_temp;
ID_EX_rdata2_r=ID_EX_rdata2_r_temp;
ID_EX_write_register_r=ID_EX_write_register_r_temp;
ID_EX_instruction_i=ID_EX_instruction_i_temp;
ID_EX_instruction_r=ID_EX_instruction_r_temp;
//////
//////EX
zero=zero_temp;
PCSrc=PCSrc_temp;
add_result=add_result_temp;
ALU_result_i=ALU_result_i_temp;
ALU_result_r=ALU_result_r_temp;
EX_rdata2_i=EX_rdata2_i_temp;
//////
//////EX2MEM
EX_MEM_MemtoReg_i=EX_MEM_MemtoReg_i_temp;
EX_MEM_RegWrite_i=EX_MEM_RegWrite_i_temp;
EX_MEM_MemRead_i=EX_MEM_MemRead_i_temp;
EX_MEM_MemWrite_i=EX_MEM_MemWrite_i_temp;
EX_MEM_type_i=EX_MEM_type_i_temp;
EX_MEM_RegWrite_r=EX_MEM_RegWrite_r_temp;
EX_MEM_type_r=EX_MEM_type_r_temp;
EX_MEM_ALU_result_i=EX_MEM_ALU_result_i_temp;
EX_MEM_ALU_result_r=EX_MEM_ALU_result_r_temp;
EX_MEM_rdata2_i=EX_MEM_rdata2_i_temp;
EX_MEM_write_register_i=EX_MEM_write_register_i_temp;
EX_MEM_instruction_i=EX_MEM_instruction_i_temp;
EX_MEM_write_register_r=EX_MEM_write_register_r_temp;
EX_MEM_instruction_r=EX_MEM_instruction_r_temp;
//////
//////MEM
read_data_i=read_data_i_temp;
//////
//////MEM2WB
MEM_WB_RegWrite_i=MEM_WB_RegWrite_i_temp;
MEM_WB_RegWrite_r=MEM_WB_RegWrite_r_temp;
MEM_WB_type_r=MEM_WB_type_r_temp;
MEM_WB_type_i=MEM_WB_type_i_temp;
MEM_WB_MemtoReg_i=MEM_WB_MemtoReg_i_temp;
MEM_WB_ALU_result_r=MEM_WB_ALU_result_r_temp;
MEM_WB_write_register_i=MEM_WB_write_register_i_temp;
MEM_WB_instruction_i=MEM_WB_instruction_i_temp;
MEM_WB_write_register_r=MEM_WB_write_register_r_temp;
MEM_WB_instruction_r=MEM_WB_instruction_r_temp;
MEM_WB_read_data_i=MEM_WB_read_data_i_temp;
//////
//////WB
write_data_i=write_data_i_temp;
write_data_r=write_data_r_temp;
//////
end
end


HazardDetectionUnit HDU(.clk(clk),.IF_ID_instruction_i(IF_ID_instruction_i),.IF_ID_instruction_r(IF_ID_instruction_r),.ID_EX_instruction_i(ID_EX_instruction_i),.ID_EX_MemRead_i(ID_EX_MemRead_i),.btnc_i(reset),.hazard(hazard_temp));

IF_stage IF(.hazard(hazard),.btnc_i(reset),.clk(clk),.PCSrc(PCSrc),.jump(jump),.add_result(add_result),.jump_dir(jump_dir),.program_counter(program_counter_temp),.instruction_i(instruction_i_temp),.instruction_j(instruction_j_temp),.instruction_r(instruction_r_temp),.type_i(type_i_temp),.type_j(type_j_temp),.type_r(type_r_temp),.finish(finish_temp));
					
IF2ID IFID(.clk(clk),.btnc_i(reset),.hazard(hazard),.PCSrc(PCSrc),.jump(jump),.type_i(type_i),.type_j(type_j),.type_r(type_r),.program_counter(program_counter),.instruction_i(instruction_i),.instruction_j(instruction_j),.instruction_r(instruction_r)
					,.IF_ID_type_i(IF_ID_type_i_temp),.IF_ID_type_j(IF_ID_type_j_temp),.IF_ID_type_r(IF_ID_type_r_temp),.IF_ID_program_counter(IF_ID_program_counter_temp),.IF_ID_instruction_i(IF_ID_instruction_i_temp)
					,.IF_ID_instruction_j(IF_ID_instruction_j_temp),.IF_ID_instruction_r(IF_ID_instruction_r_temp));

ID_stage ID(.clk(clk),.btnc_i(reset),.IF_ID_type_i(IF_ID_type_i),.IF_ID_type_j(IF_ID_type_j),.IF_ID_type_r(IF_ID_type_r),.IF_ID_instruction_i(IF_ID_instruction_i)
			,.IF_ID_instruction_j(IF_ID_instruction_j),.IF_ID_instruction_r(IF_ID_instruction_r)
			,.write_data_i(write_data_i),.write_data_r(write_data_r),.MEM_WB_write_register_i(MEM_WB_write_register_i),.MEM_WB_write_register_r(MEM_WB_write_register_r)
			,.MEM_WB_RegWrite_i(MEM_WB_RegWrite_i),.MEM_WB_RegWrite_r(MEM_WB_RegWrite_r)
			,.jump(jump_temp),.jump_dir(jump_dir_temp),.ALUSrc(ALUSrc_temp),.MemtoReg_i(MemtoReg_i_temp),.RegWrite_i(RegWrite_i_temp),.MemRead_i(MemRead_i_temp),.MemWrite_i(MemWrite_i_temp)
			,.Branch_i(Branch_i_temp),.ALUOp1_i(ALUOp1_i_temp),.ALUOp0_i(ALUOp0_i_temp),.bne_i(bne_i_temp),.RegWrite_r(RegWrite_r_temp),.ALUOp1_r(ALUOp1_r_temp),.ALUOp0_r(ALUOp0_r_temp),.signextend(signextend_temp)
			,.rdata1_i(rdata1_i_temp),.rdata2_i(rdata2_i_temp),.write_register_i(write_register_i_temp),.rdata1_r(rdata1_r_temp),.rdata2_r(rdata2_r_temp),.write_register_r(write_register_r_temp)
			,.reg1(reg1),.reg2(reg2),.reg3(reg3),.reg4(reg4),.reg5(reg5),.reg6(reg6),.reg7(reg7),.reg8(reg8),.reg9(reg9),.reg10(reg10));

ID2EX IDEX(.clk(clk),.btnc_i(reset),.ALUSrc(ALUSrc),.MemtoReg_i(MemtoReg_i),.RegWrite_i(RegWrite_i),.MemRead_i(MemRead_i),.MemWrite_i(MemWrite_i),.Branch_i(Branch_i),.ALUOp1_i(ALUOp1_i),.ALUOp0_i(ALUOp0_i),.bne_i(bne_i),.RegWrite_r(RegWrite_r),.ALUOp1_r(ALUOp1_r),.ALUOp0_r(ALUOp0_r)
			,.PCSrc(PCSrc),.hazard(hazard),.IF_ID_type_i(IF_ID_type_i),.IF_ID_type_r(IF_ID_type_r),.IF_ID_program_counter(IF_ID_program_counter),.signextend(signextend),.rdata1_i(rdata1_i),.rdata2_i(rdata2_i),.write_register_i(write_register_i),.rdata1_r(rdata1_r),.rdata2_r(rdata2_r)
			,.write_register_r(write_register_r),.IF_ID_instruction_i(IF_ID_instruction_i),.IF_ID_instruction_r(IF_ID_instruction_r)
			,.ID_EX_ALUSrc(ID_EX_ALUSrc_temp),.ID_EX_MemtoReg_i(ID_EX_MemtoReg_i_temp),.ID_EX_RegWrite_i(ID_EX_RegWrite_i_temp),.ID_EX_MemRead_i(ID_EX_MemRead_i_temp),.ID_EX_MemWrite_i(ID_EX_MemWrite_i_temp),.ID_EX_Branch_i(ID_EX_Branch_i_temp),.ID_EX_ALUOp1_i(ID_EX_ALUOp1_i_temp),.ID_EX_ALUOp0_i(ID_EX_ALUOp0_i_temp),.ID_EX_type_i(ID_EX_type_i_temp),.ID_EX_type_r(ID_EX_type_r_temp)
			,.ID_EX_bne_i(ID_EX_bne_i_temp),.ID_EX_RegWrite_r(ID_EX_RegWrite_r_temp),.ID_EX_ALUOp1_r(ID_EX_ALUOp1_r_temp),.ID_EX_ALUOp0_r(ID_EX_ALUOp0_r_temp),.ID_EX_program_counter(ID_EX_program_counter_temp),.ID_EX_signextend(ID_EX_signextend_temp),.ID_EX_rdata1_i(ID_EX_rdata1_i_temp),.ID_EX_rdata2_i(ID_EX_rdata2_i_temp)
			,.ID_EX_write_register_i(ID_EX_write_register_i_temp),.ID_EX_rdata1_r(ID_EX_rdata1_r_temp),.ID_EX_rdata2_r(ID_EX_rdata2_r_temp),.ID_EX_write_register_r(ID_EX_write_register_r_temp),.ID_EX_instruction_i(ID_EX_instruction_i_temp),.ID_EX_instruction_r(ID_EX_instruction_r_temp));			
					
EX_stage EX(.clk(clk),.btnc_i(reset),.ID_EX_ALUSrc(ID_EX_ALUSrc),.ID_EX_Branch_i(ID_EX_Branch_i),.ID_EX_ALUOp1_i(ID_EX_ALUOp1_i),.ID_EX_ALUOp0_i(ID_EX_ALUOp0_i),.ID_EX_bne_i(ID_EX_bne_i),.ID_EX_ALUOp1_r(ID_EX_ALUOp1_r),.ID_EX_ALUOp0_r(ID_EX_ALUOp0_r)
				,.ID_EX_type_i(ID_EX_type_i),.ID_EX_type_r(ID_EX_type_r),.forwardA_i(forwardA_i),.forwardA_r(forwardA_r),.forwardB_i(forwardB_i),.forwardB_r(forwardB_r)
				,.ID_EX_program_counter(ID_EX_program_counter),.ID_EX_signextend(ID_EX_signextend),.ID_EX_rdata1_i(ID_EX_rdata1_i),.ID_EX_rdata2_i(ID_EX_rdata2_i),.ID_EX_rdata1_r(ID_EX_rdata1_r),.ID_EX_rdata2_r(ID_EX_rdata2_r)
				,.ID_EX_instruction_i(ID_EX_instruction_i),.ID_EX_instruction_r(ID_EX_instruction_r),.MEM_WB_ALU_result_r(MEM_WB_ALU_result_r),.EX_MEM_ALU_result_r(EX_MEM_ALU_result_r),.MEM_WB_read_data_i(MEM_WB_read_data_i)
				,.zero(zero_temp),.PCSrc(PCSrc_temp),.add_result(add_result_temp),.ALU_result_i(ALU_result_i_temp),.ALU_result_r(ALU_result_r_temp),.EX_rdata2_i(EX_rdata2_i_temp));
				
EX2MEM EXMEM(.clk(clk),.btnc_i(reset),.ALU_result_i(ALU_result_i),.ALU_result_r(ALU_result_r),.EX_rdata2_i(EX_rdata2_i),.ID_EX_MemtoReg_i(ID_EX_MemtoReg_i),.ID_EX_RegWrite_i(ID_EX_RegWrite_i)
			,.ID_EX_MemRead_i(ID_EX_MemRead_i),.ID_EX_MemWrite_i(ID_EX_MemWrite_i),.ID_EX_write_register_i(ID_EX_write_register_i),.ID_EX_instruction_i(ID_EX_instruction_i),.ID_EX_type_i(ID_EX_type_i)
			,.ID_EX_RegWrite_r(ID_EX_RegWrite_r),.ID_EX_write_register_r(ID_EX_write_register_r),.ID_EX_instruction_r(ID_EX_instruction_r),.ID_EX_type_r(ID_EX_type_r)
			,.EX_MEM_ALU_result_i(EX_MEM_ALU_result_i_temp),.EX_MEM_ALU_result_r(EX_MEM_ALU_result_r_temp),.EX_MEM_rdata2_i(EX_MEM_rdata2_i_temp),.EX_MEM_MemtoReg_i(EX_MEM_MemtoReg_i_temp),.EX_MEM_RegWrite_i(EX_MEM_RegWrite_i_temp)
			,.EX_MEM_MemRead_i(EX_MEM_MemRead_i_temp),.EX_MEM_MemWrite_i(EX_MEM_MemWrite_i_temp),.EX_MEM_write_register_i(EX_MEM_write_register_i_temp),.EX_MEM_instruction_i(EX_MEM_instruction_i_temp),.EX_MEM_type_i(EX_MEM_type_i_temp)
			,.EX_MEM_RegWrite_r(EX_MEM_RegWrite_r_temp),.EX_MEM_write_register_r(EX_MEM_write_register_r_temp),.EX_MEM_instruction_r(EX_MEM_instruction_r_temp),.EX_MEM_type_r(EX_MEM_type_r_temp));

MEM_stage MEM(.clk(clk),.in(in),.btnc_i(reset),.EX_MEM_MemWrite_i(EX_MEM_MemWrite_i),.EX_MEM_MemRead_i(EX_MEM_MemRead_i),.EX_MEM_type_i(EX_MEM_type_i),.EX_MEM_ALU_result_i(EX_MEM_ALU_result_i),.EX_MEM_rdata2_i(EX_MEM_rdata2_i),.read_data_i(read_data_i_temp),.out(out_temp)
			,.data1(data1),.data2(data2),.data3(data3),.data4(data4),.data5(data5),.data6(data6),.data7(data7),.data8(data8));

MEM2WB MEMWB(.clk(clk),.btnc_i(reset),.EX_MEM_ALU_result_r(EX_MEM_ALU_result_r),.EX_MEM_RegWrite_i(EX_MEM_RegWrite_i),.EX_MEM_write_register_i(EX_MEM_write_register_i),.EX_MEM_instruction_i(EX_MEM_instruction_i),.EX_MEM_RegWrite_r(EX_MEM_RegWrite_r)
			,.EX_MEM_write_register_r(EX_MEM_write_register_r),.EX_MEM_instruction_r(EX_MEM_instruction_r),.EX_MEM_type_r(EX_MEM_type_r),.EX_MEM_type_i(EX_MEM_type_i),.EX_MEM_MemtoReg_i(EX_MEM_MemtoReg_i),.read_data_i(read_data_i)
			,.MEM_WB_RegWrite_i(MEM_WB_RegWrite_i_temp),.MEM_WB_RegWrite_r(MEM_WB_RegWrite_r_temp),.MEM_WB_type_r(MEM_WB_type_r_temp),.MEM_WB_type_i(MEM_WB_type_i_temp),.MEM_WB_MemtoReg_i(MEM_WB_MemtoReg_i_temp),.MEM_WB_ALU_result_r(MEM_WB_ALU_result_r_temp)
			,.MEM_WB_write_register_i(MEM_WB_write_register_i_temp),.MEM_WB_instruction_i(MEM_WB_instruction_i_temp),.MEM_WB_write_register_r(MEM_WB_write_register_r_temp),.MEM_WB_instruction_r(MEM_WB_instruction_r_temp),.MEM_WB_read_data_i(MEM_WB_read_data_i_temp));

WB_stage WB(.clk(clk),.btnc_i(reset),.MEM_WB_type_r(MEM_WB_type_r),.MEM_WB_type_i(MEM_WB_type_i),.MEM_WB_MemtoReg_i(MEM_WB_MemtoReg_i)
			,.MEM_WB_ALU_result_r(MEM_WB_ALU_result_r),.MEM_WB_read_data_i(MEM_WB_read_data_i),.write_data_i(write_data_i_temp),.write_data_r(write_data_r_temp));

forwarding_unit forward_i(.clk(clk),.btnc_i(reset),.EX_MEM_RegWrite_r(EX_MEM_RegWrite_r),.MEM_WB_RegWrite_r(MEM_WB_RegWrite_r),.MEM_WB_RegWrite_i(MEM_WB_RegWrite_i),.EX_MEM_write_register_r(EX_MEM_write_register_r),.instruction(ID_EX_instruction_i)
							,.MEM_WB_instruction_i(MEM_WB_instruction_i),.MEM_WB_instruction_r(MEM_WB_instruction_r),.MEM_WB_write_register_r(MEM_WB_write_register_r),.forwardA(forwardA_i_temp),.forwardB(forwardB_i_temp));
							
forwarding_unit forward_r(.clk(clk),.btnc_i(reset),.EX_MEM_RegWrite_r(EX_MEM_RegWrite_r),.MEM_WB_RegWrite_r(MEM_WB_RegWrite_r),.MEM_WB_RegWrite_i(MEM_WB_RegWrite_i),.EX_MEM_write_register_r(EX_MEM_write_register_r),.instruction(ID_EX_instruction_r)
							,.MEM_WB_instruction_i(MEM_WB_instruction_i),.MEM_WB_instruction_r(MEM_WB_instruction_r),.MEM_WB_write_register_r(MEM_WB_write_register_r),.forwardA(forwardA_r_temp),.forwardB(forwardB_r_temp));
					

endmodule