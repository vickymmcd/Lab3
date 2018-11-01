`include "mux32bitsel.v"

module branch
(
  input zero,
  input branchatall,
  input bne,
  output reg branch
);

wire out;
mux2to1 mux21(.out(out), .address(bne), .input1(zero), .input2(!zero));

always @* begin
  if (out==1 && branchatall==1) begin
    branch <= 1;
  end
  else begin
    branch <= 0;
  end
end

endmodule
