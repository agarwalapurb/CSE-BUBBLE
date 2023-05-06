// Garvit Arora - 200372
// Apurb Agarwal - 200179

module adder #(parameter B = 32) (a,b,cin,s,cout);

input [B-1:0] a;
input [B-1:0] b;
input cin;
output [B-1:0] s;
output cout;
wire [B-1:0] c;
wire [B-1:0] t1;
wire [B-1:0] t2;
genvar i;
for(i=0;i<B;i=i+1) begin
    if(i==0)begin
        full_adder add(a[i],b[i],cin,s[i],c[i],t1[i]);
        assign t2[i]=t1[i];
    end
    else begin
        full_adder add(a[i],b[i],c[i-1],s[i],c[i],t1[i]);
        and(t2[i],t2[i-1],t1[i]);
    end
end
assign cout = t2[B-1] ? cin : c[B-1];

endmodule