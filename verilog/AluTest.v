

// Tests the ALU
// Make swithces into first number, press button 0 to save
// Make swithces into second number, press button 1 to save
// Make swithces into operand code, press button 2 to save
// Press button 3 to see reuslts


`timescale 1ns / 1ps

// JK flip-flop
module jkff1
(
    input trigger,
    input j,
    input k,
    output reg q
);
    always @(posedge trigger) begin
        if(j && ~k) begin
            q <= 1'b1;
        end
        else if(k && ~j) begin
            q <= 1'b0;
        end
        else if(k && j) begin
            q <= ~q;
        end
    end
endmodule

// Four-input MUX with parameterized 4 bit width
module mux4
(
    input[3:0]    in0,
    input[3:0]    in1,
    input[3:0]    in2,
    input[3:0]    in3,
    input[2:0]    sel,
    output[3:0]   out
);
    
    if(sel === 2'b00) begin
        assign out = in0;
    end
    else if(sel === 2'b01) begin
        assign out = in1;
    end
    else if(sel === 2'b10) begin
        assign out = in2;
    end
    else begin
        assign out = in3;
    end
endmodule


module AluTest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    output [3:0] led
);

    wire[1:0] res_sel;
    wire clk;
    wire[3:0] DataOut, OpInput, Num1, Num2;
    wire carryout, zero, overflow;
    wire [31:0] operandA;     
    wire [31:0] operandB;      
    wire [2:0] command;       
    wire [31:0] result;


    ALU alu(
      .result(result),
      .carryout(carryout),
      .zero(zero),
      .overflow(overflow),
      .operandA(operandA),
      .operandB(operandB),
      .command(command)
    );

    jkff1 src_sel(.trigger(clk), .j(btn[1]), .k(btn[0]), .q(res_sel));

    assign OpInput[0] = sw[0];
    assign OpInput[1] = sw[1];
    assign OpInput[2] = sw[2];
    assign OpInput[3] = sw[3];

    assign Num1[0] = sw[0];
    assign Num1[1] = sw[1];
    assign Num1[2] = sw[2];
    assign Num1[3] = sw[3];

    assign Num2[0] = sw[0];
    assign Num2[1] = sw[1];
    assign Num2[2] = sw[2];
    assign Num2[3] = sw[3];

    // Setting the output values
    assign DataOut[0] = result[0];
    assign DataOut[1] = result[1];
    assign DataOut[2] = result[2];
    assign DataOut[3] = result[3];


    mux4 output_select(.in0(Num1), .in1(Num2), .in2(OpInput), .in3(DataOut), .sel(res_sel),.out(led));

endmodule
