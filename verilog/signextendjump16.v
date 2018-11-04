`timescale 1ns/1ps
module signextendjump16
(
  input [15:0] unextended,
  output [31:0] extended
);


	assign extended = {{16{unextended[15]}}, {unextended[15:0]}};
endmodule