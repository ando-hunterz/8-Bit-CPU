`timescale 1ns / 1ps
//PC, program counter
module counter(pc_addr, clock, rst, en, pc_in, data);
input clock, rst, en, pc_in;
input [7:0] data;
output reg [7:0] pc_addr;
wire [7:0] pc_ad;

always @(posedge clock or negedge rst) begin
	if(!rst) begin
		pc_addr <= 8'd0;
	end
	else begin
		if (en) 
		begin 
			if(pc_in) pc_addr <= data; // data to PC
			else pc_addr <= pc_addr+1;
		end
		else pc_addr <= pc_addr;
	end
end

endmodule