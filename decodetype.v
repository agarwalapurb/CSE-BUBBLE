// Garvit Arora - 200372
// Apurb Agarwal - 200179
module decodetype(
    input wire [5:0] opcode,
    output reg [1:0] type
);

always @(*) begin
    if(opcode[5:0] == 0) begin
        type = 2'b00;       // R instruction
    end
    else begin
        if(opcode[5:0] >= 1 && opcode[5:0] <= 3) begin
            type = 2'b10;   // J instruction
        end
        else begin
            type = 2'b01;   // I instruction
        end
    end
end


endmodule