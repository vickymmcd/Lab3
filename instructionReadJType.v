module instructionReadJType (
	input[31:0] instruction,

	output[15:0] imm,
	output[5:0] Op,
	output[25:0] Rt
);
	assign Op = instruction[31:26];
	assign Rt = instruction[25:0];

endmodule