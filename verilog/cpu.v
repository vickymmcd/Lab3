`include "alu.v"
`include "signextend.v"
`include "addresslatch.v"
`include "instructionwrapper.v"
`include "regfile.v"
`include "shiftregister.v"
`include "datamemory.v"
`include "DFF.v"
`include "aluExtra.v"
`include "signextendjump.v"
`include "regfileExtra.v"
`include "signextendjump16.v"
// `include "mux32bitsel.v"
`include "branch.v"
`timescale 1ns/1ps

module CPU
(
  input clk, // Since the instructions are storded in data memeroy, we only need the clock
  input reset
);

  // wires for PC
  wire[31:0] PCaddr;
  wire[31:0] PCupdated, PCplusfour, writebackDout;
  wire carryoutPC, zeroPC, overflowPC;
  // wires for Jump, JAL, JR
  wire[31:0] jumpaddr, PCfourimm, jumpaddrPC;
  // wires for branch
  wire mux3sel;

  // wires for sign extend
  wire[31:0] extendedimm, shiftedimm;
  wire carryoutIm, zeroIm, overflowIm;

  // wires for reg
  wire carryoutReg, zeroReg, overflowReg;
  wire[31:0] writebackreg, addrwrite;

  // control signals
  wire[4:0] Rs, Rd, Rt, shift, regDstSel;
  wire[15:0] imm;
  wire[5:0] Op, funct;
  wire[25:0] addr;
  wire[2:0] alu_src;
  wire jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, regDst, memToReg, reset;  

  // data A and B
  wire[31:0] Da, Db, MemoryDb;
  wire[31:0] selB;
  wire[31:0] DataOut, DataOutMem;

  // signextend for jump addr
  wire[31:0] extendedaddr, shiftedaddr;


  DFF pc(.clk(clk),.reset(reset),.enable(1'b1),.in(PCaddr), .out(PCupdated));

  instructionwrapper instrwrpr(MemoryDb, Rs, Rd, Rt, shift, imm, Op, funct, addr, alu_src, jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, regDst, memToReg);

  ALU alu1(.result(PCplusfour), .carryout(carryoutPC), .zero(zeroPC), .overflow(overflowPC), .operandA(PCupdated), .operandB(32'd4), .command(3'b000));

  signextend signextended(imm, shiftedimm);

  signextendjump16 signextendjump2(imm,extendedimm);
  // 
  ALU alu2(PCfourimm, carryoutIm, zeroIm, overflowIm, PCplusfour, shiftedimm, 3'b000);
  // need to figure out how to use a mux to decide between different PC values

  mux32bitsel mux1(writebackreg, jumpLink,  writebackDout, PCplusfour);

  mux32bitsel mux7(regDstSel, regDst, Rt, Rd); // When 0 use rt, when 1 use rd


  regfile registerfile(Da, Db, writebackreg, Rs, Rt, regDstSel, reg_write, clk);


  mux32bitsel mux2(selB, alu_control, extendedimm, Db); // When 0 selects extendedimm, when 1 selects db

  ALU alu3(DataOut, carryoutReg, zeroReg, overflowReg, Da, selB, alu_src);

  datamemory Dmem(.clk(clk), .dataOut(DataOutMem), .address(DataOut), .writeEnable(mem_write), .dataIn(Db), .instructionAddr(PCupdated), .instructionOut(MemoryDb)); // I AM CHANGING THE ADDRESED TO BE the PC

  mux32bitsel mux3(writebackDout, memToReg,DataOut,  DataOutMem);

  // `AND mux3selAND(mux3sel,branchatall,bne);

  branch branchinstr(zeroIm, branchatall, bne, mux3sel);

  mux32bitsel mux4(jumpaddr, mux3sel, PCplusfour, PCfourimm); //???
  mux32bitsel mux5(jumpaddrPC, jumpReg, jumpaddr, Da);

  // sign extend to addr
  signextendjump signextendjump3(addr, extendedaddr);

  mux32bitsel mux6(PCaddr, jump,  jumpaddrPC, extendedaddr); // when 1, take jumpaddPC

endmodule
