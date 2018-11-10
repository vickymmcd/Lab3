`include "datamemory.v"

module MemoryOpTest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    output reg [3:0] led
);

reg[31:0] address, dataIn;
wire[31:0] dataOut, instructionOut;
reg writeEnable;

datamemory dut(clk, dataOut, address, writeEnable, dataIn, address, instructionOut);


always @(posedge clk) begin


    if (btn[0] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[1] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      writeEnable <= sw[0];
    end


    if (btn[3] == 1) begin
      //Setting the led's
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end

end



endmodule
