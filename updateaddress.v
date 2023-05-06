// Garvit Arora - 200372
// Apurb Agarwal - 200179
// update the instruction address (program counter)
module updateaddress(
    input clk,
    input [31:0] nextaddress,
    output reg [31:0] address
);

always @(posedge clk) begin
    address <= nextaddress;
end

endmodule