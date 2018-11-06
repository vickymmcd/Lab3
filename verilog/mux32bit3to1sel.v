`include "mux3to1.v"

module mux32bit3to1sel(
	output[31:0]			out,
	input[1:0]					addr,
	input[31:0]				input1,
	input[31:0] 			input2,
	input[31:0]				input3
);

	mux3to1 mux3to11(out[0], addr, input1[0], input2[0], input3[0]);
	mux3to1 mux3to12(out[1], addr, input1[1], input2[1], input3[1]);
	mux3to1 mux3to13(out[2], addr, input1[2], input2[2], input3[2]);
	mux3to1 mux3to14(out[3], addr, input1[3], input2[3], input3[3]);
	mux3to1 mux3to15(out[4], addr, input1[4], input2[4], input3[4]);
	mux3to1 mux3to16(out[5], addr, input1[5], input2[5], input3[5]);
	mux3to1 mux3to17(out[6], addr, input1[6], input2[6], input3[6]);
	mux3to1 mux3to18(out[7], addr, input1[7], input2[7], input3[7]);
	mux3to1 mux3to19(out[8], addr, input1[8], input2[8], input3[8]);
	mux3to1 mux3to110(out[9], addr, input1[9], input2[9], input3[9]);
	mux3to1 mux3to111(out[10], addr, input1[10], input2[10], input3[10]);
	mux3to1 mux3to112(out[11], addr, input1[11], input2[11], input3[11]);
	mux3to1 mux3to113(out[12], addr, input1[12], input2[12], input3[12]);
	mux3to1 mux3to114(out[13], addr, input1[13], input2[13], input3[13]);
	mux3to1 mux3to115(out[14], addr, input1[14], input2[14], input3[14]);
	mux3to1 mux3to116(out[15], addr, input1[15], input2[15], input3[15]);
	mux3to1 mux3to117(out[16], addr, input1[16], input2[16], input3[16]);
	mux3to1 mux3to118(out[17], addr, input1[17], input2[17], input3[17]);
	mux3to1 mux3to119(out[18], addr, input1[18], input2[18], input3[18]);
	mux3to1 mux3to120(out[19], addr, input1[19], input2[19], input3[19]);
	mux3to1 mux3to121(out[20], addr, input1[20], input2[20], input3[20]);
	mux3to1 mux3to122(out[21], addr, input1[21], input2[21], input3[21]);
	mux3to1 mux3to123(out[22], addr, input1[22], input2[22], input3[22]);
	mux3to1 mux3to124(out[23], addr, input1[23], input2[23], input3[23]);
	mux3to1 mux3to125(out[24], addr, input1[24], input2[24], input3[24]);
	mux3to1 mux3to126(out[25], addr, input1[25], input2[25], input3[25]);
	mux3to1 mux3to127(out[26], addr, input1[26], input2[26], input3[26]);
	mux3to1 mux3to128(out[27], addr, input1[27], input2[27], input3[27]);
	mux3to1 mux3to129(out[28], addr, input1[28], input2[28], input3[28]);
	mux3to1 mux3to130(out[29], addr, input1[29], input2[29], input3[29]);
	mux3to1 mux3to131(out[30], addr, input1[30], input2[30], input3[30]);
	mux3to1 mux3to132(out[31], addr, input1[31], input2[31], input3[31]);

endmodule