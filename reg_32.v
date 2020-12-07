`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module reg_32(in, data, write, read, addr, clk);
input write, read, clk;
input [7:0] in;
input [7:0] addr;

output [7:0] data;

reg [7:0] R[15:0]; //16Byte
wire [3:0] r_addr; // 4bit register addr

assign r_addr = addr[3:0];
assign data = (read)? R[r_addr]:8'hzz;	//read enable

always @(posedge clk) begin				//write, clk posedge
	if(write)	R[r_addr] <= in; 
end

endmodule
