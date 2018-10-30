


`include "instructionwrapper.v"
`timescale 1ns/1ps
// Shift Register test bench
module instructionwrapperTest();

	instructionwrapper instructionwrapper(
		.Instructions(Instructions),
		.instructionType(instructionType),
		.Rs             (Rs),
		.Rd             (Rd),
		.Rt             (Rt),
		.imm            (imm),
		.addr           (addr),
		.alu_src        (alu_src),
		.jump           (jump),
		.jumpLink       (jumpLink),
		.branchE        (branchE),
		.branchNE       (branchNE),
		.mem_write      (mem_write),
		.alu_control    (alu_control),
		.reg_write      (reg_write),
		.regDst         (regDst),
		.memToReg       (memToReg)
	);

	task testValuesA;
		input[5:0] exp_opcode, opcode;

		if (opcode == exp_opcode) begin
			$display("Correct OP code");
		end
		else begin
			$display("Incorrect OP code:");
			$display(opcode);
		end

	endtask

	task testValuesB;
		input[4:0] exp_rs, exp_rt, exp_rd, Rs, Rt, Rd;
		input[15:0] exp_imm, imm;

		if ((Rs == exp_rs) && (Rt == exp_rt) && (Rd == exp_rd) && (imm  == exp_imm ))begin
			$display("Correct RS, RT, imm, and RD");
		end
		else begin
			$display("Incorrect RS, RT, imm and RD:");
			$display(Rs);
			$display(Rt);
			$display(imm);
			$display(Rd);
		end
	endtask

	task testValuesC;
		input[25:0] exp_addr, addr;
		input jump,jumpLink,  exp_jump,exp_jumpLink;

		if ((addr  == exp_addr ) && (alu_src  == exp_alu_src ) && (jump  == exp_jump) && (jumpLink  == exp_jumpLink ))begin
			$display("Correct addr, alu_src, jump, jumpLink ");
		end
		else begin
			$display("Incorrect addr, alu_src, jump, jumpLink:");
			$display(addr);
			$display(alu_src);
			$display(jump);
			$display(jumpLink);
		end

	endtask

	task testValuesD;

		input branchE, branchNE,mem_write,alu_control, exp_branchE, exp_branchNE,exp_mem_write,exp_alu_control; 
		if ((branchE  == exp_branchE ) && (branchNE  == exp_branchNE ) && (mem_write  == exp_mem_write ) && (alu_control  == exp_alu_control ))begin
			$display("Correct branchE, branchNE, mem_write, alu_control  ");
		end
		else begin
			$display("IncorrectbranchE, branchNE, mem_write, alu_control");
			$display(branchE );
			$display(branchNE );
			$display(mem_write );
			$display(alu_control );
		end

	endtask

	task testValuesE;

		input reg_write, regDst, memToReg,exp_reg_write, exp_regDst, exp_memToReg; 
		if ((reg_write  == exp_reg_write ) && (regDst  == exp_regDst ) && (memToReg  == exp_memToReg ) ) begin
			$display("Correct reg_write, regDst, memToReg  ");
		end
		else begin
			$display("Incorrect reg_write, regDst, memToReg");
			$display(reg_write );
			$display(regDst );
			$display(memToReg );
		end



	endtask
	

	initial begin
	    instruction = 32'b00000000000000000000000000000000; #10
	    testValuesA(6'b000000, opcode);
	    testValuesB(5'b00000, 5'b00000, 5'b00000, Rs, Rt, Rd,
	    			16'b000000000000000, imm);
	    testValuesC(26'b00000000000000000000000000, addr,
	    			1'b0, jump,
	    			1'b0, jumpLink);
	    testValuesD(
	    			1'b0, branchE,
	    			1'b0, branchNE,
	    			1'b0, mem_write,
	    			1'b0, alu_control);
	    testValuesE(
	    			1'b0, reg_write,
	    			1'b0, regDst,
	    			1'b0, memToReg);

	end

endmodule

