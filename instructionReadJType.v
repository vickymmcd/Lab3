
module instructionReadJType (
	input[31:0] Instruction,

	output[15:0] imm,
	output[5:0] Op,
	output[25:0] Rt
);
	assign Op = Instruction[31:26];
	assign Rt = Instruction[25:0];

endmodule