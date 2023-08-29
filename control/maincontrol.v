// Garvit Arora - 200372
// Apurb Agarwal - 200179
module maincontrol(
    input [5:0] opcode,
    output reg [2:0] aluop,
    output reg regDst,
    output reg regWrite,
    output reg alusrc,
    output reg memtoreg,
    output reg memread,
    output reg memwrite,
    output reg [2:0] branch,
    output reg branchf,
    output reg [1:0] jump        
);


always @(*) begin
    if(opcode == 0) begin
        aluop <= 3'b010;
        regDst <= 1'b1;
        regWrite <= 1'b1;
        alusrc <= 1'b0;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else if (opcode==1) begin
        aluop <= 3'b000;
        regDst <= 1'b0;
        regWrite <= 1'b0;
        alusrc <= 1'b0;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b01;
    end
    else if (opcode==2) begin
        aluop <= 3'b000;
        regDst <= 1'b0;
        regWrite <= 1'b0;
        alusrc <= 1'b0;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b10;
    end
    else if (opcode==3) begin
        aluop <= 3'b000;
        regDst <= 1'b0;
        regWrite <= 1'b1;
        alusrc <= 1'b0;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b11;
    end
    else if (opcode==4 || opcode==5) begin
        aluop <= 3'b000;
        regDst <= 1'b0;
        regWrite <= 1'b1;
        alusrc <= 1'b1;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else if (opcode==6) begin
        aluop <= 3'b011;
        regDst <= 1'b0;
        regWrite <= 1'b1;
        alusrc <= 1'b1;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else if (opcode==7) begin
        aluop <= 3'b100;
        regDst <= 1'b0;
        regWrite <= 1'b1;
        alusrc <= 1'b1;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else if (opcode==8) begin
        aluop <= 3'b000;
        regDst <= 1'b0;
        regWrite <= 1'b1;
        alusrc <= 1'b1;
        memtoreg <= 1'b1;
        memread <= 1'b1;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else if (opcode==9) begin
        aluop <= 3'b000;
        regDst <= 1'b0;
        regWrite <= 1'b0;
        alusrc <= 1'b1;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b1;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else if (opcode>=10 && opcode<=15) begin
        aluop <= 3'b001;
        regDst <= 1'b0;
        regWrite <= 1'b0;
        alusrc <= 1'b0;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch = opcode - 10;
        branchf <= 1'b1;
        jump <= 2'b00;
    end
    else if (opcode==16) begin
        aluop <= 3'b001;
        regDst <= 1'b0;
        regWrite <= 1'b1;
        alusrc <= 1'b1;
        memtoreg <= 1'b0;
        memread <= 1'b0;
        memwrite <= 1'b0;
        branch <= 3'b000;
        branchf <= 1'b0;
        jump <= 2'b00;
    end
    else begin
        jump <= 2'b00;
        branch <= 3'b000;
        branchf <= 1'b0;
    end
end
endmodule