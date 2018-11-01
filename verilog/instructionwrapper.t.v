


`include "instructionwrapper.v"
`timescale 1ns/1ps
// Shift Register test bench
module instructionwrapperTest();

	reg[31:0] Instructions;
	wire[15:0] imm;
	wire[25:0] addr;
	wire[4:0] Rs, Rd, Rt;
	wire[5:0] Op, funct;
	wire[2:0]  alu_src;
	wire alu_control,jumpLink, jump, jumpReg, regDst,memToReg, bne, branchatall, mem_write, reg_write;

	instructionwrapper instructionwrapper(
		.Instructions(Instructions),
		.Rs             (Rs),
		.Rd             (Rd),
		.Rt             (Rt),
		.imm            (imm),
		.Op			    (Op),
		.funct          (funct),
		.addr           (addr),
		.alu_src        (alu_src),
		.jump           (jump),
		.jumpLink       (jumpLink),
		.jumpReg        (jumpReg),
		.branchatall        (branchatall),
		.bne            (bne),
		.mem_write      (mem_write),
		.alu_control    (alu_control),
		.reg_write      (reg_write),
		.regDst         (regDst),
		.memToReg       (memToReg)
	);

	task testValuesA;
		input[5:0] exp_Op, Op;

		if (Op == exp_Op) begin
			$display("Correct OP code");
		end
		else begin
			$display("Incorrect OP code:");
			$display(Op);
		end

	endtask

	task testValuesB;
		input[4:0] exp_rs, Rs, exp_rt, Rt, exp_rd, Rd;
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
		input [2:0] exp_alu_src, alu_src;
		input  exp_jump, jump, exp_jumpLink, jumpLink;

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

		input branchatall, exp_branchatall, bne, exp_bne, mem_write, exp_mem_write, alu_control,   exp_alu_control; 
		if ((branchatall  == exp_branchatall ) && (bne == exp_bne ) && (mem_write  == exp_mem_write ) && (alu_control  == exp_alu_control ))begin
			$display("Correct branchatall, bne, mem_write, alu_control  ");
		end
		else begin
			$display("Incorrect branchatall, bne, mem_write, alu_control");
			$display(branchatall );
			$display(bne );
			$display(mem_write );
			$display(alu_control );

		end

	endtask

	task testValuesE;

		input reg_write, exp_reg_write, regDst, exp_memToReg, exp_regDst, memToReg, exp_jumpReg, jumpReg; 
		if ((reg_write  == exp_reg_write ) && (regDst  == exp_regDst ) && (memToReg  == exp_memToReg ) ) begin
			$display("Correct reg_write, regDst, memToReg  ");
		end
		else begin
			$display("Incorrect reg_write, regDst, memToReg");
			$display(reg_write );
			$display(regDst );
			$display(memToReg );
			$display(jumpReg );
		end



	endtask
	

	initial begin


	    // Testing Jump and Link Values
	    Instructions = 32'b00001100000000000000000000000111; #10
	    testValuesA(6'b000011, Op);
	    testValuesB(5'b00000, Rs, 5'b00000, Rt, 5'b00000, Rd,
	    			16'b000000000000111, imm);
	    testValuesC(26'b00000000000000000000000111, addr,
	    			3'b000, alu_src,
	    			1'b1, jump,
	    			1'b1, jumpLink);
	    testValuesD(
	    			1'b0, branchatall,
	    			1'b0, bne,
	    			1'b0, mem_write,
	    			1'b1, alu_control);
	    testValuesE(
	    			1'b1, reg_write,
	    			1'b1, regDst,
	    			1'b1, memToReg,
	    			1'b0, jumpReg);
		$display("END TEST 1 ---------------------------------------------");

		// Testing addI values
	    #10
	    Instructions = 32'b00100000010000011110000000000000; #10
	    testValuesA(6'b001000, Op);
	    testValuesB(5'b00010, Rs, 5'b00001,Rt,  5'b11100,  Rd,
	    			16'b1110000000000000, imm);
	    testValuesC(26'b00010000011110000000000000, addr,
	    			3'b000, alu_src,
	    			1'b0, jump,
	    			1'b0, jumpLink);
	    testValuesD(
	    			1'b0, branchatall,
	    			1'b0, bne,
	    			1'b0, mem_write,
	    			1'b0, alu_control);
	    testValuesE(
	    			1'b1, reg_write,
	    			1'b0, regDst,
	    			1'b0, memToReg,
	    			1'b0, jumpReg);
		$display("END TEST 2 ---------------------------------------------");


		// 32'b000100|00000|00000|0000000000000000; #10


		// Testing LW values
	    #10
	    Instructions = 32'b10001100010000011110000000000000; #10
	    testValuesA(6'b100011, Op);
	    testValuesB(5'b00010, Rs, 5'b00001,Rt,  5'b11100,  Rd,
	    			16'b1110000000000000, imm);
	    testValuesC(26'b00010000011110000000000000, addr,
	    			3'b000, alu_src,
	    			1'b0, jump,
	    			1'b0, jumpLink);
	    testValuesD(
	    			1'b0, branchatall,
	    			1'b0, bne,
	    			1'b0, mem_write,
	    			1'b1, alu_control);
	    testValuesE(
	    			1'b0, reg_write,
	    			1'b1, regDst,
	    			1'b1, memToReg,
	    			1'b0, jumpReg);
		$display("END TEST 3 ---------------------------------------------");

		// R type: JR
	    Instructions = 32'b00000000011000100000100000001000; #10
	    testValuesA(6'b000000, Op);
	    testValuesB(5'b00011, Rs, 5'b00010, Rt,  5'b00001, Rd,
	    			16'b0000100000001000, imm);
	    testValuesC(26'b00011000100000100000001000, addr,
	    			3'd1, alu_src,
	    			1'b1, jump,
	    			1'b0, jumpLink);
	    testValuesD(
	    			1'b0, branchatall,
	    			1'b0, bne,
	    			1'b0, mem_write,
	    			1'b0, alu_control);
	    testValuesE(
	    			1'b0, reg_write,
	    			1'b0, regDst,
	    			1'b0, memToReg,
	    			1'b1, jumpReg);
	    $display("END TEST 4 ---------------------------------------------");



	end

endmodule

