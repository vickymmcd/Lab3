`include "alu.v"
`include "signextend.v"

module CPU
(
  input[16:0] immediate,
  input clk,
  input[31:0] PC,
  // insert inputs and outputs right here
);
  wire[31:0] PCplusfour, extendedimm;
  wire carryout, zero, overflow;
  alu pcalu1(PCplusfour, carryout, zero, overflow, PC, 32'd4, 3'b000);
  signextend signextend(immediate, clk, extendedimm);
  // my attempt to shift it left by 2, might need modification
  extendedimm <= {extendedimm 2'b00};
  alu pcalu2(PCfourimm, carryout, zero, overflow, PCplusfour, extendedimm, 3'b000);
  // need to figure out how to use a mux to decide between different PC values


endmodule
