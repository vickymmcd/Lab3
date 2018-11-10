


module OpTest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    output [3:0] led
);

    //wire res_sel;             // 0 = setting operation , 1 = setting data
    wire clk;
    wire[3:0] Op;


    // Setting the 
    assign Op[0] = sw[0];
    assign Op[1] = sw[1];
    assign Op[2] = sw[2];
    assign Op[3] = sw[3];

    //Setting the led's
    assign led[0] = Op[0];
    assign led[1] = Op[1];
    assign led[2] = Op[2];
    assign led[3] = Op[3];



endmodule
