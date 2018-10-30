
`include "instructiondecode.v"

module instructionwrapper
(

    input[31:0] Instructions,
    input instructionType, // 0 for I an d1 for J

	output[4:0] Rs, Rd, Rt,
	output[15:0] imm,
	output[25:0] addr,
    output[2:0] alu_src,
    output jump,jumpLink, branchE, branchNE,mem_write,alu_control,reg_write, regDst, memToReg      
);

	// Determine if it is i or j type
	always @(Instructions)
	begin
	  if (instructionType == 1'b0)
	    // Type I
		instructionReadIType instructionReadIType(
			.instruction(Instructions),
			.imm(imm),
			.Op(Op),
			.Rs(Rs),
			.Rt(Rt)
		);
	  else if (instructionType == 1'b1)
	    // Type J
		instructionReadJType instructionReadJType(
			.instruction(Instructions),
			.imm(imm),
			.Op(Op),
			.Rt(Rt)
		);
	  else
		instructionReadIType instructionReadIType(
			.instruction(Instructions),
			.imm(imm),
			.Op(Op),
			.Rs(Rs),
			.Rt(Rt)
		);
	end


    instructiondecode instructiondecode(
        .Op(Op), .funct(funct), // inputs
        .ALU_src(ALU_src),  // rest are outputs
        .jump(jump), .jumpLink(jumpLink),
        .branchNE(branchNE), .branchE(branchE),
        .mem_write(mem_write), .alu_control(alu_control)
        .reg_write(reg_write), .regDst(regDst), .memToReg(memToReg)
    );





endmodule