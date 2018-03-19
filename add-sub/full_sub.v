   
module full_sub ( a ,b ,c ,diff,borrow );

output diff ;
output borrow ;

input a ;
input b ;
input c ;
   
assign diff = a ^ b ^ c;   
assign borrow = ((~a)&b) | (b&c) | (c&(~a));

endmodule

module sub_4bit ( a ,b ,borrow ,diff );

output diff ;
output borrow;

input a ;
input b ;

full_add u0 (a,b,1'b0,diff,borrow);


endmodule


module tb_full_add;

     reg a;
	 reg b;
	 reg cin;
     wire diff;
	 wire cout;
sub_4bit uut (.a(a),.b(b),.diff(diff),.borrow(borrow));
     
initial begin
			 $dumpfile("Full_sub.vcd");
		 $dumpvars;
$display("  a   |  b   | diff | borrow");		
$monitor(" %b | %b | %b  | %b ",a,b,diff,borrow);
a = 1'b0; b = 1'b0; #5
a = 1'b0; b = 1'b1; #5
a = 1'b1; b = 1'b1; #5
 

end
 
endmodule
