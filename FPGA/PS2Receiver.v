`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date: 03/03/2015 09:33:36 PM
// Design Name: 
// Module Name: PS2Receiver
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: PS2 Receiver module used to shift in keycodes from a keyboard plugged into the PS2 port
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2Receiver(
    input clk,
    input kclk,
    input kdata,
	output [31:0] keycodeout
    );
    
    
    wire kclkf, kdataf;
    reg sort;
    reg [7:0]datacur;
    reg [7:0]dataprev;
	reg [3:0] num_value;
    reg [3:0]cnt;
    reg [31:0]keycode;
    reg flag;
	reg [31:0]num;
    
    initial begin
        keycode[31:0]<=32'b00000000000000000000000000000000;
        cnt<=4'b0000;
        flag<=1'b0;
		dataprev<=8'b000000000;
		num<=32'h00000000;
    end
    
debouncer debounce(
    .clk(clk),
    .I0(kclk),
    .I1(kdata),
    .O0(kclkf),
    .O1(kdataf)
);
    
always@(negedge(kclkf))begin
    case(cnt)
    0:;//Start bit
    1:datacur[0]<=kdataf;
    2:datacur[1]<=kdataf;
    3:datacur[2]<=kdataf;
    4:datacur[3]<=kdataf;
    5:datacur[4]<=kdataf;
    6:datacur[5]<=kdataf;
    7:datacur[6]<=kdataf;
    8:datacur[7]<=kdataf;
    9:flag<=1'b1;
    10:flag<=1'b0;
    
    endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10) cnt<=0;
        
end

always @(posedge flag)begin
    if (dataprev!=datacur)begin
        keycode[3:0]<=num_value;
        dataprev<=datacur;
    end
    if(keycode[3:0]!=0)begin
	   num<={num[27:0],keycode[3:0]};
	   keycode[3:0]<=4'b0000;
    end
end



always@(*)begin
    case(datacur)
		8'h16:num_value=4'b0001;
		8'h1E:num_value=4'b0010;
		8'h26:num_value=4'b0011;
		8'h25:num_value=4'b0100;
		8'h2E:num_value=4'b0101;
		8'h36:num_value=4'b0110;
		8'h3D:num_value=4'b0111;
		8'h3E:num_value=4'b1000;
		8'h46:num_value=4'b1001;
		8'h45:num_value=4'b0000;
		default: num_value=4'b0000;
	endcase
end

assign keycodeout=num;
    
endmodule
