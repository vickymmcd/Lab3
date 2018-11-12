
`define AND and //#30
`define OR or //#30
`define NOT not //#10
`define XOR xor //#60
`define AND3 and// #40
`define OR4 or //#50

`define ADD_ALU  3'd0
`define SUB_ALU  3'd1
`define XOR_ALU  3'd2
`define SLT_ALU  3'd3
`define AND_ALU  3'd4
`define NAND_ALU 3'd5
`define NOR_ALU  3'd6
`define OR_ALU   3'd7


module ALUcontrolLUT
(
output reg  address0,
output reg  address1,
output reg invert,
input[2:0]  ALUcommand
);


// Instantiate the look up table with always command and define cases
  always @(ALUcommand) begin;
    case (ALUcommand)
      `ADD_ALU:  begin address0 = 0; address1=0; invert = 0; end
      `SUB_ALU:  begin address0 = 0; address1=0; invert = 1; end
      `XOR_ALU:  begin address0 = 1; address1=1; invert = 0; end
      `SLT_ALU:  begin address0 = 0; address1=0; invert = 1; end
      `AND_ALU:  begin address0 = 0; address1=1; invert = 0; end
      `NAND_ALU: begin address0 = 0; address1=1; invert = 1; end
      `NOR_ALU:  begin address0 = 1; address1=0; invert = 1; end
      `OR_ALU:   begin address0 = 1; address1=0; invert = 0; end
    endcase
  end
endmodule

module structuralMultiplexer
(
    output out,
    input addr0, addr1,
    input in0, in1, in2, in3
);

    wire notA0, notA1, A0andA1, notA0andA1, notA0andnotA1, A0andnotA1;
    wire in0and, in1and, in2and, in3and;

    `NOT not1(notA0, addr0);
    `NOT not2(notA1, addr1);
    `AND and1(A0andA1, addr0, addr1);
    `AND and2(A0andnotA1, addr0, notA1);
    `AND and3(notA0andA1, notA0, addr1);
    `AND and4(notA0andnotA1, notA0, notA1);
    `AND and5(in0and, in0, notA0andnotA1);
    `AND and6(in1and, in1, A0andnotA1);
    `AND and7(in2and, in2, notA0andA1);
    `AND and8(in3and, in3, A0andA1);
    `OR4 or1(out, in0and, in1and, in2and, in3and);

endmodule

module structuralBitSlice
(
    output sum,
    output carryout,
    input[2:0] control,
    input a,
    input b,
    input carryin

);

 wire AxorB2, AxorBxorC, AxorBC, AB, notControl1, notControl2, subtract, newB, AnewB;
 wire sumval, address0, address1, invert, nandand, noror, AxorB, AorB, suborslt, slt;
 ALUcontrolLUT mylut(address0, address1, invert, control);

 // values for sum, subtract, and slt
 `NOT notGate(notControl1, control[1]);
 `NOT notGate2(notControl2, control[2]);
 `AND3 andGate(subtract, control[0], notControl1, notControl2);
 `AND3 andGateslt(slt, control[0], control[1], notControl2);
 `OR orGatesub(suborslt, subtract, slt);
 `XOR xorGate(newB, suborslt, b);
 `XOR xorGate1(AxorB2, a, newB);
 `XOR xorGate2(sumval, AxorB2, carryin);
 `AND andGate1(AB, a, b);
 `AND andGateb(AnewB, a, newB);
 `AND andGate2(AxorBC, carryin, AxorB2);
 `OR orGate1( carryout, AnewB, AxorBC);

 // values for or and nor
 `OR orGate(AorB, a, b);
 `XOR xorGate4(noror, invert, AorB);

 // values for and and nand
 `XOR xorGate3(nandand, invert, AB);

// value for xor
 `XOR xorGate5(AxorB, a, b);

 // always @(a) begin
 //  if(a == 1'bx)
 //    a <= 0;
 // end

 // always @(b) begin
 //  if(b == 1'bx)
 //    b <= 0;
 // end

 structuralMultiplexer mymux(sum, address0, address1, sumval, noror, nandand, AxorB);


endmodule

`define XOR xor //#60
`define AND1 and //#20
`define AND3 and //#40
`define NOT not //#10
`define NOR32 nor //#320
`define OR or //#30

`timescale 1ns/1ps
// *************defined gates from bitslice.v**************
//`define AND and #20
// `define OR or #20
// `define NOT not #10
// `define XOR xor #20
// `define AND3 and #30
// `define OR4 or #40

