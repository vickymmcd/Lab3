`include "mux2to1.v"

module mux32bitsel(
	output[31:0]			out,
	input					addr,
	input[31:0]				input1,
	input[31:0] 			input2
	);

	genvar i;
	generate
		for (i = 1; i<31; i = i + 1)
		begin:genblock
			mux2to1 muxout(out[i],addr,input[i],input2[i]);
		end 
	endgenerate

endmodule