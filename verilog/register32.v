// 32-bit D Flip-Flop with enable
// Positive edge triggered
`include "register.v"

module register32
(
output reg[31:0]	q,
input[31:0]		d,
input		wrenable,
input		clk
);
	genvar i;
	generate
		for(i=0; i<32; i=i+1)
		begin:genblock
			always @(posedge clk) begin
			    if(wrenable) begin
			        q[i] <= d[i];
			    end
			end
		end
	endgenerate
endmodule


 //  //register register(output[0], input[0], wrenable, clk);
 //  reg32Z register32zero(.q(qZ),.d(d), .wrenable(wrenable), .clk(clk));
 //  assign output[0] = qZ; 
 //   	//output[31:0]	q,
	// // input[31:0]		d,
	// // input		wrenable,
	// // input		clk

 //  genvar i;
 //  generate
 //    for (i=1; i<32; i=i+1)
 //    begin:genblock
 //      register register(output[i], input[i], wrenable, clk);
 //    end
 //  endgenerate