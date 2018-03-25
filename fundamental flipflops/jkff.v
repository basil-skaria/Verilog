/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module jkff ( j ,k ,clk ,cl ,q ,nq );

output q ;
reg q ;
output nq ;
reg nq ;

input j ;
wire j ;
input k ;
wire k ;
input clk ;
wire clk ;
input cl ;
wire cl ;

always @ (posedge (clk)) begin
 if (cl) begin
  q <= 0;
  nq <= 1;
 end
 else begin
  if (j!=k) begin
   q <= j;
   nq <= k;
  end
  else if (j==1 && k==1) begin
   q <= ~q;
   nq <= ~nq;
  end
 end
end
 
endmodule

module tb();
reg clk=1;
reg j,k,cl;
wire q,nq;
jkff aa (.k(k),.j(j),.clk(clk),.cl(cl),.q(q),.nq(nq));
always #1 clk = ~clk;
initial begin
$dumpfile("jkff.vcd");
$dumpvars;
$display("j  k  q nq");
$monitor("%b  %b  %b  %b",j,k,q,nq);
cl=1'b1;
#1
cl=1'b0;
j=1'b0;k=1'b1;#2
#1
j=1'b1;k=1'b0;#2
#1
j=1'b0;k=1'b0;#2
#1
j=1'b1;k=1'b1;#2
#1
j=1'b0;k=1'b0;

$finish;
end
endmodule
