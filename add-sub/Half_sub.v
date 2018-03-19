module half_substractor( a , b , difference , borrow );
 
  input  a;
  input  b;
  output difference;
  output borrow;
 
  assign difference   = a ^ b;  
  assign borrow = a & ~b;  
 
endmodule 
 
module half_substractor_tb;
 
  reg a = 0;
  reg b = 0;
  wire difference;
  wire borrow;
   
  half_substractor half_substractor_inst( .a(a) , .b(b) , .difference(difference) , .borrow(borrow) );
 
  initial
    begin
	$dumpfile("Half_sub.vcd");
	$dumpvars;
	$display(" a | b |diff| borrow");		
	$monitor(" %b | %b | %b  | %b ",a,b,difference,borrow);
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

