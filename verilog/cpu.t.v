


`include "cpu.v"
`timescale 1ns/1ps
// Shift Register test bench
module cpuTest();

	reg clk;

	CPU cpu(
		.clk(clk)
	);

	task testInst;
		// input[5:0] exp_Op, Op;

		// if (Op == exp_Op) begin
		// 	$display("Correct OP code");
		// end
		// else begin
		// 	$display("Incorrect OP code:");
		// 	$display(Op);
		$display("Program counter: %h", cpu.PCaddr);

		// end

	endtask
	

	initial begin

		clk = 1; #12000; clk = 0; #12000;

	    $readmemh("InstructionExample", cpu.Dmem);

	    //$readmemh("text", CPU.IF.program_mem.mem);

		$display("Program counter: %h", cpu.PCaddr);
		$display("Program counter Updated: %h", cpu.PCupdated);
		$display("Jump Control: %h", cpu.jump);
		$display("Branch Control: %h", cpu.branchatall);




	 //    // Testing Jump and Link Values
	 //    Instructions = 32'b00001100000000000000000000000111; #10
	 //    testValuesA(6'b000011, Op);
	 //    testValuesB(5'b00000, Rs, 5'b00000, Rt, 5'b00000, Rd,
	 //    			16'b000000000000111, imm);
	 //    testValuesC(26'b00000000000000000000000111, addr,
	 //    			3'b000, alu_src,
	 //    			1'b1, jump,
	 //    			1'b1, jumpLink);
	 //    testValuesD(
	 //    			1'b0, branchatall,
	 //    			1'b0, bne,
	 //    			1'b0, mem_write,
	 //    			1'b1, alu_control);
	 //    testValuesE(
	 //    			1'b1, reg_write,
	 //    			1'b1, regDst,
	 //    			1'b1, memToReg,
	 //    			1'b0, jumpReg);
		// $display("END TEST 1 ---------------------------------------------");

	end

endmodule

