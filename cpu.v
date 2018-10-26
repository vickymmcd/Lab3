`include "alu.v"

module CPU
(
  // insert inputs and outputs right here
);
  wire[31:0] PC, PCplusfour;
  wire carryout, zero, overflow;
  alu pcalu(PCplusfour, carryout, zero, overflow, PC, 32'd4, 3'b000);

endmodule
