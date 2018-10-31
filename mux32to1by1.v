

module mux32to1by1(
	output      out,
	input[4:0]  address,
	input[31:0] inputs
);


     // Join single-bit inputs into a bus, use address as index
	assign out=inputs[address];


endmodule