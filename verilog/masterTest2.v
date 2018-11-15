`include "cpu.v"


module alltest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    output reg [3:0] led


);

reg[31:0] OpMod;
reg[15:0] immediate;
reg[5:0] opmode, functval;
wire[31:0] leddisplay;
reg buttonClk;

    CPU cpu(.clk(clk), .reset(1'b0), .opmode(opmode), .functval(functval), .immediate(immediate), .DataOut(leddisplay));

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


//// Selects operation modes
if (btn[0] == 1) begin

  OpMod[0] <= sw[0];
  OpMod[1] <= sw[1];
  OpMod[2] <= sw[2];
  OpMod[3] <= sw[3];
end

//// Select immediate value
if (btn[1] == 1) begin

  immediate[0] <= sw[0];
  immediate[1] <= sw[1];
  immediate[2] <= sw[2];
  immediate[3] <= sw[3];
end


if (btn[2] == 1) begin
    led[0] <=  immediate[0];
    led[1] <=  immediate[1];
    led[2] <=  immediate[2];
    led[3] <= immediate[3];

end

//// Setting the led's
//reset <= btn[2];

if (btn[3] == 1) begin
  //reset <= 6'b100000;
  //buttonClk <= 1'b1;
  led[0] <= leddisplay[0];
  led[1] <= leddisplay[1];
  led[2] <= leddisplay[2];
  led[3] <= leddisplay[3];
end


// case ADD 0000
if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin
  opmode <= 6'b000000;
  functval <= 6'h20;
end

// case ADDI 0001
if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 1)) begin
  opmode <= 6'b001000;
end

  // case SUB 0010
if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 1) && (OpMod[3] == 0)) begin
  opmode <= 6'b000000;
  functval <= 6'h22;
end

  // case SLT 0100
if ((OpMod[0] == 0) && (OpMod[1] == 1) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin
  opmode <= 6'b000000;
  functval <= 6'h2a;
end

// case XORI 1000
if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin
  opmode <= 6'b001110;
end
  // case BNE 0011
if ((OpMod[0] == 0) && (OpMod[1] == 0) && (OpMod[2] == 1) && (OpMod[3] == 1)) begin
  opmode <= 6'b000101;
end

// BEQ = 0111
if ((OpMod[0] == 0) && (OpMod[1] == 1) && (OpMod[2] == 1) && (OpMod[3] == 1)) begin
  opmode <= 6'b000100;
end

// JAL = 1111
if ((OpMod[0] == 1) && (OpMod[1] == 1) && (OpMod[2] == 1) && (OpMod[3] == 1)) begin
  opmode <= 6'b000011;
end

// JR = 1000
if ((OpMod[0] == 1) && (OpMod[1] == 0) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin
  opmode <= 6'b000000;
  functval <= 6'b001000;
end

// J = 1100
if ((OpMod[0] == 1) && (OpMod[1] == 1) && (OpMod[2] == 0) && (OpMod[3] == 0)) begin
  opmode <= 6'b000010;
end

// SW = 1110
if ((OpMod[0] == 1) && (OpMod[1] == 1) && (OpMod[2] == 1) && (OpMod[3] == 0)) begin
  opmode <= 6'b101011;
end

// LW = 0101
if ((OpMod[0] == 0) && (OpMod[1] == 1) && (OpMod[2] == 0) && (OpMod[3] == 1)) begin
  opmode <= 6'b100011;
end


end

endmodule
