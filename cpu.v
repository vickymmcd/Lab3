`include "alu.v"
`include "signextend.v"
`include "addresslatch.v"
`include "instructionwrapper.v"
`include "regfile.v"
`include "shiftregister.v"
`include "datamemory.v"

`define AND and #50 // tentatively change delay in AND


module CPU
(
  // input[16:0] immediate,
  input clk,
  input[31:0] PC,
  input[31:0] Instructions,
  output[31:0] writebackDout
  // insert inputs and outputs right here
);

  // wires for PC
  wire[31:0] PCaddr, PCupdated, PCplusfour;

  // wires for Jump, JAL, JR
  wire[31:0] jumpaddr, addedshiftedimm;
  // Need wires for Branch

  // wires for sign extend
  wire[31:0] extendedimm, shiftedimm;
  wire carryout, zero, overflow;

  // wires for reg
  wire writebackreg, addrwrite;

  ///////////////// figure out what should we do for declaring input type
  instructionwrapper instrwrpr(Instructions, 1, Rs, Rd, Rt, immediate, Op, addr, alu_src, jump, jumpLink, branchE, branchNE, mem_write,alu_control,reg_write, regDst, memToReg);

  ///////////////// PC will be updated /////////////
  alu pcalu1(PCplusfour, carryout, zero, overflow, PC, 32'd4, 3'b000);

  signextend signextended(immediate, clk, extendedimm, shiftedimm);
  // 
  alu pcalu2(PCfourimm, carryout, zero, overflow, PCplusfour, extendedimm, 3'b000);
  // need to figure out how to use a mux to decide between different PC values


endmodule
