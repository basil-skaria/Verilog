module Two_b_comp(x,y,a,b,eq,gt,ls);
    output eq,gt,ls;
    input a,b,x,y;
    not n1(x1,x);not nn(y1,y);
    and g1(a1,a,x1);
    xnor g3(xno1,a,x);
    and g2(a2,b,y1,xno1);
    or g4(gt,a2,a1);
    xnor g5(a3,a,x);
    xnor g6(a4,b,y);
    and g7(eq,a3,a4);
    nor g8(ls,eq,gt);
endmodule
	
	
module tb_tm;
	
	reg a,b;
	reg x,y;
	
	wire ls;
	wire eq;
	wire gt;
	
	Two_b_comp uut (.a(a),.b(b),.x(x),.y(y),.ls(ls),.eq(eq),.gt(gt));
	initial begin
		$dumpfile("Comparator.vcd");
		$dumpvars;
		$display("ab | xy |A>B|A=B|A<B");	
		$monitor("%b%b | %b%b | %b | %b | %b",a,b,x,y,gt,eq,ls);
		
		
a=0;b=0;x=0;y=0;#5
a=0;b=0;x=0;y=1;#5
a=0;b=0;x=1;y=0;#5
a=0;b=0;x=1;y=1;#5
a=0;b=1;x=0;y=0;#5
a=0;b=1;x=0;y=1;#5
a=0;b=1;x=1;y=0;#5
a=0;b=1;x=1;y=1;#5
a=1;b=0;x=0;y=0;#5
a=1;b=0;x=0;y=1;#5
a=1;b=0;x=1;y=0;#5
a=1;b=0;x=1;y=1;#5
a=1;b=1;x=0;y=0;#5
a=1;b=1;x=0;y=1;#5
a=1;b=1;x=1;y=0;#5
a=1;b=1;x=1;y=1;#5
a=1;b=1;x=1;y=1;



	end
endmodule
