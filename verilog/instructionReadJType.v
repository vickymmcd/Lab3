
module instructionReadJType (
	input[31:0] Instruction,
	input[31:0] Pc,

	output[5:0] Op,
	output[31:0] addr
);
	assign Op = Instruction[31:26];
	assign addr[31:0] = {Pc[31:28], Instruction[25:0],2'b00};
	//shift_out[31:0]={unshifted[29:0],2'b00};

endmodule