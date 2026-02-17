module instruction_memory(clk,btnc_i,program_counter,instruction1,instruction2);
input [31:0]program_counter;
input clk,btnc_i;
output [31:0]instruction1,instruction2;
reg [31:0]instruction1,instruction2;
reg [7:0]instruction_mem[0:127];

always@(posedge clk)begin
if(!btnc_i)begin
	instruction_mem[0]<=8'b00000000;//add $t2,$t1,$t0
	instruction_mem[1]<=8'b00000001;
	instruction_mem[2]<=8'b00010000;
	instruction_mem[3]<=8'b00100000;
	instruction_mem[4]<=8'b00000000;//sub $t3,$t2,$t4
	instruction_mem[5]<=8'b01000100;
	instruction_mem[6]<=8'b00011000;
	instruction_mem[7]<=8'b00100010;
	instruction_mem[8]<=8'b10001100;//lw $t6,0($t2)
	instruction_mem[9]<=8'b01000110;
	instruction_mem[10]<=8'b00000000;
	instruction_mem[11]<=8'b00000000;
	instruction_mem[12]<=8'b10001100;//lw $t7,0($t3)
	instruction_mem[13]<=8'b01100111;
	instruction_mem[14]<=8'b00000000;
	instruction_mem[15]<=8'b00000000;
	instruction_mem[16]<=8'b00000000;//slt $t8,$t7,$t6
	instruction_mem[17]<=8'b11100110;
	instruction_mem[18]<=8'b01000000;
	instruction_mem[19]<=8'b00101010;
	instruction_mem[20]<=8'b00010001;//beq $t8,0,change(28)
	instruction_mem[21]<=8'b00000000;
	instruction_mem[22]<=8'b00000000;
	instruction_mem[23]<=8'b00000010;
	instruction_mem[24]<=8'b00010101;//bne $t8,0,exit1(56)
	instruction_mem[25]<=8'b00000000;
	instruction_mem[26]<=8'b00000000;
	instruction_mem[27]<=8'b00001000;
	instruction_mem[28]<=8'b10001100;//lw $t9,0($t2)
	instruction_mem[29]<=8'b01001001;
	instruction_mem[30]<=8'b00000000;
	instruction_mem[31]<=8'b00000000;
	instruction_mem[32]<=8'b10001100;//lw $t5,0($t3)
	instruction_mem[33]<=8'b01100101;
	instruction_mem[34]<=8'b00000000;
	instruction_mem[35]<=8'b00000000;
	instruction_mem[36]<=8'b10101100;//sw $t9,0($t3)
	instruction_mem[37]<=8'b01101001;
	instruction_mem[38]<=8'b00000000;
	instruction_mem[39]<=8'b00000000;
	instruction_mem[40]<=8'b10101100;//sw $t5,0($t2)
	instruction_mem[41]<=8'b01000101;
	instruction_mem[42]<=8'b00000000;
	instruction_mem[43]<=8'b00000000;
	instruction_mem[44]<=8'b00000000;//addi $t2,$t2,-4
	instruction_mem[45]<=8'b01000100;
	instruction_mem[46]<=8'b00010000;
	instruction_mem[47]<=8'b00100010;
	instruction_mem[48]<=8'b00010000;//beq $t2,0,exit1(56)
	instruction_mem[49]<=8'b01000000;
	instruction_mem[50]<=8'b00000000;
	instruction_mem[51]<=8'b00000010;
	instruction_mem[52]<=8'b00001000;//j sort(4)
	instruction_mem[53]<=8'b00000000;
	instruction_mem[54]<=8'b00000000;
	instruction_mem[55]<=8'b00000100;
	instruction_mem[56]<=8'b00000000;//addi $t1,$t1,4
	instruction_mem[57]<=8'b00100100;
	instruction_mem[58]<=8'b00001000;
	instruction_mem[59]<=8'b00100000;
	instruction_mem[60]<=8'b00010000;//beq $t1,32,exit2(68)
	instruction_mem[61]<=8'b00101010;
	instruction_mem[62]<=8'b00000000;
	instruction_mem[63]<=8'b00000010;
	instruction_mem[64]<=8'b00001000;//j loop(0)
	instruction_mem[65]<=8'b00000000;
	instruction_mem[66]<=8'b00000000;
	instruction_mem[67]<=8'b00000000;
end
else begin
	instruction_mem[0]<=instruction_mem[0];
end
end

always@(*)begin
	instruction1={instruction_mem[program_counter],instruction_mem[program_counter+1],instruction_mem[program_counter+2],instruction_mem[program_counter+3]};
	instruction2={instruction_mem[program_counter+4],instruction_mem[program_counter+5],instruction_mem[program_counter+6],instruction_mem[program_counter+7]};
end
endmodule