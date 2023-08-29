// Garvit Arora - 200372
// Apurb Agarwal - 200179
`include "gates/andgate.v"
`include "gates/orgate.v"
`include "gates/norgate.v"
`include "control/maincontrol.v"
`include "control/alucontrol.v"
`include "alu/alu.v"
`include "alu/zero.v"
`include "alu/subtractor.v"
`include "alu/adder.v"
`include "alu/full_adder.v"
`include "alu/setlessthan.v"
`include "alu/shiftleftlogic.v"
`include "alu/shiftrightlogic.v"
`include "veda.v"
`include "registers.v"
`include "updateaddress.v"
// This module integrates all the sub modules and builds the processor
module processor(
    input wire clk
);

reg [31:0] nextaddress;
wire [31:0] instructionaddress;
wire [31:0] address1;
wire [31:0] instruction;
reg [31:0] address2;
wire [31:0] address3;
wire [31:0] address6;
reg [31:0] address7;
wire zu;
wire fu;
reg [5:0] opcode;
reg [5:0] funct;
wire [2:0] aluop;
wire regDst;
wire regWrite;
wire alusrc;
wire memtoreg;
wire memread;
wire memwrite;
wire [2:0] branch;
wire branchf;
wire [1:0] jump;
reg [4:0] writeregister;
reg [4:0] writeregistertemp;
reg [4:0] readone;
reg [4:0] readonetemp;
reg [4:0] readtwo;
reg [31:0] writedata;
reg [31:0] writedatatemp;
wire [31:0] dataone;
wire [31:0] datatwo;
wire [3:0] alucontrolsignal;
wire chooseshift;
reg [31:0] signextendshift;
reg [31:0] signextendshifttemp;
reg [31:0] aluinone;
reg [31:0] aluintwo;
wire [31:0] aluout;
wire zl;
wire fl;
wire [31:0] memorydata;
reg tempbranch;
wire t1;
wire t2;
wire t3;
wire t4;
wire t5;
wire t6;
reg [31:0] address4;
wire [31:0] address5;
wire zuu;
wire fuu;

// reg [31:0] intra;

initial begin
    nextaddress <= 0;
end

alu uut0(instructionaddress, 4, 4'b0010, address1, zuu, fuu);
// update the instruction address (program counter)
updateaddress uut1(clk, nextaddress, instructionaddress);
// read or write data from the data memory and read the instruction from instruction memory
veda uut2(instructionaddress, instruction, clk, memwrite, memread, datatwo, aluout, memorydata);
// used to stop execution of the program
always @(*) begin
    if(instruction==32'b000000_00000_00000_00000_00000000000) begin
        $display("Time: ", $time);
        $finish;
    end
end
// sign extend
always @(*) begin
    address2[15:0] <= instruction[15:0];
    if (instruction[15]==1'b0)begin
        address2[31:16] <= 16'b0000000000000000;
    end
    else begin
        address2[31:16] <= 16'b1111111111111111;
    end
end

shiftleftlogic sll1(address2, 2, address6);

alu uut3(address1, address6, 4'b0010, address3, zu, fu);  //upper alu output

always @(*) begin
    opcode <= instruction[31:26];
    funct <= instruction[5:0];
end

maincontrol uut4(opcode, aluop, regDst, regWrite, alusrc, memtoreg, memread, memwrite, branch, branchf, jump);

always @(*) begin
    if (regDst==1'b0) begin
        writeregistertemp <= instruction[20:16];
    end
    else begin
        writeregistertemp <= instruction[15:11];
    end
    readonetemp <= instruction[25:21];
    readtwo <= instruction[20:16];
end
always @(*) begin
    if (jump==2'b11) begin
        writeregister <= 31;
    end
    else begin
        writeregister <= writeregistertemp;
    end
end
always @(*) begin
    if (jump==2'b10) begin
        readone <= 31;
    end
    else begin
        readone <= readonetemp;
    end
end
always @(*) begin
    signextendshift[31:5] <= 0;
    signextendshift[4:0] <= instruction[10:6];
end

registers uut5(clk, readone, readtwo, writeregister, writedata, regWrite, dataone, datatwo);
alucontrol uut6(aluop, funct, alucontrolsignal, chooseshift);
always @(*) begin
    aluinone <= dataone;
    if(alusrc==1'b0) begin
        signextendshifttemp <= datatwo;
    end
    else begin
        signextendshifttemp <= address2;
    end
end
always @(*) begin
    if(chooseshift==1'b0) begin
        aluintwo <= signextendshifttemp;
    end
    else begin
        aluintwo <= signextendshift;
    end
end
alu uut7(aluinone, aluintwo, alucontrolsignal, aluout, zl, fl);
always @(*) begin
    if(memtoreg==1'b0)begin
        writedatatemp <= aluout;
    end
    else begin
        writedatatemp <= memorydata;
    end
end
always @(*) begin
    if(jump==2'b11) begin
        writedata <= address1;
    end
    else begin
        writedata <= writedatatemp;
    end
end


not(t1, zl);
not(t2, fl);
and(t3, t1, t2);
and(t4, t1, fl);
xor(t5, zl, fl);

always @(*) begin
    if(branch==0)
        tempbranch <= zl;
    else if (branch==1)
        tempbranch <= t1;
    else if (branch==2)
        tempbranch <= t3;
    else if (branch==3)
        tempbranch <= t2;
    else if (branch==4)
        tempbranch <= t4;
    else if (branch==5)
        tempbranch <= t5;
end

and(t6, tempbranch, branchf);

always @(*) begin
    if(t6==1) begin
        address4 <= address3;
    end
    else begin
        address4 <= address1;
    end
end

always @(*) begin
    address7[25:0] <= instruction[25:0];
    address7[31:26] <= 6'b000000;
end

shiftleftlogic sll2(address7, 2, address5);

always @(*) begin
    if(jump==0)
        nextaddress <= address4;
    else if(jump==1)
        nextaddress <= address5;
    else if(jump==2)
        nextaddress <= dataone;
    else if(jump==3)
        nextaddress <= address5;
end

endmodule