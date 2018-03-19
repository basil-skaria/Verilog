module demux (s0,s1,I,en,y0,y1,y2,y3);
input s0,s1,I,en;
output y0,y1,y2,y3;
assign y0=(~s0)&(~s1)& I& en;
assign y1=(~s0)& s1& I& en;
assign y2=s0&(~s1)& I & en;
assign y3=s0& s1 & I & en;
endmodule

module tb();
reg s0,s1,I,en;
wire y0,y1,y2,y3;
demux aa (.y0(y0),.y1(y1),.y2(y2),.y3(y3),.I(I),.en(en),.s1(s0),.s0(s1));
initial begin
$dumpfile("demux.vcd");
$dumpvars;
$display("y0 | y1 | y2 | y3 | s1 | s2 | en | I");
$display("____________________________________");
$monitor("%b  | %b  | %b  | %b  | %b  | %b  | %b  | %b",y0,y1,y2,y3,s1,s0,en,I);

I=1'b1;en=1'b0;s1=1'b0;s0=1'b0;
#1
I=1'b1;en=1'b0;s1=1'b0;s0=1'b1;
#1
I=1'b1;en=1'b0;s1=1'b1;s0=1'b0;
#1
I=1'b1;en=1'b0;s1=1'b1;s0=1'b1;
#1
I=1'b0;en=1'b0;s1=1'b0;s0=1'b0;
#1
I=1'b0;en=1'b0;s1=1'b0;s0=1'b1;
#1
I=1'b0;en=1'b0;s1=1'b1;s0=1'b0;
#1
I=1'b0;en=1'b0;s1=1'b1;s0=1'b1;
#1
I=1'b1;en=1'b1;s1=1'b0;s0=1'b0;
#1
I=1'b1;en=1'b1;s1=1'b0;s0=1'b1;
#1
I=1'b1;en=1'b1;s1=1'b1;s0=1'b0;
#1
I=1'b1;en=1'b1;s1=1'b1;s0=1'b1;
#1
I=1'b0;en=1'b1;s1=1'b0;s0=1'b0;
#1
I=1'b0;en=1'b1;s1=1'b0;s0=1'b1;
#1
I=1'b0;en=1'b1;s1=1'b1;s0=1'b0;
#1
I=1'b0;en=1'b1;s1=1'b1;s0=1'b1;

$finish;
end
endmodule
