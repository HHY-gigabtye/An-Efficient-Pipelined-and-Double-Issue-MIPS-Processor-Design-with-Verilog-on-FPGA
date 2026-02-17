module IF_stage(hazard,btnc_i,clk,PCSrc,jump,jump_dir,add_result,program_counter,instruction_i,instruction_j,instruction_r,type_i,type_j,type_r,finish);
input hazard,PCSrc,btnc_i,clk,jump;
input [31:0]add_result,jump_dir;
output [31:0]program_counter,instruction_i,instruction_j,instruction_r;
output type_i,type_j,type_r,finish;
reg [31:0]instruction1,instruction2,instruction_i,instruction_j,instruction_r,pc_next;
(* max_fanout = 24 *) reg [31:0]program_counter;
(* KEEP_HIERARCHY = "yes" *)
wire [31:0]instruction1_temp,instruction2_temp;
reg	type_r_1,type_j_1,type_i_1,type_r_2,type_j_2,type_i_2;
reg type_i,type_j,type_r,finish;
wire [31:0] pc_plus8 = program_counter + 32'd8;

instruction_memory InMem(.clk(clk),.btnc_i(btnc_i),.program_counter(program_counter),.instruction1(instruction1_temp),.instruction2(instruction2_temp));

always@(posedge clk)begin
	if(!btnc_i) program_counter<=0;
	else if(jump==1&&PCSrc==0) program_counter<=jump_dir;
	else program_counter<=pc_next;
end



always@(*)begin
if(program_counter==32'b00000000000000000000000001001100) finish=1;
else finish=0;
instruction1=instruction1_temp;
instruction2=instruction2_temp;
////////IF
///////PC
if(hazard) begin
	pc_next=program_counter-3'b100;
end
else begin
	if(PCSrc)begin
		pc_next=add_result;
	end
	else pc_next=pc_plus8;
////
	////packet issue unit
	//packaging into slots and checking branch hazard
	case(instruction1[31:26])
		6'b000000:begin
			type_r_1=1;type_j_1=0;type_i_1=0;
		end
		6'b011100:begin
			type_r_1=1;type_j_1=0;type_i_1=0;
		end
		6'b000010:begin
			type_r_1=0;type_j_1=1;type_i_1=0;
		end
		6'b000100:begin
			type_r_1=0;type_j_1=0;type_i_1=1;
		end
		6'b000101:begin
			type_r_1=0;type_j_1=0;type_i_1=1;
		end
		6'b100011:begin
			type_r_1=0;type_j_1=0;type_i_1=1;
		end
		6'b101011:begin
			type_r_1=0;type_j_1=0;type_i_1=1;
		end
		default:begin
			type_r_1=0;type_j_1=0;type_i_1=0;
		end
	endcase
	case(instruction2[31:26])
		6'b000000:begin
			type_r_2=1;type_j_2=0;type_i_2=0;
		end
		6'b011100:begin
			type_r_2=1;type_j_2=0;type_i_2=0;
		end
		6'b000010:begin
			type_r_2=0;type_j_2=1;type_i_2=0;
		end
		6'b000100:begin
			type_r_2=0;type_j_2=0;type_i_2=1;
		end
		6'b000101:begin
			type_r_2=0;type_j_2=0;type_i_2=1;
		end
		6'b100011:begin
			type_r_2=0;type_j_2=0;type_i_2=1;
		end
		6'b101011:begin
			type_r_2=0;type_j_2=0;type_i_2=1;
		end
		default:begin
			type_r_2=0;type_j_2=0;type_i_2=0;
		end
	endcase

	if((type_j_1||(instruction1[31:26]==6'b000100)||(instruction1[31:26]==6'b000101)||(type_r_1&&type_r_2)||(type_i_1&&type_i_2))&&(!PCSrc))begin
		instruction2=0;
		pc_next=pc_next-3'b100;
		type_i_2=0;
		type_r_2=0;
		type_j_2=0;
	end
//

//check on data hazards
	else if((type_r_1&&(instruction1[15:11]==instruction2[25:21]||instruction1[15:11]==instruction2[20:16]))&&(!PCSrc))begin
	instruction2=0;
	pc_next=pc_next-3'b100;
	type_i_2=0;
	end
	else if((type_i_1&&instruction1[31:26]==6'b100011&&(instruction1[20:16]==instruction2[25:21]||instruction1[20:16]==instruction2[20:16]))&&(!PCSrc))begin
	instruction2=0;
	pc_next=pc_next-3'b100;
	type_r_2=0;
	end
	else begin
		instruction2=instruction2;
		pc_next=pc_next;
		type_r_2=type_r_2;
	end
//
	if(type_i_1)begin
		instruction_i=instruction1;
		type_i=1;
	end
	else if(type_i_2)begin
		instruction_i=instruction2;
		type_i=1;
	end
	else begin
		type_i=0;
		instruction_i=0;
	end

	if(type_j_1)begin
		instruction_j=instruction1;
		type_j=1;
	end
	else if(type_j_2)begin
		instruction_j=instruction2;
		type_j=1;
	end
	else begin
		type_j=0;
		instruction_j=0;
	end

	if(type_r_1)begin
		instruction_r=instruction1;
		type_r=1;
	end
	else if(type_r_2)begin
		instruction_r=instruction2;
		type_r=1;
	end
	else begin
		type_r=0;
		instruction_r=0;
	end
end
end
endmodule
