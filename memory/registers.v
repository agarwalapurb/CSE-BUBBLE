// Garvit Arora - 200372
// Apurb Agarwal - 200179
// This is the register file which stores the 32 registers for the processor on which computations happen
module registers(
    input wire clk,
    input [4:0] readone,
    input [4:0] readtwo,
    input [4:0] writeregister,
    input [31:0] writedata,
    input wire regwrite,
    output reg [31:0] dataone,
    output reg [31:0] datatwo
);

reg [31:0] mem [0:31];

initial begin
    mem [0] <= 0;
    mem [8] <= 0;
    mem [5] <= 4;
    mem [29] <= 1020;
    mem [31] <= 100;
end


always @(*) begin
    dataone <= mem[readone];
    datatwo <= mem[readtwo];
    
    
end

always @(negedge clk) begin
    if (regwrite==1)
        mem[writeregister] <= writedata;
    
end

endmodule