module signextend
#(parameter width = 8)
(
  input [width:0] unextended,
  input clk,
  output reg [15:0] extended 
);

always@(posedge clk)
  begin 
    extended <= $signed(unextended);
  end
endmodule