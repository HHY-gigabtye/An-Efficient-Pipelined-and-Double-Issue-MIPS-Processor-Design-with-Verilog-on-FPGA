module WB_stage(clk,btnc_i,MEM_WB_type_r,MEM_WB_type_i,MEM_WB_MemtoReg_i,MEM_WB_ALU_result_r,MEM_WB_read_data_i,write_data_i,write_data_r);
input clk,btnc_i,MEM_WB_type_r,MEM_WB_type_i,MEM_WB_MemtoReg_i;
input [31:0]MEM_WB_ALU_result_r,MEM_WB_read_data_i;
output [31:0]write_data_i,write_data_r;
reg [31:0]write_data_i,write_data_r;


always@(*)begin
/////I
if(MEM_WB_type_i)begin
	if(MEM_WB_MemtoReg_i)write_data_i=MEM_WB_read_data_i;
	else write_data_i=write_data_i;
end
else begin
	write_data_i=0;
end
/////
/////R
if(MEM_WB_type_r)begin
	write_data_r=MEM_WB_ALU_result_r;
end
else begin
	write_data_r=0;
end
/////
end
endmodule