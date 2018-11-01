module instructionReadRType (
	input[31:0] Instruction,

	output[5:0] Op,
	output[4:0] Rs,
	output[4:0] Rt,
	output[4:0] Rd,
	output[4:0] shift,
	output[5:0] funct
);
	assign Op = Instruction[31:26];
	assign Rs = Instruction[25:21];
	assign Rt = Instruction[20:16];
	assign Rd = Instruction[15:11];
	assign shift = Instruction[10:6];
	assign funct = Instruction[5:0];

endmodule