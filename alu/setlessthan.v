// Garvit Arora - 200372
// Apurb Agarwal - 200179
module setlessthan(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] out
);

wire [31:0] temp;
initial begin
    out <= 0;
end

subtractor subt(a, b, temp);

always @(temp) begin
    out[0] <= temp[31];
end


endmodule