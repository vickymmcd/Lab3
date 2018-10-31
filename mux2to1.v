
module mux2to1(
	output      out,
	input       address,
	input[1:0]  inputs
);


     // Join single-bit inputs into a bus, use address as index
	assign out=inputs[address];


endmodule
