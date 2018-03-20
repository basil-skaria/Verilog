module SIPO ( din ,clk ,reset ,dout );

output [3:0] dout ;
wire [3:0] dout ;

input din ;
wire din ;
input clk ;
wire clk ;
input reset ;
wire reset ;
reg [3:0]s;

always @ (posedge (clk)) begin 
 if (reset)
  s <= 0;
 else begin
  s[3] <= din;
  s[2] <= s[3];
  s[1] <= s[2];
  s[0] <= s[1];
 end
end
assign dout = s;
endmodule

module tb();
	reg din, clk=0,reset;
	wire [3:0] dout;
	SIPO uut (.din(din),.dout(dout),.clk(clk),.reset(reset));
	always #1 clk=~clk;
	initial begin
		$dumpfile("sipo.vcd");
		$dumpvars;
		$display("din | dout");
		$monitor("%b   | %b",din,dout);
		reset=1'b0;#1
		reset=1'b1;#1
		reset=1'b0;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
		din=1'b1;#1
#20 $finish;
	end
endmodule
		
