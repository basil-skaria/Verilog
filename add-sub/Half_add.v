/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module half_adder( a , b , sum , carry );
 
  input  a;
  input  b;
  output sum;
  output carry;
 
  assign sum   = a ^ b;  
  assign carry = a & b;  
 
endmodule 
 
module half_adder_tb;
 
  reg a = 0;
  reg b = 0;
  wire sum;
  wire carry;
   
  half_adder half_adder_inst( .a(a) , .b(b) , .sum(sum) , .carry(carry) );
 
  initial
    begin
$dumpfile("Half_add.vcd");
	$dumpvars;
	$display(" a | b |sum | carry");		
$monitor(" %b | %b | %b  | %b ",a,b,sum,carry);
	
	  #5
      a = 1'b0;
      b = 1'b0;
      #5;
      a = 1'b0;
      b = 1'b1;
      #5;
      a = 1'b1;
      b = 1'b0;
      #5;
      a = 1'b1;
      b = 1'b1;
      #5;
	  a = 1'b1;
      b = 1'b1;

    end 
 
endmodule 

