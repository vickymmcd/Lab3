
`timescale 1ns/1ps
module DFF 
#( parameter width = 32,
    parameter initalVal = 0 )(
    input clk,
    input enable,
    input reset,
    input      [width-1:0] in,
    output reg [width-1:0] out
);
    always @(posedge clk, posedge reset)
        if(reset)
            out <= initalVal;
        else
            if(enable)
                out <= in;
endmodule