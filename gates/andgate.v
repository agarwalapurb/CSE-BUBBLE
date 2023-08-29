// Garvit Arora - 200372
// Apurb Agarwal - 200179
module andgate(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] out
);
integer i;
always @(*) begin
    for(i = 0; i<32; i=i+1) begin
        if(a[i]==1'b1 && b[i]==1'b1) begin
            out[i] = 1'b1;
        end
        else begin
            out[i] = 1'b0;
        end
    end
end


endmodule