// `define ADD_ALU  3'd0
// `define SUB_ALU  3'd1
// `define XOR_ALU  3'd2
// `define SLT_ALU  3'd3
// `define AND_ALU  3'd4
// `define NAND_ALU 3'd5
// `define NOR_ALU  3'd6
// `define OR_ALU   3'd7
// *********************************************************


module ALU
(
output [31:0]  result,     // result
output        carryout,   // carryout bitstream
output        zero,       // returns 1 if the answer is all zeros, 0 other cases
output        overflow,   // overflow bitstream
input[31:0]   operandA,   // first input bitstream
input[31:0]   operandB,   // second input bitstream
input[2:0]    command     // 3 bits control signal
);

  wire notCommand1, notCommand2, subtract, slt, suborslt;
  wire[31:0] carryoutArray;

  // get the value of subtract
  `NOT notGate(notCommand1, command[1]);
  `NOT notGate2(notCommand2, command[2]);
  `AND3 andGate(subtract, command[0], notCommand1, notCommand2);
  `AND3 andGateslt(slt, command[0], command[1], notCommand2);
  `OR orGatesub(suborslt, subtract, slt);

  structuralBitSlice bitslice1(result[0], carryoutArray[0], command, operandA[0], operandB[0], suborslt);

  genvar i;
  generate
    for (i=1; i<32; i=i+1)
    begin:genblock
      structuralBitSlice bitslice1(result[i], carryoutArray[i], command, operandA[i], operandB[i], carryoutArray[i-1]);
    end
  endgenerate

  // always @(result) begin
  //   if(result == 32'dx)
  //     result <= 32'd0; 
  // end

  `XOR xorGate(overflow, carryoutArray[30], carryoutArray[31]);
  `AND1 andGate2(carryout, carryoutArray[31]);
  `NOR32 norGate(zero, result[0], result[1], result[2], result[3], result[4], result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16],result[17],result[18],result[19],result[20],result[21],result[22],result[23],result[24],result[25],result[26],result[27],result[28],result[29],result[30],result[31]);



endmodule




module signextend
(
  input [3:0] unextended,
  output [31:0] extended
);
    assign extended = {{28{unextended[3]}}, {unextended[3:0]}};

endmodule


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


module jkff4
(
    input trigger,
    input a,
    input b,
    input c,
    input d,
    output reg[3:0] out
);
    always @(posedge trigger) begin
        if(a) begin
            out <= 4'b0001;
        end
        else if(b) begin
            out <= 4'b0010;
        end
        else if(c) begin
            out <= 4'b0100;
        end
        else if(d) begin
            out <= 4'b1000;
        end
    end
endmodule

// Four-input MUX with parameterized 4 bit width
module mux4(

  input [3:0] input0, input1, input2, input3,  // inputs
  input [3:0]   addr,
  output[3:0] out

  );
  wire [3:0] out;

  assign out = ({4{addr[0]}} & input0) | ({4{addr[1]}} & input1) | ({4{addr[2]}} & input2) | ({4{addr[3]}} & input3) ;
endmodule


module AluTest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    output [3:0] led
);

    wire[3:0] res_sel;
    wire clk;
    wire[3:0] DataOut, OpInput, Num1short, Num2;
    wire carryout, zero, overflow;
    wire [31:0] operandA, Num1;     
    wire [31:0] operandB;      
    wire [2:0] command;       
    wire [31:0] result;


    ALU alu(
      .result(result),
      .carryout(carryout),
      .zero(zero),
      .overflow(overflow),
      .operandA(Num1),
      .operandB(32'd10),
      .command(3'b000)
    );

    signextend signext(.unextended(Num1short), .extended(Num1));

    jkff4 src_sel(.trigger(clk), .a(btn[0]), .b(btn[1]),  .c(btn[2]), .d(btn[3]), .out(res_sel));

    assign OpInput[0] = sw[0];
    assign OpInput[1] = sw[1];
    assign OpInput[2] = sw[2];
    assign OpInput[3] = sw[3];

    assign Num1short[0] = sw[0];
    assign Num1short[1] = sw[1];
    assign Num1short[2] = sw[2];
    assign Num1short[3] = sw[3];

    assign Num2[0] = sw[0];
    assign Num2[1] = sw[1];
    assign Num2[2] = sw[2];
    assign Num2[3] = sw[3];

    // Setting the output values
    assign DataOut[0] = result[0];
    assign DataOut[1] = result[1];
    assign DataOut[2] = result[2];
    assign DataOut[3] = result[3];


    mux4 output_select(.input0(Num1short), .input1(Num2), .input2(4'b0000), .input3(DataOut), .addr(res_sel),.out(led));

endmodule
