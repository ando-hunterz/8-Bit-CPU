`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module alu(alu_out, alu_in, accum, op,im_int,temp_reg, pc_in);//  arithmetic logic unit
    // to perform arithmetic and logic operations.
input [3:0] op;
input [7:0] alu_in,accum;
input im_int, pc_in;
output reg [3:0] temp_reg;
output reg [7:0] alu_out;

parameter 	NOP=4'b0000, // no operation
			LDO=4'b0001,	// load ROM to register
			LDA=4'b0010, // load RAM to register
			STO=4'b0011, // Store intermediate results to accumulator
			PRE=4'b0100, // Prefetch Data from Address
			ADD=4'b0101, // Adds the contents of the memory address or integer to the accumulator
			LDM=4'b0110, // Load Multiple
			ADN=4'b0111, // Add integer
			INC=4'b1000, // Increment Acc
			DEC=4'b1001, // Decrement ACC
			JMP=4'b1010, // Jump to ADDR
			CLR=4'b1011,
			HLT=4'b1111; // Halt
			
always @(posedge im_int) begin
		if(op == ADN) temp_reg <= accum+alu_in[3:0];
		else temp_reg <= 8'd0;
end
			
			
always @(*) begin
		casez(op)
		NOP:	alu_out = (pc_in) ? alu_in : accum;
		HLT:	alu_out = accum;
		LDO:	alu_out = alu_in;
		LDA:	alu_out = alu_in;
		STO:	alu_out = accum;
		PRE:	alu_out = alu_in;
		ADD:	alu_out = accum+alu_in;
		LDM:	alu_out = accum;
		ADN:  alu_out = temp_reg;
		CLR:  alu_out = temp_reg;
		INC:  alu_out = accum+1;
		JMP:  alu_out = alu_in;
		DEC:  alu_out = accum-1;
		default:	alu_out = 8'bzzzz_zzzz;
		endcase
end
			 
			
endmodule
