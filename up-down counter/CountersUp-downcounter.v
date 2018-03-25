/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module updown(clk,clr,up,q);
input clk,clr,up;
output [3:0] q;
reg [3:0] q;

always@(posedge clear or posedge clk)

begin
  if(clear)
    q <=4’b0000;
  else if(up)
    q <= q+1’b1;
  else
    q <= q-1’b1;
end
endmodule

module tb;

  reg clk;
  reg clr;
  reg up;
  wire [3:0] q;
  updown uut (.clk(clk),.clr(clr),.up(up),.q(q));

  initial begin
    clk = 0;
    clr = 0;
    up = 0;
    #5 clr=1’b1;
    #5 clr=1’b0;
    #100 up=1’b1;
   end
always #5 clk=~clk;
#150 $finish;
endmodule
