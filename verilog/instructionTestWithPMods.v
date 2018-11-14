`include "datamemory.v"

module MemoryOpTest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    input  [3:0] ja_p,
    output reg [3:0] led,
    output [7:0] je 
);

reg[31:0] address, dataIn;
wire[31:0] dataOut, instructionOut;
reg writeEnable;

datamemory dut(clk, dataOut, address, writeEnable, dataIn, 32'd0, instructionOut);


    assign je[0] = instructionOut[0];
    assign je[1] = instructionOut[1];
    assign je[2] = instructionOut[2];
    assign je[3] = instructionOut[3];
    assign je[4] = instructionOut[4];
    assign je[5] = instructionOut[5];
    assign je[6] = instructionOut[6];
    assign je[7] = instructionOut[7];

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
