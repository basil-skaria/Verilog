/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////   
module full_sub ( a ,b ,c ,sum,carry );

output sum ;
output carry ;

input a ;
input b ;
input c ;
   
assign diff = a ^ b ^ c;   
assign borrow = ((a)&b) | (b&c) | (c&(a));

endmodule

module sub_4bit ( a ,b ,carry ,sum );

output sum ;
output carry;

input a ;
input b ;

full_add u0 (a,b,1'b0,sum,carry);


endmodule


module tb_full_add;

     reg a;
	 reg b;
	 reg cin;
     wire sum;
	 wire cout;
sub_4bit uut (.a(a),.b(b),.sum(sum),.carry(carry));
     
initial begin
			 $dumpfile("Full_sub.vcd");
		 $dumpvars;
$display("  a   |  b   | sum | borrow");		
$monitor(" %b | %b | %b  | %b ",a,b,sum,carry);
a = 1'b0; b = 1'b0; #5
a = 1'b0; b = 1'b1; #5
a = 1'b1; b = 1'b1; #5
 

end
 
endmodule
