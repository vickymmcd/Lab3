module signextend
#(parameter width = 15)
(
  input [width:0] unextended,
  input clk,
  output reg [31:0] extended, shifted
);

always@(posedge clk)
  begin 
    extended <= $signed(unextended);
    shifted <= extended<<2;
  end
endmodule