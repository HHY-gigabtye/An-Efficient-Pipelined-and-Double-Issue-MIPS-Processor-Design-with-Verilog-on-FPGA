module MEM_stage(clk,in,btnc_i,EX_MEM_MemWrite_i,EX_MEM_MemRead_i,EX_MEM_type_i,EX_MEM_ALU_result_i,EX_MEM_rdata2_i,read_data_i,out,data1,data2,data3,data4,data5,data6,data7,data8);
input clk,btnc_i,EX_MEM_MemWrite_i,EX_MEM_MemRead_i,EX_MEM_type_i;
input [31:0]in,EX_MEM_ALU_result_i,EX_MEM_rdata2_i;
output [31:0]read_data_i,out;
reg [31:0]read_data_i,out;
wire [31:0]read_data_i_temp,out_temp;
output [31:0]data1,data2,data3,data4,data5,data6,data7,data8;
wire [31:0]data1_temp,data2_temp,data3_temp,data4_temp,data5_temp,data6_temp,data7_temp,data8_temp;

assign data1=data1_temp;
assign data2=data2_temp;
assign data3=data3_temp;
assign data4=data4_temp;
assign data5=data5_temp;
assign data6=data6_temp;
assign data7=data7_temp;
assign data8=data8_temp;

data_memory datamem(.clk(clk),.in(in),.btnc_i(btnc_i),.EX_MEM_MemWrite_i(EX_MEM_MemWrite_i),.EX_MEM_MemRead_i(EX_MEM_MemRead_i),.EX_MEM_ALU_result_i(EX_MEM_ALU_result_i),.EX_MEM_rdata2_i(EX_MEM_rdata2_i),.read_data_i(read_data_i_temp),.out(out_temp)
					,.data1(data1_temp),.data2(data2_temp),.data3(data3_temp),.data4(data4_temp),.data5(data5_temp),.data6(data6_temp),.data7(data7_temp),.data8(data8_temp));


always@(*)begin
	if(EX_MEM_type_i)begin
		read_data_i=read_data_i_temp;
	end
	else begin
		read_data_i=0;
	end
	out=out_temp;
end
endmodule