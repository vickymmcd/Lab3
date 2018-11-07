`timescale 1ns/1ps
module shift

(
	input [31:0] unshifted,
	output [31:0] shift_out
);


	assign shift_out[31:0]={unshifted[29:0],2'b00};
endmodule