// Garvit Arora - 200372
// Apurb Agarwal - 200179
module subtractor(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out
);

wire [31:0] temp1;
wire temp2;

norgate nort(b, 0, temp1);
adder addt(a, temp1, 1'b1, out, temp2);


endmodule