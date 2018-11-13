`include "cpu.v"


module alltest
(
    input        clk,
    input       reset,
    input  [3:0] sw,
    input  [3:0] btn,
    output reg [3:0] led
);

reg[31:0] address, dataIn, OpMod;
wire[31:0] dataOut, instructionOut;
reg writeEnable;

CPU cpu(.clk(clk), .reset(reset));

always @(posedge clk) begin
// Cases:
// Add = 0000
// ADDI = 0001
// SUB = 0010
// SLT = 0100
// XORI = 1000
// BNE = 0011
// BEQ = 0111
// JAL = 1111
// JR = 1000
// J = 1100
// SW = 1110
// LW = 0101


// Selects operation modes
if (btn[0] == 1) begin

  OpMod[0] <= sw[0];
  OpMod[1] <= sw[1];
  OpMod[2] <= sw[2];
  OpMod[3] <= sw[3];

  // case ADD 0000
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end

    instructionOut[31:26] <= 6'b000000;
    instructionOut[5:0] <= 6'h20;
    instructionOut[25:21] <= address[5:0];
    instructionOut[20:16] <= dataIn[5:0];
  end

  // case ADDI 0001
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 1)) begin

  // Instantiate ADDI
  // same as ADD except this time instead of using B to specify which register B is in, it simply specifies a numeric value between 0 and 32


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case SUB 0010
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 1) && (OpMod[3] == 0)) begin

  // Instantiate SUB
  //

    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case SLT 0100
  if ((OpMod[0] == 0) && (OpMod[1] == 1) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate SLT
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

  // case XORI 1000
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate XORI
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
    // case BNE 0011
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 1) && (OpMod[3] == 1)) begin

  // Instantiate BNE
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case ADD
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case ADD
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case ADD
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case ADD
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case ADD
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end

    // case ADD
  if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin

  // Instantiate ADD
  //button 2 specifies which register A is in using the values of the switches when the button is pressed and the same works for B when button 3 is pressed


    if (btn[1] == 1) begin
      address[0] <= sw[0];
      address[1] <= sw[1];
      address[2] <= sw[2];
      address[3] <= sw[3];
    end

    if (btn[2] == 1) begin
      dataIn[0] <= sw[0];
      dataIn[1] <= sw[1];
      dataIn[2] <= sw[2];
      dataIn[3] <= sw[3];
    end

    if (btn[3] == 1) begin
      led[0] <= dataOut[0];
      led[1] <= dataOut[1];
      led[2] <= dataOut[2];
      led[3] <= dataOut[3];
    end
  end



endmodule
