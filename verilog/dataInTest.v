

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
    input[3:0]    sel,
    output[3:0]   out
);
    


    if(sel[0] == 1 && sel[1] == 0 && sel[2] == 0 && sel[3] == 0) begin
        out <= in0;
    end
    else if(sel[0] == 0 && sel[1] == 1 && sel[2] == 0 && sel[3] == 0) begin
         out <= in1;
    end
    else if(sel[0] == 0 && sel[1] == 0 && sel[2] == 1 && sel[3] == 0) begin
         out <= in2;
    end
    else begin
         out <= in3;
    end
endmodule




module DataInTest
(
    input        clk,
    input  [3:0] sw,
    input  [3:0] btn,
    output [3:0] led
);

    wire[1:0] res_sel; // 00 = setting Op , 01 = setting data1, 10 = setting data2, 11 = veiwing result
    wire[3:0] Data1, Data2, Data1Input, Data2Input, DataDisplay, Op, OpInput;


    //jkff1 src_sel(.trigger(clk), .j(btn[1]), .k(btn[0]), .q(res_sel));

    
    assign OpInput[0] = sw[0];
    assign OpInput[1] = sw[1];
    assign OpInput[2] = sw[2];
    assign OpInput[3] = sw[3];

    assign Data1Input[0] = sw[0];
    assign Data1Input[1] = sw[1];
    assign Data1Input[2] = sw[2];
    assign Data1Input[3] = sw[3];

    assign Data2Input[0] = sw[0];
    assign Data2Input[1] = sw[1];
    assign Data2Input[2] = sw[2];
    assign Data2Input[3] = sw[3];


    mux4 output_select(.in0(OpInput), .in1(Data1Input), .in2(Data2Input), .in3(DataDisplay), .sel(btn),.out(led));


endmodule
