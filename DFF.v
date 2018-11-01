module DFF 
#( parameter width = 32 )(
    input clk,
    input enable,
    input      [width-1:0] in,
    output reg [wdith-1:0] out
);
    always @(posedge clk) begin
        if(enable) begin
            out <= in;
        end
        else begin
            out <= 0;
        end
    end
endmodule