`include "alu.v"
`include "signextend.v"
`include "addresslatch.v"
`include "instructionwrapper.v"
`include "regfile.v"
`include "shiftregister.v"
`include "datamemory.v"
// `include "mux32bitsel.v"
`include "branch.v"

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
  wire[4:0] Rs, Rd, Rt, shift;
  wire[15:0] imm;
  wire[5:0] Op, funct;
  wire[25:0] addr;
  wire[2:0] alu_src;
  wire jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, regDst, memToReg;  



  // data A and B
  wire[31:0] Da, Db;
  wire[31:0] selB;
  wire[31:0] DataOut, DataOutMem;

  // signextend for jump addr
  wire[31:0] extendedaddr, shiftedaddr;

  ///////////////// figure out what should we do for declaring input type
  instructionwrapper instrwrpr(Instructions, Rs, Rd, Rt, shift, imm, Op, funct, addr, alu_src, jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, regDst, memToReg);
  ///////////////// PC input? will be updated /////////////
  ALU alu1(PCplusfour, carryoutPC, zeroPC, overflowPC, PCupdated, 32'd4, 3'b000);

  signextend signextended(imm, extendedimm, shiftedimm);
  // 
  ALU alu2(PCfourimm, carryoutIm, zeroIm, overflowIm, PCplusfour, shiftedimm, 3'b000);
  // need to figure out how to use a mux to decide between different PC values

  mux32bitsel mux1(writebackreg, jumpLink, PCplusfour, writebackDout);

  regfile registerfile(Da, Db, writebackreg, Rs, Rd, Rt, reg_write, clk);
  mux32bitsel mux2(selB, alu_control, Db, extendedimm);

  ALU alu3(DataOut, carryoutReg, zeroReg, overflowReg, Da, selB, alu_src);

  datamemory Dmem(clk, writebackDout, DataOutMem, mem_write, Db);

  mux32bitsel mux3(writebackDout, memToReg, DataOut, DataOutMem);

  // `AND mux3selAND(mux3sel,branchatall,bne);

  branch branchinstr(zeroIm, branchatall, bne, mux3sel);
  mux32bitsel mux4(jumpaddr, mux3sel, PCplusfour, PCfourimm);
  mux32bitsel mux5(jumpaddrPC, jumpReg, jumpaddr, Da);


  // sign extend to addr
  signextend #(25) signextendjump(addr, extendedaddr, shiftedaddr);
  mux32bitsel mux6(PCaddr, jump, jumpaddrPC, extendedaddr);



endmodule
