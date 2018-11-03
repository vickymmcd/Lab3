// deliverable 3
// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register32zero
#(parameter WIDTH=32)
(
output [WIDTH-1:0]	q,
input[WIDTH-1:0]		d,
input		wrenable,
input		clk
);

  assign q = 32'h0;

endmodule