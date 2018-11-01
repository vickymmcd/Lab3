module signextend
#(parameter width = 15)
(
  input [width:0] unextended,
  output reg [31:0] extended, shifted
);


  initial begin 
    extended <= $signed(unextended);
    shifted <= extended<<2;
  end
endmodule