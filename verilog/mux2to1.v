
module mux2to1(
	output reg     out,
	input       address,
	input  input1,
	input input2
);

always @* begin
     // Join single-bit inputs into a bus, use address as index
		 if (address == 0)
		 	out<=input1;
		else
			out<=input2;

end

endmodule
