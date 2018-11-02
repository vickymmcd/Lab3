
// ALU testbench
`timescale 1ns/1ps
`include "alu.v"


module testALU();
    wire [31:0] operandA;     // first bitstream
    wire [31:0] operandB;     // second bitstream
    wire [2:0] command;       // 3 bits control signal
    wire [31:0] result;       // result
    wire carryout;            // carryout bits
    wire zero;
    wire overflow;            // overflow bits
    reg   begintest;
    wire    endtest;
    wire    alupassed;

    // Instantiate ALU register file
    ALU alu(
      .result(result),
      .carryout(carryout),
      .zero(zero),
      .overflow(overflow),
      .operandA(32'd4),
      .operandB(32'd0),
      .command(3'b000)
      );

  initial begin
    // assign operandA=32'd4;
    // assign operandB=32'd0;
    // assign command=3'b000;
    // #1000;


    if(( result !== 32'b11111111111111111111111111111110) || (carryout !== 1) || (overflow !==0) || (zero !== 0)) begin
      $display("Test Case 1b Failed ONE WITH 32");
      $display("Result %b",result);
    end

  end
endmodule