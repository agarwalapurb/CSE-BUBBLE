// Garvit Arora - 200372
// Apurb Agarwal - 200179
module alucontrol(
    input [2:0] a,
    input [5:0] b,
    output reg [3:0] c,
    output reg chooseshift
);

always @(*) begin
    if (a==2) begin
        if (b==0) begin
            c <= 4'b0010;
            chooseshift <= 1'b0;
        end
        else if (b==1) begin
            c <= 4'b0110;
            chooseshift <= 1'b0;
        end
        else if (b==2) begin
            c <= 4'b0010;
            chooseshift <= 1'b0;
        end
        else if (b==3) begin
            c <= 4'b0110;
            chooseshift <= 1'b0;
        end
        else if (b==4) begin
            c <= 4'b0000;
            chooseshift <= 1'b0;
        end
        else if (b==5) begin
            c <= 4'b0001;
            chooseshift <= 1'b0;
        end
        else if (b==6) begin
            c <= 4'b0011;
            chooseshift <= 1'b1;
        end
        else if (b==7) begin
            c <= 4'b0100;
            chooseshift <= 1'b1;
        end
        else if (b==8) begin
            c <= 4'b0111;
            chooseshift <= 1'b0;
        end
    end
    else if (a==0) begin
        c <= 4'b0010;
        chooseshift <= 1'b0;
    end
    else if (a==1) begin
        c <= 4'b0110;
        chooseshift <= 1'b0;
    end
    else if (a==3) begin
        c <= 4'b0000;
        chooseshift <= 1'b0;
    end
    else if (a==4) begin
        c <= 4'b0001;
        chooseshift <= 1'b0;
    end
end


endmodule