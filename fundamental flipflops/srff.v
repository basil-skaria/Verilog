/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module srff ( s ,r ,clk ,cl ,q ,nq );

output q ;
reg q ;
output nq ;
reg nq ;

input s ;
wire s ;
input r ;
wire r ;
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
  if (s!=r) begin
   q <= s;
   nq <= r;
  end
  else if (s==1 && r==1) begin
   q <= 1'bZ;
   nq <= 1'bZ;
  end
 end
end  
  

endmodule

module tb();
reg clk=1;
reg r,s,cl;
wire q,nq;
srff aa (.r(r),.s(s),.clk(clk),.cl(cl),.q(q),.nq(nq));
always #1 clk = ~clk;
initial begin
$dumpfile("srff.vcd");
$dumpvars;
$display("s  r  q nq");
$monitor("%b  %b  %b  %b",s,r,q,nq);
cl=1'b1;
#1
cl=1'b0;
s=1'b0;r=1'b1;#2
#1
s=1'b1;r=1'b0;#2
#1
s=1'b0;r=1'b0;#2
#1
s=1'b1;r=1'b1;#2
#1
s=1'b0;r=1'b0;#2
#1
s=1'b1;r=1'b1;#2
#1
s=1'b1;r=1'b1;#2
#1
$finish;
end
endmodule
