
module instructionReadJType (
	input[31:0] Instruction,

	output[5:0] Op,
	output[25:0] addr
);
	assign Op = Instruction[31:26];
	assign addr = Instruction[25:0];

endmodule