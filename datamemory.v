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
    input [width-1:0]           dataIn
);

    // reg [31:0] mem[4095:0];  
    reg [width-1:0] memory [depth-1:0];

    always @(posedge clk) begin
        if(writeEnable)
            memory[address] <= dataIn;
        dataOut <= memory[address];
    end

endmodule