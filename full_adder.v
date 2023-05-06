// Garvit Arora - 200372
// Apurb Agarwal - 200179
module full_adder(a,b,cin,s,cout,pout);

input a, b, cin;
output s, cout, pout;
wire t1, t2, t3;

xor(s,a,b,cin);
xor(pout,a,b);
xor(t1,a,b);
and(t2,a,b);
and(t3,t1,cin);
or(cout,t2,t3);

endmodule