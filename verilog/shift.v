`timescale 1ns/1ps
module shift

(
	input [31:0] unshifted,
	output [31:0] shift_out
  // input [width:0] unextended,
  // //output [31:0] extended,
  // output reg[31:0] shifted
);


	assign shift_out[31:0]={unshifted[29:0],2'b00};
	// reg [31:0] extended;

    
 //  initial begin 
 //    extended <= $signed(unextended);
 //    shifted <= extended<<2;
 //  end
endmodule