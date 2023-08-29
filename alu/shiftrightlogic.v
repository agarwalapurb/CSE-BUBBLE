// Garvit Arora - 200372
// Apurb Agarwal - 200179

module shiftrightlogic(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] z
);


always @(*) begin
    z <= a>>>b;
end
endmodule