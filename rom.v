`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module rom(data, addr, read, ena);
input read, ena;
input [7:0] addr;
output [7:0] data;
 
reg [7:0] memory[255:0];


// note: Decimal number in the bracket
initial begin
	memory[0] = 8'b00000000;	//NOP
	
	// [ins] [target_reg_addr] [from_rom_addr]
	memory[1] = 8'b0001_0001; // LDO R1
	memory[2] = 8'b1000_0001; // ROM[129] -> R1
	memory[3] = 8'b0100_0001; // Prefetch R1
	
	memory[4] = 8'b0111_1011; // Add 11
	memory[5] = 8'b1001_0000; // DEC
	memory[6] = 8'b0110_0010; // LDM R2
	memory[7] = 8'b0011_0010; // STO R2
	memory[8] = 8'b0000_0001; // R2 -> RAM[1]
	memory[9] = 8'b1010_0011; // JMP to Memory [15] ----------
	memory[10] = 8'b0000_1111; // Memory[15]						 |
									   // 	   					  	    |
	memory[11] = 8'b1001_0001; // DEC                         |
	memory[12] = 8'b1000_0001; // INC								 |
	memory[13] = 8'b0000_0000; // NOP						 		 |
	memory[14] = 8'b1111_0000; // HLT								 |
										//										 |
	memory[15] = 8'b1011_0000; // CLR <------------------------
	memory[16] = 8'b0001_0011; // LDO R3
	memory[17] = 8'b1000_0010; // ROM [130] -> R3
	memory[18] = 8'b0100_0001; // PRE R1
	memory[19] = 8'b0101_0011; // ADD R3
	memory[20] = 8'b0110_0100; // Load R4
	memory[21] = 8'b0011_0100; // STO R4
	memory[22] = 8'b0000_0010; // R4 -> RAM[2]
	
	memory[23] = 8'b0010_0101; // LDA R5
	memory[24] = 8'b0000_0010; // RAM[2] -> R5
	memory[25] = 8'b1011_0000; // CLR
	memory[26] = 8'b1000_0001; // INC
	memory[27] = 8'b1000_0001; // INC
	memory[28] = 8'b0101_0101; // ADD R5
	memory[29] = 8'b0110_0110; // LDM R6
	
	memory[30] = 8'b1010_0011; // JMP TO Memory[14]
	memory[31] = 8'b0000_1110; // Memory[14]
	
//	memory[1] = 8'b10000001; //INC
//	memory[2] = 8'b10000001; //INC
//	memory[3] = 8'b10000001; //INC
//	memory[4] = 8'b10010001; //DEC
//	memory[5] = 8'b0111_0011; //ADN 2 
//	memory[6] = 8'b10000001; //INC
//	memory[7] = 8'b1010_0011;	//JMP to memory[15]
//	memory[8] = 8'b0000_1111;   
//	memory[15] = 8'b10000001; // INC
//	memory[16] = 8'b1000_0000; // INC
//	memory[17] = 8'b1011_0000; //CLR
//	
//	memory[18] = 8'b0001_0001;	//LDO s1
//	memory[19] = 8'b0100_0001;	//rom(65)	//rom[65] -> reg[1]
//	memory[20] = 8'b0001_0010;	//LDO s2
//	memory[21] = 8'b0100_0010;	//rom(66)
//	memory[22] = 8'b0001_0011;	//LDO s3
//	memory[23] = 8'b0100_0011;	//rom(67)
//
//	memory[24] = 8'b0100_0001;	//PRE s1
//	memory[25] = 8'b0101_0010;	//ADD s2
//	memory[26] = 8'b0110_0001;	//LDM s1
//	
//	memory[27] = 8'b0011_0001;	//STO s1
//	memory[28] = 8'b000_00001;	//ram(1)
//	memory[29] = 8'b0010_0010;	//LDA s2
//	memory[30] = 8'b000_00001;	//ram(1)
//	
//	memory[31] = 8'b0100_0011;	//PRE s3
//	memory[32] = 8'b0101_0010;	//ADD s2
//	memory[33] = 8'b0110_0011;	//LDM s3
//	
//	memory[34] = 8'b0011_0011;	//STO s3
//	memory[35] = 8'b000_00010;	//ram(2)
//	
//	memory[36] = 8'b0001_0100;	//LDO s4
//	memory[37] = 8'b0100_0010;	//rom(66)
//	memory[38] = 8'b1111_00000;	//HLT
//	
//	memory[65] = 8'b00100101;	//37
//	memory[66] = 8'b01011001;	//89
//	memory[67] = 8'b00110101;	//53
	
	memory[129] = 8'b0110_0100; // 100
	memory[130] = 8'b0011_0010; // 50
end


assign data = (read&&ena)? memory[addr]:8'hzz;	

endmodule
