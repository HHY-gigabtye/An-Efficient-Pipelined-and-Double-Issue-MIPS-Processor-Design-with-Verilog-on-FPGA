module HazardDetectionUnit(clk,IF_ID_instruction_i,IF_ID_instruction_r,ID_EX_instruction_i,ID_EX_MemRead_i,btnc_i,hazard);
input [31:0]IF_ID_instruction_i,IF_ID_instruction_r,ID_EX_instruction_i;
input clk,ID_EX_MemRead_i,btnc_i;
output hazard;
reg hazard;

always@(*)begin
/////// hazard detection
	if(ID_EX_MemRead_i&&(((ID_EX_instruction_i[20:16]==IF_ID_instruction_i[25:21])||(ID_EX_instruction_i[20:16]==IF_ID_instruction_i[20:16]))||
					((ID_EX_instruction_i[20:16]==IF_ID_instruction_r[25:21])||(ID_EX_instruction_i[20:16]==IF_ID_instruction_r[20:16]))))begin
		hazard=1'b1;
	end
	else hazard=1'b0;
////////
end

endmodule