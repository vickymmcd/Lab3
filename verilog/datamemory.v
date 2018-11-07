//------------------------------------------------------------------------
// Data Memory
//   Positive edge triggered
//   dataOut always has the value mem[address]
//   If writeEnable is true, writes dataIn to mem[address]

// Adapted from module provided by Ben
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
    output [width-1:0]      dataOut,
    input [addresswidth-1:0]    address,
    input                       writeEnable,
    input [width-1:0]           dataIn,
    input [width-1:0]           instructionAddr,
    output [width-1:0]           instructionOut
);

    wire [11:0] DataIndex;      // Data memory index
    wire [11:0] InstrIndex;     // Instruction memory index
    reg [31:0] memory[4095:0];     // 16kb Memory

    assign InstrIndex = {instructionAddr[13:2]}; // taking off the last two bits
    assign DataIndex = {address[13:2]};


    always @(posedge clk) begin

        if(writeEnable)
            memory[DataIndex] <= dataIn;
    end
    // assign dataOut = memory[address]; OLD

    //initial $readmemh("InstructionExample.dat", memory);
    assign dataOut = memory[DataIndex];
    assign instructionOut = memory[InstrIndex];

endmodule


// module datamemory
// (
//     input                       clk,
//     output [31:0]      dataOut,
//     input [9:0]    address,
//     input                       writeEnable,
//     input [31:0]           dataIn,
//     input [9:0]           instructionAddr,
//     output [31:0]           instructionOut
// );

//     reg [31:0] memory[1023:0];  // is this supose to be bigger? 4095
//     //reg [width-1:0] memory [depth-1:0]; // Old data memory set up

//     always @(posedge clk) begin
//         if(writeEnable)
//             memory[address] <= dataIn;
//     end
//     // assign dataOut = memory[address]; OLD

//     //initial $readmemh("InstructionExample.dat", memory);
//     assign dataOut = memory[address];
//     assign instructionOut = memory[instructionAddr];

// endmodule