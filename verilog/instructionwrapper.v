
`include "instructiondecode.v"
`include "instructionReadJType.v"
`include "instructionReadIType.v"
`include "instructionReadRType.v"

module instructionwrapper
(

    input[31:0] Instructions,
    input[31:0] Pc,

	output[4:0] Rs, Rd, Rt, shift,
	output[15:0] imm,
	output[5:0] Op, funct,
	output[31:0] addr,
    output[2:0] alu_src,
    output[1:0] regDst,
    output jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, memToReg      
);

	wire ALU_src;


	instructionReadIType instructionReadIType(
		.Instruction(Instructions),
		.imm(imm),
		.Op(Op),
		.Rs(Rs),
		.Rt(Rt)
	);

	instructionReadJType instructionReadJType(
		.Instruction(Instructions),
		.Pc(Pc + 32'd4),
		.addr(addr),
		.Op(Op)
	);

	instructionReadRType instructionReadRType(
		.Instruction(Instructions),
		.Op(Op),
		.Rs(Rs),
		.Rt(Rt),
		.Rd(Rd),
		.shift(shift),
		.funct(funct)
	);

    instructiondecode instructiondecode(
        .Op(Op), .funct(funct), // inputs
        .alu_src(alu_src),  // rest are outputs
        .jump(jump), .jumpLink(jumpLink), .jumpReg(jumpReg),
        .bne(bne), .branchatall(branchatall),
        .mem_write(mem_write), .alu_control(alu_control),
        .reg_write(reg_write), .regDst(regDst), .memToReg(memToReg)
    );






endmodule