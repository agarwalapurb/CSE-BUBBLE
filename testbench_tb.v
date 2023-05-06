// Garvit Arora - 200372
// Apurb Agarwal - 200179
// This is the testbench. Run this to execute the processor
`include "processor.v"

module testbench_tb;

reg clk;

processor uut(clk);

always begin
    #1 clk = ~clk;
end
 

initial begin
    clk <= 0;
    // #50; $finish;
end

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(1, testbench_tb);
end

endmodule