`include "mux2to1.v"

module branch
(
  input zero,
  input branchatall,
  input bne,
  output branch
);

wire [1:0] inputs;
inputs[0] = zero;
inputs[1] = !zero;
wire out;
mux2to1 mux(out, bne, inputs);
if (out && branchatall) begin
  assign branch = 1;
end
else begin
  assign branch = 0;
end

endmodule
