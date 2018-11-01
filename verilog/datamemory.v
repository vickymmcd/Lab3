//------------------------------------------------------------------------
// Data Memory
//   Positive edge triggered
//   dataOut always has the value mem[address]
//   If writeEnable is true, writes dataIn to mem[address]
//------------------------------------------------------------------------

module datamemory
#(
    parameter addresswidth  = 32,
    //parameter depth         = 2**addresswidth,
    parameter depth = 32,
    parameter width         = 32
)
(
    input 		                clk,
    output reg [width-1:0]      dataOut,
    input [addresswidth-1:0]    address,
    input                       writeEnable,
    input [width-1:0]           dataIn,
    input [width-1:0]           instructionAddr,
    input [width-1:0]           instructionOut
);

    reg [31:0] memory[1023:0];  // is this supose to be bigger? 4095
    //reg [width-1:0] memory [depth-1:0]; // Old data memory set up

    always @(posedge clk) begin
        if(writeEnable)
            memory[address] <= dataIn;
    end
    // assign dataOut = memory[address]; OLD
    assign dataOut = memory[address];
    assign instructionOut = memory[instructionAddr];

endmodule