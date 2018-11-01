// 32-bit D Flip-Flop with enable outputs zero

module register32zero
#(parameter VAL=0, WID=32)
(
output reg[WID-1:0]	q,
input[WID-1:0]		d,
input		wrenable,
input		clk
);
	genvar i;
	generate
		for(i=0; i<WID; i=i+1)
		begin:genblock
			always @(posedge clk) begin
			    if(wrenable) begin
			        q[i] <= VAL;
			    end
			end
		end
	endgenerate
endmodule