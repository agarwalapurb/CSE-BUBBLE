// Garvit Arora - 200372
// Apurb Agarwal - 200179
module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] c,
    output reg [31:0] out,
    output wire z,
    output wire f
);

wire [31:0] temp1;
wire [31:0] temp2;
wire [31:0] temp3;
wire temp4;
wire [31:0] temp5;
wire [31:0] temp6;
wire [31:0] temp7;
wire [31:0] temp8;
wire [31:0] temp9;

assign f = out[31];
zero zt(out, z);
andgate at(a, b, temp1);
orgate ot(a, b, temp2);
adder addt(a, b, 1'b0, temp3, temp4);
subtractor subt(a, b, temp5);
setlessthan sltt(a, b, temp6);
norgate nort(a, b, temp7);
shiftleftlogic sll(a, b, temp8);
shiftrightlogic srl(a, b, temp9);

always @(*) begin 
    case(c)
        0: out <= temp1;
        1: out <= temp2;
        2: out <= temp3;
        3: out <= temp8;
        4: out <= temp9;
        6: out <= temp5;
        7: out <= temp6;
        12: out <= temp7;
        default: out <= 0;
    endcase
end


endmodule
