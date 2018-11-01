`include "mux2to1.v"

module mux32bitsel(
	output[31:0]			out,
	input					addr,
	input[31:0]				input1,
	input[31:0] 			input2
);

	mux2to1 mux2to11(out[0], addr, input1[0], input2[0]);
	mux2to1 mux2to12(out[1], addr, input1[1], input2[1]);
	mux2to1 mux2to13(out[2], addr, input1[2], input2[2]);
	mux2to1 mux2to14(out[3], addr, input1[3], input2[3]);
	mux2to1 mux2to15(out[4], addr, input1[4], input2[4]);
	mux2to1 mux2to16(out[5], addr, input1[5], input2[5]);
	mux2to1 mux2to17(out[6], addr, input1[6], input2[6]);
	mux2to1 mux2to18(out[7], addr, input1[7], input2[7]);
	mux2to1 mux2to19(out[8], addr, input1[8], input2[8]);
	mux2to1 mux2to110(out[9], addr, input1[9], input2[9]);
	mux2to1 mux2to111(out[10], addr, input1[10], input2[10]);
	mux2to1 mux2to112(out[11], addr, input1[11], input2[11]);
	mux2to1 mux2to113(out[12], addr, input1[12], input2[12]);
	mux2to1 mux2to114(out[13], addr, input1[13], input2[13]);
	mux2to1 mux2to115(out[14], addr, input1[14], input2[14]);
	mux2to1 mux2to116(out[15], addr, input1[15], input2[15]);
	mux2to1 mux2to117(out[16], addr, input1[16], input2[16]);
	mux2to1 mux2to118(out[17], addr, input1[17], input2[17]);
	mux2to1 mux2to119(out[18], addr, input1[18], input2[18]);
	mux2to1 mux2to120(out[19], addr, input1[19], input2[19]);
	mux2to1 mux2to121(out[20], addr, input1[20], input2[20]);
	mux2to1 mux2to122(out[21], addr, input1[21], input2[21]);
	mux2to1 mux2to123(out[22], addr, input1[22], input2[22]);
	mux2to1 mux2to124(out[23], addr, input1[23], input2[23]);
	mux2to1 mux2to125(out[24], addr, input1[24], input2[24]);
	mux2to1 mux2to126(out[25], addr, input1[25], input2[25]);
	mux2to1 mux2to127(out[26], addr, input1[26], input2[26]);
	mux2to1 mux2to128(out[27], addr, input1[27], input2[27]);
	mux2to1 mux2to129(out[28], addr, input1[28], input2[28]);
	mux2to1 mux2to130(out[29], addr, input1[29], input2[29]);
	mux2to1 mux2to131(out[30], addr, input1[30], input2[30]);
	mux2to1 mux2to132(out[31], addr, input1[31], input2[31]);

endmodule