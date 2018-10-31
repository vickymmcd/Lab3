`include "branch.v"
`timescale 1ns/1ps
// branch module test bench
module testbranch();

    reg zero;
    reg branchatall;
    reg bne;
    wire branch;


    branch dut
    (
      .zero(zero),
    	.branchatall(branchatall),
    	.bne(bne),
    	.branch(branch)
    );


initial begin

  // Test Case 1:
  // branch not equal -> they are equal -> should return 0
  zero = 1'b1;
  bne = 1'b1;
  branchatall = 1'b1; #20

  if((branch !== 1'b0)) begin
      $display("Test Case 1 Failed %b", branch);
  end

  // Test Case 2:
  // branch when equal -> they are equal -> should return 1
  zero = 1'b1;
  bne = 1'b0;
  branchatall = 1'b1; #20

  if((branch !== 1'b1)) begin
      $display("Test Case 2 Failed %b", branch);
  end

  // Test Case 3:
  // branch not equal -> they are not equal -> should return 1
  zero = 1'b0;
  bne = 1'b1;
  branchatall = 1'b1; #20

  if((branch !== 1'b1)) begin
      $display("Test Case 3 Failed %b", branch);
  end

  // Test Case 4:
  // don't branch at all -> should return 0
  zero = 1'b0;
  bne = 1'b1;
  branchatall = 1'b0; #20

  if((branch !== 1'b0)) begin
      $display("Test Case 4 Failed %b", branch);
  end


end

endmodule
