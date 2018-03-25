/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module full_add ( a ,b ,c ,sum1,carry );

output sum1 ;
output carry ;

input a ;
input b ;
input c ;
   
assign sum1 = a ^ b ^ c;   
assign carry = ((a)&b) | (b&c) | (c&(a));

endmodule

module add_4bit ( a ,b ,carry ,sum1 );

output [3:0] sum1 ;
output carry;

input [3:0] a ;
input [3:0] b ; 

wire [2:0]s;

full_add u0 (a[0],b[0],1'b0,sum1[0],s[0]);
full_add u1 (a[1],b[1],s[0],sum1[1],s[1]);
full_add u2 (a[2],b[2],s[1],sum1[2],s[2]);
full_add u3 (a[3],b[3],s[2],sum1[3],carry);

endmodule


module tb_full_add;

     reg [3:0]a;
	 reg [3:0]b;
	 reg cin;
     wire [3:0]sum1;
	 wire carry;
add_4bit uut (.a(a),.b(b),.sum1(sum1),.carry(carry));
     
initial begin
			 $dumpfile("Full_sub.vcd");
		 $dumpvars;
$display("  a   |  b   | sum | carry");		
$monitor(" %b | %b | %b  | %b ",a,b,sum1,carry);
a = 0; b = 0; #5
a = 9; b = 2; #5
a = 8; b = 5; #5
a = 9; b = 9;

end
 
endmodule
