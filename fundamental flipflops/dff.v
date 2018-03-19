module dflipflop(q, d, clk);
output q;
input d;
input clk;
reg q;
always @(posedge clk)
q = d;
endmodule

module tb();
reg clk=0;
reg d;
wire q;
dflipflop aa (.d(d),.q(q),.clk(clk));
always #1 clk = ~clk;
initial begin
$dumpfile("dff.vcd");
$dumpvars;
$monitor("%b   %b",d,q);

d=1'b0;
#6
d=1'b1;
$finish;
end
endmodule
