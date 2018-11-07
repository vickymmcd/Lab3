`include "alu.v"
`include "signextend.v"
`include "addresslatch.v"
`include "instructionwrapper.v"
`include "regfile.v"
`include "shiftregister.v"
`include "datamemory.v"
`include "DFF.v"
`include "signextendjump.v"
`include "signextendjump16.v"
`include "shift.v"
`include "branch.v"
`include "mux32bit3to1sel.v"
`timescale 1ns/1ps

module CPU
(
  input clk, // Since the instructions are storded in data memeroy, we only need the clock
  input reset
);

  // wires for PC
  wire[31:0] PCaddr, shiftedjumpaddr;
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
  wire[31:0] addr;
  wire[2:0] alu_src;
  wire[1:0] regDst;
  wire jump,jumpLink, jumpReg, branchatall, bne,mem_write,alu_control,reg_write, memToReg, reset;  

  // data A and B
  wire[31:0] Da, Db, MemoryDb;
  wire[31:0] selB;
  wire[31:0] DataOut, DataOutMem;

  // signextend for jump addr
  wire[31:0] extendedaddr, shiftedaddr;


  DFF pc(.clk(clk),.reset(reset),.enable(1'b1),.in(PCaddr), .out(PCupdated)); // Incrementing the PC

  // Getting control values, addr, etc. Breaking down the instruction
  instructionwrapper instrwrpr(.Instructions(MemoryDb), .Pc(PCaddr), .Rs(Rs), .Rd(Rd), .Rt(Rt), .shift(shift), .imm(imm), .Op(Op), .funct(funct), .addr(addr), .alu_src(alu_src), .jump(jump),.jumpLink(jumpLink), .jumpReg(jumpReg), .branchatall(branchatall), .bne(bne), .mem_write(mem_write),.alu_control(alu_control),.reg_write(reg_write), .regDst(regDst), .memToReg(memToReg));

  // Adding four to the PC
  ALU alu1(.result(PCplusfour), .carryout(carryoutPC), .zero(zeroPC), .overflow(overflowPC), .operandA(PCupdated), .operandB(32'd4), .command(3'b000));

  // Word aligning the immediate
  shift signextended(extendedimm, shiftedimm);

  // Extending the immediate
  signextendjump16 signextendjump2(imm,extendedimm);

  // Adding immiate to PC for banch
  ALU alu2(PCfourimm, carryoutIm, zeroIm, overflowIm, PCplusfour, shiftedimm, 3'b000);
  // need to figure out how to use a mux to decide between different PC values

  mux32bitsel mux1(writebackreg, jumpLink,  writebackDout, PCplusfour + 3'b100); // choose between PC+8 and write back from memory/alu


  mux32bit3to1sel mux7(regDstSel, regDst, Rt, Rd, 32'd31);

  // Slected which destiation we want
  //mux32bitsel mux7(regDstSel, regDst, Rt, Rd); // When 0 use rt, when 1 use rd

  // The reg file for sotring things
  regfile registerfile(Da, Db, writebackreg, Rs, Rt, regDstSel, reg_write, clk);

  // Controls what feeds the ALU
  mux32bitsel mux2(selB, alu_control, extendedimm, Db); // When 0 selects extendedimm, when 1 selects db

  // Does whole CPU caluclation, pulls data from Register, puts data into memory or feedback back to store in register
  ALU alu3(DataOut, carryoutReg, zeroReg, overflowReg, Da, selB, alu_src);

  // Data memory has instruction and regular parts
  datamemory Dmem(.clk(clk), .dataOut(DataOutMem), .address(DataOut), .writeEnable(mem_write), .dataIn(Db), .instructionAddr(PCupdated), .instructionOut(MemoryDb)); // I AM CHANGING THE ADDRESED TO BE the PC

  // Data in memory out into the register, for LW and SW
  mux32bitsel mux3(writebackDout, memToReg,DataOut,  DataOutMem);

  // Checking to bne or branch if equal
  branch branchinstr(zeroReg, branchatall, bne, mux3sel);

  // Checking to branch or not 
  mux32bitsel mux4(jumpaddr, mux3sel, PCplusfour, PCfourimm);

  // Checking to JR or not
  mux32bitsel mux5(jumpaddrPC, jumpReg, jumpaddr, Da);

  //shifting jump
  //shift signextendedJump(addr, shiftedjumpaddr);

  // Checking to jump or not
  mux32bitsel mux6(PCaddr, jump,  jumpaddrPC, addr); // when 1, take jumpaddPC

endmodule
