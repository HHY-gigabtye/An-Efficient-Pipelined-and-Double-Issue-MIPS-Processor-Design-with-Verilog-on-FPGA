module data_memory(clk,in,btnc_i,EX_MEM_MemWrite_i,EX_MEM_MemRead_i,EX_MEM_ALU_result_i,EX_MEM_rdata2_i,read_data_i,out,data1,data2,data3,data4,data5,data6,data7,data8);
input clk,btnc_i,EX_MEM_MemWrite_i,EX_MEM_MemRead_i;
input [31:0]in,EX_MEM_ALU_result_i,EX_MEM_rdata2_i;
output [31:0]read_data_i,out;
reg [31:0]read_data_i,out;
reg no_write;
reg [7:0]datamem[0:31];
output [31:0]data1,data2,data3,data4,data5,data6,data7,data8;

assign data1=datamem[3];
assign data2=datamem[7];
assign data3=datamem[11];
assign data4=datamem[15];
assign data5=datamem[19];
assign data6=datamem[23];
assign data7=datamem[27];
assign data8=datamem[31];

/*ila_0 ila3 (
	.clk(clk), // input wire clk


	.probe0(data1), // input wire [31:0]  probe0  
	.probe1(data2), // input wire [31:0]  probe1 
	.probe2(data3), // input wire [31:0]  probe2 
	.probe3(data4), // input wire [31:0]  probe3 
	.probe4(data5), // input wire [31:0]  probe4 
	.probe5(data6), // input wire [31:0]  probe5 
	.probe6(data7), // input wire [31:0]  probe6 
	.probe7(data8), // input wire [31:0]  probe7 
	.probe8(in), // input wire [31:0]  probe8 
	.probe9(btnc_i), // input wire [0:0]  probe9 
	.probe10(out), // input wire [31:0]  probe10 
	.probe11(0), // input wire [0:0]  probe11 
	.probe12(0), // input wire [31:0]  probe12 
	.probe13(0), // input wire [31:0]  probe13 
	.probe14(0) // input wire [0:0]  probe14
);*/

always@(posedge clk)begin
if (!btnc_i) begin
      // -- 只在最一開始執行一次 --
		datamem[0]<=8'b00000000;
		datamem[1]<=8'b00000000;
		datamem[2]<=8'b00000000;
		datamem[3]<={4'b0000,in[31:28]};
		datamem[4]<=8'b00000000;
		datamem[5]<=8'b00000000;
		datamem[6]<=8'b00000000;
		datamem[7]<={4'b0000,in[27:24]};
		datamem[8]<=8'b00000000;
    	datamem[9]<=8'b00000000;
    	datamem[10]<=8'b00000000;
    	datamem[11]<={4'b0000,in[23:20]};
 	    datamem[12]<=8'b00000000;
    	datamem[13]<=8'b00000000;
    	datamem[14]<=8'b00000000;
    	datamem[15]<={4'b0000,in[19:16]};
    	datamem[16]<=8'b00000000;
    	datamem[17]<=8'b00000000;
    	datamem[18]<=8'b00000000;
    	datamem[19]<={4'b0000,in[15:12]};
    	datamem[20]<=8'b00000000;
    	datamem[21]<=8'b00000000;
    	datamem[22]<=8'b00000000;
    	datamem[23]<={4'b0000,in[11:8]};
    	datamem[24]<=8'b00000000;
    	datamem[25]<=8'b00000000;
    	datamem[26]<=8'b00000000;
    	datamem[27]<={4'b0000,in[7:4]};
	    datamem[28]<=8'b00000000;
	    datamem[29]<=8'b00000000;
	    datamem[30]<=8'b00000000;
	    datamem[31]<={4'b0000,in[3:0]};
	end
	else begin
	   if(EX_MEM_MemWrite_i)begin
		  {datamem[EX_MEM_ALU_result_i],datamem[EX_MEM_ALU_result_i+1],datamem[EX_MEM_ALU_result_i+2],datamem[EX_MEM_ALU_result_i+3]}<=EX_MEM_rdata2_i;
		  no_write<=0;
	   end
	   else no_write<=1;
	end
end

always@(*)begin
	out={datamem[3][3:0],datamem[7][3:0],datamem[11][3:0],datamem[15][3:0],datamem[19][3:0],datamem[23][3:0],datamem[27][3:0],datamem[31][3:0]};
	if(EX_MEM_MemRead_i)read_data_i={datamem[EX_MEM_ALU_result_i],datamem[EX_MEM_ALU_result_i+1],datamem[EX_MEM_ALU_result_i+2],datamem[EX_MEM_ALU_result_i+3]};
	else read_data_i=0;
end
endmodule