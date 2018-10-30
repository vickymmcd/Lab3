


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

//
		if (alu_src  == exp_alu_src ) begin
			$display("Correct alu_src ");
		end
		else begin
			$display("Incorrect alu_src:");
			$display(alu_src);
		end
		

		if (jump  == exp_jump) begin
			$display("Correct jump ");
		end
		else begin
			$display("Incorrect jump:");
			$display(jump);
		end
		

		if (jumpLink  == exp_jumpLink ) begin
			$display("Correct jumpLink  ");
		end
		else begin
			$display("IncorrectjumpLink:");
			$display(jumpLink );
		end
		
		if (branchE  == exp_branchE ) begin
			$display("Correct branchE  ");
		end
		else begin
			$display("IncorrectbranchE:");
			$display(branchE );
		end

		if (branchNE  == exp_branchNE ) begin
			$display("Correct branchNE  ");
		end
		else begin
			$display("Incorrectbranch NE:");
			$display(branchNE );
		end


		if (mem_write  == exp_mem_write ) begin
			$display("Correct mem_write  ");
		end
		else begin
			$display("Incorrect mem_write:");
			$display(mem_write );
		end

		if (alu_control  == exp_alu_control ) begin
			$display("Correct alu_control  ");
		end
		else begin
			$display("Incorrect alu_control:");
			$display(alu_control );
		end
//

		if (reg_write  == exp_reg_write ) begin
			$display("Correct reg_write  ");
		end
		else begin
			$display("Incorrect reg_write:");
			$display(reg_write );
		end

		if (regDst  == exp_regDst ) begin
			$display("Correct regDst  ");
		end
		else begin
			$display("Incorrect regDst:");
			$display(regDst );
		end

		if (memToReg  == exp_memToReg ) begin
			$display("Correct memToReg  ");
		end
		else begin
			$display("Incorrect memToReg:");
			$display(memToReg );
		end

	endtask

	initial begin
	    instruction = 32'b00000000000000000000000000000000; #10
	    checkResult(6'b000000, opcode, 5'b00000, 5'b00000, 5'b00000, Rs, Rt, Rd,
	    			16'b000000000000000, imm,
	    			26'b00000000000000000000000000, addr,
	    			1'b0, jump,
	    			1'b0, jumpLink,
	    			1'b0, branchE,
	    			1'b0, branchNE,
	    			1'b0, mem_write,
	    			1'b0, alu_control,
	    			1'b0, reg_write,
	    			1'b0, regDst,
	    			1'b0, memToReg
	    );



endmodule

