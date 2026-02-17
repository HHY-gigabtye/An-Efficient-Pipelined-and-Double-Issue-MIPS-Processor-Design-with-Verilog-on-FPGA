module IF2ID(clk,btnc_i,hazard,PCSrc,jump,type_i,type_j,type_r,program_counter,instruction_i,instruction_j,instruction_r,IF_ID_type_i,IF_ID_type_j,IF_ID_type_r,IF_ID_program_counter,IF_ID_instruction_i,IF_ID_instruction_j,IF_ID_instruction_r);
input clk,btnc_i,hazard,PCSrc,type_i,type_j,type_r,jump;
input [31:0]program_counter,instruction_i,instruction_j,instruction_r;
output IF_ID_type_i,IF_ID_type_j,IF_ID_type_r;
output [31:0]IF_ID_program_counter,IF_ID_instruction_i,IF_ID_instruction_j,IF_ID_instruction_r;
reg IF_ID_type_i,IF_ID_type_j,IF_ID_type_r;
reg [31:0]IF_ID_program_counter,IF_ID_instruction_i,IF_ID_instruction_j,IF_ID_instruction_r;

always@(posedge clk)begin
if(hazard==1||PCSrc==1||jump==1)begin
	IF_ID_type_i<=0;
	IF_ID_type_j<=0;
	IF_ID_type_r<=0;
	IF_ID_program_counter<=0;
	IF_ID_instruction_i<=0;
	IF_ID_instruction_j<=0;
	IF_ID_instruction_r<=0;
end
else begin
	IF_ID_type_i<=type_i;
	IF_ID_type_j<=type_j;
	IF_ID_type_r<=type_r;
	IF_ID_program_counter<=program_counter;
	IF_ID_instruction_i<=instruction_i;
	IF_ID_instruction_j<=instruction_j;
	IF_ID_instruction_r<=instruction_r;
end
end
endmodule
