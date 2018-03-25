/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module m9(clk,reset,clk_out);
input clk,reset;
output [3:0] clk_out; 
reg[3:0] clk_out;
reg [3:0] counter;

always @(posedge clk )
begin

  if (reset)
    assign counter=4'd1;
  else
    assign counter=counter<<1;

assign clk_out=counter;
end
endmodule

module tb();
reg clk=0;
reg reset;
wire[3:0] clk_out;
integer i;
m9 aa (.clk(clk),.clk_out(clk_out),.reset(reset));

always #1 clk=~clk;
initial begin
$dumpfile("ring.vcd");
$dumpvars;
$monitor("%b",clk_out);
reset=0;#1
reset=1;#1
reset=0;
#100 $finish;
end
endmodule
