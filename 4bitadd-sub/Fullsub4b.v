   
module full_sub ( a ,b ,c ,diff ,borrow );

output diff ;
output borrow ;

input a ;
input b ;
input c ;
   
assign diff = a ^ b ^ c;   
assign borrow = ((~a)&b) | (b&c) | (c&(~a));

endmodule

module sub_4bit ( a ,b ,diff ,borrow );

output [3:0] diff ;
output borrow ;

input [3:0] a ;
input [3:0] b ; 

wire [2:0]s;

full_sub u0 (a[0],b[0],1'b0,diff[0],s[0]);
full_sub u1 (a[1],b[1],s[0],diff[1],s[1]);
full_sub u2 (a[2],b[2],s[1],diff[2],s[2]);
full_sub u3 (a[3],b[3],s[2],diff[3],borrow);

endmodule


module tb_full_sub;

     reg [3:0]a;
	 reg [3:0]b;
	 reg cin;
     wire [3:0]diff;
	 wire [3:0]cout;
sub_4bit uut (.a(a),.b(b),.diff(diff),.borrow(borrow));
     
initial begin
			 $dumpfile("Full_sub.vcd");
		 $dumpvars;
$display("  a   |  b   | diff | borrow");		
$monitor(" %b | %b | %b  | %b ",a,b,diff,borrow);
a = 0; b = 0; #5
a = 0; b = 1; #5
a = 0; b = 2; #5
a = 0; b = 3; #5
a = 0; b = 4; #5
a = 0; b = 5; #5
a = 0; b = 6; #5
a = 0; b = 7; #5

a = 1; b = 0; #5
a = 1; b = 1; #5
a = 1; b = 2; #5
a = 1; b = 3; #5
a = 1; b = 4; #5
a = 1; b = 5; #5
a = 1; b = 6; #5
a = 1; b = 7; #5

a = 2; b = 0; #5
a = 2; b = 1; #5
a = 2; b = 2; #5
a = 2; b = 3; #5
a = 2; b = 4; #5
a = 2; b = 5; #5
a = 2; b = 6; #5
a = 2; b = 7; #5

a = 3; b = 0; #5
a = 3; b = 1; #5
a = 3; b = 2; #5
a = 3; b = 3; #5
a = 3; b = 4; #5
a = 3; b = 5; #5
a = 3; b = 6; #5
a = 3; b = 7; #5

a = 4; b = 0; #5
a = 4; b = 1; #5
a = 4; b = 2; #5
a = 4; b = 3; #5
a = 4; b = 4; #5
a = 4; b = 5; #5
a = 4; b = 6; #5
a = 4; b = 7; #5
a = 4; b = 8; #5
a = 4; b = 9; #5

a = 5; b = 0; #5
a = 5; b = 1; #5
a = 5; b = 2; #5
a = 5; b = 3; #5
a = 5; b = 4; #5
a = 5; b = 5; #5
a = 5; b = 6; #5
a = 5; b = 7; #5
a = 5; b = 8; #5
a = 5; b = 9; #5
a = 6; b = 0; #5
a = 6; b = 1; #5
a = 6; b = 2; #5
a = 6; b = 3; #5
a = 6; b = 4; #5
a = 6; b = 5; #5
a = 6; b = 6; #5
a = 6; b = 7; #5
a = 6; b = 8; #5
a = 6; b = 9; #5
a = 7; b = 0; #5
a = 7; b = 1; #5
a = 7; b = 2; #5
a = 7; b = 3; #5
a = 7; b = 4; #5
a = 7; b = 5; #5
a = 7; b = 6; #5
a = 7; b = 7; #5
a = 7; b = 8; #5
a = 7; b = 9; 

end
 
endmodule
