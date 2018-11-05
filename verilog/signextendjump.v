`timescale 1ns/1ps
module signextendjump
(
  input [25:0] unextended,
  output [31:0] extended
);


	assign extended = {{6{unextended[25]}}, {unextended[25:0]}};

endmodule