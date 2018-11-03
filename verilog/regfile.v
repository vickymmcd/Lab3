`include "decoder1to32.v"
`include "mux32to1by32.v"
`include "register32.v"
`include "register32zero.v"


//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

  // These two lines are clearly wrong.  They are included to showcase how the
  // test harness works. Delete them after you understand the testing process,
  // and replace them with your actual code.
  wire[31:0] decoded;
  wire[31:0] register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31;
  decoder1to32 decoder(decoded, RegWrite, WriteRegister);

  register32zero register0def(register0, WriteData, decoded[0], Clk);
  register32 register1def(register1, WriteData, decoded[1], Clk);
  register32 register2def(register2, WriteData, decoded[2], Clk);
  register32 register3def(register3, WriteData, decoded[3], Clk);
  register32 register4def(register4, WriteData, decoded[4], Clk);
  register32 register5def(register5, WriteData, decoded[5], Clk);
  register32 register6def(register6, WriteData, decoded[6], Clk);
  register32 register7def(register7, WriteData, decoded[7], Clk);
  register32 register8def(register8, WriteData, decoded[8], Clk);
  register32 register9def(register9, WriteData, decoded[9], Clk);
  //register32zero register10def(register10, WriteData, decoded[10], Clk);
  register32 register10def(register10, WriteData, decoded[10], Clk);
  register32 register11def(register11, WriteData, decoded[11], Clk);
  register32 register12def(register12, WriteData, decoded[12], Clk);
  register32 register13def(register13, WriteData, decoded[13], Clk);
  register32 register14def(register14, WriteData, decoded[14], Clk);
  register32 register15def(register15, WriteData, decoded[15], Clk);
  register32 register16def(register16, WriteData, decoded[16], Clk);
  register32 register17def(register17, WriteData, decoded[17], Clk);
  register32 register18def(register18, WriteData, decoded[18], Clk);
  register32 register19def(register19, WriteData, decoded[19], Clk);
  register32 register20def(register20, WriteData, decoded[20], Clk);
  register32 register21def(register21, WriteData, decoded[21], Clk);
  register32 register22def(register22, WriteData, decoded[22], Clk);
  register32 register23def(register23, WriteData, decoded[23], Clk);
  register32 register24def(register24, WriteData, decoded[24], Clk);
  register32 register25def(register25, WriteData, decoded[25], Clk);
  register32 register26def(register26, WriteData, decoded[26], Clk);
  register32 register27def(register27, WriteData, decoded[27], Clk);
  register32 register28def(register28, WriteData, decoded[28], Clk);
  register32 register29def(register29, WriteData, decoded[29], Clk);
  register32 register30def(register30, WriteData, decoded[30], Clk);
  register32 register31def(register31, WriteData, decoded[31], Clk);


  mux32to1by32 mux1(ReadData1, ReadRegister1, register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31);
  mux32to1by32 mux2(ReadData2, ReadRegister2, register0, register1, register2, register3, register4, register5, register6, register7, register8, register9, register10, register11, register12, register13, register14, register15, register16, register17, register18, register19, register20, register21, register22, register23, register24, register25, register26, register27, register28, register29, register30, register31);


endmodule