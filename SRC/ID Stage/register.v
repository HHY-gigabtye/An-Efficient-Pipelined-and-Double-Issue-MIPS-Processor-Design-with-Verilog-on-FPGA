module register(clk,btnc_i,r1_ad_i,r2_ad_i,r1_ad_r,r2_ad_r,write_data_i,write_data_r,MEM_WB_write_register_i,MEM_WB_write_register_r,MEM_WB_RegWrite_i,MEM_WB_RegWrite_r,rdata1_i,rdata2_i,rdata1_r,rdata2_r,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10);
input clk,btnc_i,MEM_WB_RegWrite_i,MEM_WB_RegWrite_r;
input [31:0]r1_ad_i,r2_ad_i,r1_ad_r,r2_ad_r,write_data_i,write_data_r,MEM_WB_write_register_i,MEM_WB_write_register_r;
output [31:0]rdata1_i,rdata2_i,rdata1_r,rdata2_r;
reg [31:0]rdata1_i,rdata2_i,rdata1_r,rdata2_r;
reg [31:0]register[31:0];
reg no_write_i,no_write_r;
output [31:0]reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10;

assign reg1=register[1];
assign reg2=register[2];
assign reg3=register[3];
assign reg4=register[4];
assign reg5=register[5];
assign reg6=register[6];
assign reg7=register[7];
assign reg8=register[8];
assign reg9=register[9];
assign reg10=register[10];

/*ila_0 ila2 (
	.clk(clk), // input wire clk


	.probe0(reg1), // input wire [31:0]  probe0  
	.probe1(reg2), // input wire [31:0]  probe1 
	.probe2(reg3), // input wire [31:0]  probe2 
	.probe3(reg4), // input wire [31:0]  probe3 
	.probe4(reg5), // input wire [31:0]  probe4 
	.probe5(reg6), // input wire [31:0]  probe5 
	.probe6(reg7), // input wire [31:0]  probe6 
	.probe7(reg8), // input wire [31:0]  probe7 
	.probe8(reg9), // input wire [31:0]  probe8 
	.probe9(btnc_i), // input wire [0:0]  probe9 
	.probe10(reg10), // input wire [31:0]  probe10 
	.probe11(MEM_WB_RegWrite_i), // input wire [0:0]  probe11 
	.probe12(write_data_i), // input wire [31:0]  probe12 
	.probe13(write_data_r), // input wire [31:0]  probe13 
	.probe14(MEM_WB_RegWrite_r) // input wire [0:0]  probe14
);*/

always@(posedge clk)begin
	if(!btnc_i)begin
       register[0]<=32'b00000000000000000000000000000000;
	   register[1]<=32'b00000000000000000000000000000100;
	   register[2]<=32'b00000000000000000000000000000000;
	   register[3]<=32'b00000000000000000000000000000000;
	   register[4]<=32'b00000000000000000000000000000100;
	   register[5]<=32'b00000000000000000000000000000000;
	   register[6]<=32'b00000000000000000000000000000000;
	   register[7]<=32'b00000000000000000000000000000000;
	   register[8]<=32'b00000000000000000000000000000000;
	   register[9]<=32'b00000000000000000000000000000000;
	   register[10]<=32'b0000000000000000000000000100000;
	   register[11]<=32'b00000000000000000000000000000000;
	   register[12]<=32'b00000000000000000000000000000000;
	   register[13]<=32'b00000000000000000000000000000000;
	   register[14]<=32'b00000000000000000000000000000000;
       register[15]<=32'b00000000000000000000000000000000;
    end
	else begin
	   if(MEM_WB_RegWrite_i)begin
		  register[MEM_WB_write_register_i]<=write_data_i;
		  no_write_i<=0;
	   end
	   else no_write_i<=1;
	   if(MEM_WB_RegWrite_r)begin
		  register[MEM_WB_write_register_r]<=write_data_r;
		  no_write_r<=0;
	   end
	   else no_write_r<=1;
	end
end

always@(*)begin
    rdata1_i=register[r1_ad_i];
    rdata2_i=register[r2_ad_i];
	rdata1_r=register[r1_ad_r];
	rdata2_r=register[r2_ad_r];
	// 2) 先套用 i 埠的寫穿透（優先權較高）
	if (MEM_WB_RegWrite_i && (MEM_WB_write_register_i != 32'd0)) begin
		if (r1_ad_i == MEM_WB_write_register_i) rdata1_i = write_data_i;
		else rdata1_i = rdata1_i;
		if (r2_ad_i == MEM_WB_write_register_i) rdata2_i = write_data_i;
		else rdata2_i = rdata2_i;
		if (r1_ad_r == MEM_WB_write_register_i) rdata1_r = write_data_i;
		else rdata1_r = rdata1_r;
		if (r2_ad_r == MEM_WB_write_register_i) rdata2_r = write_data_i;
		else rdata2_r = rdata2_r;
	end

  // 3) 再套用 r 埠的寫穿透（僅在 i 沒蓋到時）
	if (MEM_WB_RegWrite_r && (MEM_WB_write_register_r != 32'd0)) begin
		if ((r1_ad_i == MEM_WB_write_register_r) && !(MEM_WB_RegWrite_i && (MEM_WB_write_register_i == r1_ad_i))) rdata1_i = write_data_r;
		else rdata1_i = rdata1_i;
		if ((r2_ad_i == MEM_WB_write_register_r) && !(MEM_WB_RegWrite_i && (MEM_WB_write_register_i == r2_ad_i))) rdata2_i = write_data_r;
		else rdata2_i = rdata2_i;
		if ((r1_ad_r == MEM_WB_write_register_r) && !(MEM_WB_RegWrite_i && (MEM_WB_write_register_i == r1_ad_r))) rdata1_r = write_data_r;
		else rdata1_r = rdata1_r;
		if ((r2_ad_r == MEM_WB_write_register_r) && !(MEM_WB_RegWrite_i && (MEM_WB_write_register_i == r2_ad_r))) rdata2_r = write_data_r;
		else rdata2_r = rdata2_r;
	end
end

endmodule
