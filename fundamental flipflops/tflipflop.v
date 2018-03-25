module tflipflop(q, t, clk);
output q;
input t;
input clk;
reg q;
always @(posedge clk)
q = ~t;
endmodule

module tb();
reg clk=0;
reg t;
wire q;
dflipflop aa (.t(t),.q(q),.clk(clk));
always #1 clk = ~clk;
initial begin
$dumpfile("tff.vcd");
$dumpvars;
$monitor("%b   %b",t,q);

t=1'b0;
#6
t=1'b1;
$finish;
end
endmodule
