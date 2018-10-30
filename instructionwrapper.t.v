


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





	task testValues;
		input[5:0] exp_opcode, opcode;
		input[4:0] exp_rs, exp_rt, exp_rd, Rs, Rt, Rd;
		input[15:0] exp_imm, imm;
		input[25:0] exp_addr, addr;
		input jump,jumpLink, branchE, branchNE,mem_write,alu_control,reg_write, regDst, memToReg, exp_jump,exp_jumpLink, exp_branchE, exp_branchNE,exp_mem_write,exp_alu_control,exp_reg_write, exp_regDst, exp_memToReg; 


		if (opcode == exp_opcode) begin
			$display("Correct OP code");
		end
		else begin
			$display("Incorrect OP code:");
			$display(opcode);
		end

		if ((Rs == exp_rs) && (Rt == exp_rt) && (Rd == exp_rd))begin
			$display("Correct RS, RT, and RD");
		end
		else begin
			$display("Incorrect RS, RT, and RD:");
			$display(Rs);
			$display(Rt);
			$display(Rd);
		end

		if (imm  == exp_imm ) begin
			$display("Correct imm ");
		end
		else begin
			$display("Incorrect imm:");
			$display(imm);
		end

		if (addr  == exp_addr ) begin
			$display("Correct addr ");
		end
		else begin
			$display("Incorrect addr:");
			$display(addr);
		end


		if (addr  == exp_addr ) begin
			$display("Correct addr ");
		end
		else begin
			$display("Incorrect addr:");
			$display(addr);
		end
		




	endtask

	initial begin
	    instruction = 32'b00000000000000000000000000000000; #10
	    checkResult(6'b000000, opcode, 5'b00000, 5'b00000, 5'b00000, Rs, Rt, Rd,
	    			16'b000000000000000, imm,
	    			26'b00000000000000000000000000, jump_target);



endmodule

