
module instructionwrapper
(

    input[31:0] Instructions,
	output[4:0] Rs, Rd, Rt,
	output[15:0] imm,
	output[25:0] addr,
    output reg[2:0] alu_src,
    output reg jump,jumpLink, branchE, branchNE,mem_write,alu_control,reg_write, regDst, memToReg      
);


    Controller ctrlr(
        .Op(Op), .funct(funct), // inputs
        .ALU_src(ALU_src),  // rest are outputs
        .jump(jump), .jumpLink(jumpLink),
        .branchNE(branchNE), .branchE(branchE),
        .mem_write(mem_write), .alu_control(alu_control)
        .reg_write(reg_write), .regDst(regDst), .memToReg(memToReg)
    );



endmodule