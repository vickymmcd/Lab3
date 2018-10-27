module signextend
#(parameter width = 16)
(
  input [width:0] unextended,
  input clk,
  output reg [31:0] extended 
);

always@(posedge clk)
  begin 
    extended <= $signed(unextended);
  end
endmodule