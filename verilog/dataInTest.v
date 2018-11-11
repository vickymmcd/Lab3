

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




module mux4to1(
    input[3:0]  address,
    input[3:0]  input0,
    input[3:0] input1,
    input[3:0] input2,
    input[3:0] input3,
    output reg[3:0] out
);

    always @* begin
         // Join single-bit inputs into a bus, use address as index
             if (address[0] == 1 && address[1]==0 && address[2] ==0 && address[3] === 0)
                assign out = input0;
            else if(address[0] == 0 && address[1]==1 && address[2] ==0 && address[3] === 0)
                assign out = input1;
            else if(address[0] === 0 && address[1]===0 && address[2] ===1 && address[3] === 0)
                assign out = input2;
            else
                assign out = input3;

    end

endmodule


// deliverable 5
module mux4to1by4(

  input [3:0] input0, input1, input2, input3,  // inputs
  input [3:0]   addr,
  output[3:0] out

  );
  wire [3:0] out;

  assign out = ({4{addr[0]}} & input0) | ({4{addr[1]}} & input1) | ({4{addr[2]}} & input2) | ({4{addr[3]}} & input3) ;
endmodule



// // Four-input MUX with parameterized 4 bit width
// module mux4
// (
//     input[3:0]    in0,
//     input[3:0]    in1,
//     input[3:0]    in2,
//     input[3:0]    in3,
//     input[3:0]    sel,
//     output[3:0]   out
// );
    


//     if(sel[0] == 1 && sel[1] == 0 && sel[2] == 0 && sel[3] == 0) begin
//         out <= in0;
//     end
//     else if(sel[0] == 0 && sel[1] == 1 && sel[2] == 0 && sel[3] == 0) begin
//          out <= in1;
//     end
//     else if(sel[0] == 0 && sel[1] == 0 && sel[2] == 1 && sel[3] == 0) begin
//          out <= in2;
//     end
//     else begin
//          out <= in3;
//     end
// endmodule




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


    mux4to1by4 output_select(.input0(OpInput), .input1(Data1Input), .input2(Data2Input), .input3(DataDisplay), .addr(btn),.out(led));


endmodule
