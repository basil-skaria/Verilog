module mux (s0,s1,I,en,y0,y1,y2,y3);
input s0,s1,y0,y1,y2,y3,en;
output I;
reg I;
always @(en) 

assign I=((~s1)&(~s0)&y0)|((s1)&(~s0)&y1)|((~s1)&(s0)&y2)|((s0)&(s0)&y3);

endmodule

module tb();
wire I;
reg s0,s1,en;
reg y0,y1,y2,y3;
mux aa (.y0(y0),.y1(y1),.y2(y2),.y3(y3),.I(I),.en(en),.s1(s0),.s0(s1));
initial begin
$dumpfile("mux.vcd");
$dumpvars;
$display("y0 | y1 | y2 | y3 | s1 | s2 | en | I");
$display("____________________________________");
$monitor("%b  | %b  | %b  | %b  | %b  | %b  | %b  | %b",y0,y1,y2,y3,s1,s0,en,I);

y0=1'b0;y1=1'b0;y2=1'b0;y3=1'b0;en=1'b0;s1=1'b0;s0=1'b0;
#1
y0=1'b0;y1=1'b0;y2=1'b0;y3=1'b1;en=1'b0;s1=1'b0;s0=1'b1;
#1
y0=1'b0;y1=1'b0;y2=1'b1;y3=1'b0;en=1'b0;s1=1'b1;s0=1'b0;
#1
y0=1'b0;y1=1'b0;y2=1'b1;y3=1'b1;en=1'b0;s1=1'b1;s0=1'b1;
#1
y0=1'b0;y1=1'b1;y2=1'b0;y3=1'b0;en=1'b0;s1=1'b0;s0=1'b0;
#1
y0=1'b0;y1=1'b1;y2=1'b0;y3=1'b1;en=1'b0;s1=1'b0;s0=1'b1;
#1
y0=1'b0;y1=1'b1;y2=1'b1;y3=1'b0;en=1'b0;s1=1'b1;s0=1'b0;
#1
y0=1'b0;y1=1'b1;y2=1'b1;y3=1'b1;en=1'b0;s1=1'b1;s0=1'b1;
#1
y0=1'b1;y1=1'b0;y2=1'b0;y3=1'b0;en=1'b1;s1=1'b0;s0=1'b0;
#1
y0=1'b1;y1=1'b0;y2=1'b0;y3=1'b1;en=1'b1;s1=1'b0;s0=1'b1;
#1
y0=1'b1;y1=1'b0;y2=1'b1;y3=1'b0;en=1'b1;s1=1'b1;s0=1'b0;
#1
y0=1'b1;y1=1'b0;y2=1'b1;y3=1'b1;en=1'b1;s1=1'b1;s0=1'b1;
#1
y0=1'b1;y1=1'b1;y2=1'b0;y3=1'b0;en=1'b1;s1=1'b0;s0=1'b0;
#1
y0=1'b1;y1=1'b1;y2=1'b0;y3=1'b1;en=1'b1;s1=1'b0;s0=1'b1;
#1
y0=1'b1;y1=1'b1;y2=1'b1;y3=1'b0;en=1'b1;s1=1'b1;s0=1'b0;
#1
y0=1'b1;y1=1'b1;y2=1'b1;y3=1'b1;en=1'b1;s1=1'b1;s0=1'b1;

$finish;
end
endmodule
