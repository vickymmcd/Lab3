
module mux3to1(
	output reg     out,
	input[1:0]       address,
	input  input1,
	input input2,
	input input3
);

always @* begin
     // Join single-bit inputs into a bus, use address as index
		 if (address[0] == 0)
		 	out<=input1;
		else if(address[0] == 1 && address[1] == 1)
			out<=input3;
		else
			out<=input2;

end

endmodule
