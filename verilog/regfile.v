//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register32.v"
`include "register32zero.v"
`include "mux32to1by1.v"
`include "mux32to1by32.v"
`include "decoder1to32.v"


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

	wire[31:0] register0Out, register1Out,register2Out,register3Out,register4Out,register5Out,register6Out,register7Out,register8Out,register9Out,register10Out, register11Out,register12Out,register13Out,register14Out,register15Out,register16Out,register17Out,register18Out,register19Out, register20Out, register21Out,register22Out,register23Out,register24Out,register25Out,register26Out,register27Out,register28Out,register29Out, register30Out, register31Out,register32Out;
	wire[31:0] fromDecoder;
	wire[31:0] toActiveMux;
	wire[3:0] testMux;


	decoder1to32 decoder1to32(.out(fromDecoder), .enable(RegWrite), .address(WriteRegister));
	// output[31:0]  out,
	// input         enable,
	// input[4:0]    address


 	register32zero register0(.q(register0Out), .d(WriteData), .wrenable(fromDecoder[0]), .clk(Clk));
	// // (
	// // output[31:0]	q,
	// // input[31:0]		d,
	// // input		wrenable,
	// // input		clk
	// // );

	register32 register1(.q(register1Out), .d(WriteData), .wrenable(fromDecoder[1]), .clk(Clk));
 	//output[31:0]	q,
	// // input[31:0]		d,
	// // input		wrenable,
	// // input		clk


	// // Reapeat 30 times

	register32 register2(.q(register2Out), .d(WriteData), .wrenable(fromDecoder[2]), .clk(Clk));
	register32 register3(.q(register3Out), .d(WriteData), .wrenable(fromDecoder[3]), .clk(Clk));
	register32 register4(.q(register4Out), .d(WriteData), .wrenable(fromDecoder[4]), .clk(Clk));
	register32 register5(.q(register5Out), .d(WriteData), .wrenable(fromDecoder[5]), .clk(Clk));
	register32 register6(.q(register6Out), .d(WriteData), .wrenable(fromDecoder[6]), .clk(Clk));
	register32 register7(.q(register7Out), .d(WriteData), .wrenable(fromDecoder[7]), .clk(Clk));
	register32 register8(.q(register8Out), .d(WriteData), .wrenable(fromDecoder[8]), .clk(Clk));
	register32 register9(.q(register9Out), .d(WriteData), .wrenable(fromDecoder[9]), .clk(Clk));
	register32 register10(.q(register10Out), .d(WriteData), .wrenable(fromDecoder[10]), .clk(Clk));
	register32 register11(.q(register11Out), .d(WriteData), .wrenable(fromDecoder[11]), .clk(Clk));
	register32 register12(.q(register12Out), .d(WriteData), .wrenable(fromDecoder[12]), .clk(Clk));
	register32 register13(.q(register13Out), .d(WriteData), .wrenable(fromDecoder[13]), .clk(Clk));
	register32 register14(.q(register14Out), .d(WriteData), .wrenable(fromDecoder[14]), .clk(Clk));
	register32 register15(.q(register15Out), .d(WriteData), .wrenable(fromDecoder[15]), .clk(Clk));
	register32 register16(.q(register16Out), .d(WriteData), .wrenable(fromDecoder[16]), .clk(Clk));
	register32 register17(.q(register17Out), .d(WriteData), .wrenable(fromDecoder[17]), .clk(Clk));
	register32 register18(.q(register18Out), .d(WriteData), .wrenable(fromDecoder[18]), .clk(Clk));
	register32 register19(.q(register19Out), .d(WriteData), .wrenable(fromDecoder[19]), .clk(Clk));
	register32 register20(.q(register20Out), .d(WriteData), .wrenable(fromDecoder[20]), .clk(Clk));
	register32 register21(.q(register21Out), .d(WriteData), .wrenable(fromDecoder[21]), .clk(Clk));
	register32 register22(.q(register22Out), .d(WriteData), .wrenable(fromDecoder[22]), .clk(Clk));
	register32 register23(.q(register23Out), .d(WriteData), .wrenable(fromDecoder[23]), .clk(Clk));
	register32 register24(.q(register24Out), .d(WriteData), .wrenable(fromDecoder[24]), .clk(Clk));
	register32 register25(.q(register25Out), .d(WriteData), .wrenable(fromDecoder[25]), .clk(Clk));
	register32 register26(.q(register26Out), .d(WriteData), .wrenable(fromDecoder[26]), .clk(Clk));
	register32 register27(.q(register27Out), .d(WriteData), .wrenable(fromDecoder[27]), .clk(Clk));
	register32 register28(.q(register28Out), .d(WriteData), .wrenable(fromDecoder[28]), .clk(Clk));
	register32 register29(.q(register29Out), .d(WriteData), .wrenable(fromDecoder[29]), .clk(Clk));
	register32 register30(.q(register30Out), .d(WriteData), .wrenable(fromDecoder[30]), .clk(Clk));
	register32 register31(.q(register31Out), .d(WriteData), .wrenable(fromDecoder[31]), .clk(Clk));


	// mux32to1by1 mux32to1by1(.out(toActiveMux), .address(ReadRegister2), .inputs(toMux));
	// // output      out,
	// // input[4:0]  address,
	// // input[31:0] inputs

	assign testMux = {register0Out,register0Out, register0Out,register0Out};

	mux32to1by32 mux32to1by32A(ReadData1, ReadRegister1, register0Out, register1Out,register2Out,register3Out,register4Out,register5Out,register6Out,register7Out,register8Out,register9Out,register10Out, register11Out,register12Out,register13Out,register14Out,register15Out,register16Out,register17Out,register18Out,register19Out, register20Out, register21Out,register22Out,register23Out,register24Out,register25Out,register26Out,register27Out,register28Out,register29Out, register30Out, register31Out);
	// output[31:0]  out,
	// input[4:0]    address,
	// input[31:0]   input0, input1...input31

	mux32to1by32 mux32to1by32B(ReadData2, ReadRegister2, register0Out, register1Out,register2Out,register3Out,register4Out,register5Out,register6Out,register7Out,register8Out,register9Out,register10Out, register11Out,register12Out,register13Out,register14Out,register15Out,register16Out,register17Out,register18Out,register19Out, register20Out, register21Out,register22Out,register23Out,register24Out,register25Out,register26Out,register27Out,register28Out,register29Out, register30Out, register31Out);
	// output[31:0]  out,
	// input[4:0]    address,
	// input[31:0]   input0, input1...input31



endmodule