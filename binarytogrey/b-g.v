/////////////////////////////////////////
// Basil Skaria (20)                   // 
// S4 CSE                              //
// MITS                                // 
// Verilog codes of lab cycle          //
//                                     //
/////////////////////////////////////////
module bg ( din ,dout );

output [3:0] dout ;

input [3:0] din ;

assign dout[3] = din[3];
assign dout[2] = din[3]^din[2];
assign dout[1] = din[2]^din[1];
assign dout[0] = din[1]^din[0];

endmodule

module tb();

reg [3:0] din;
wire [3:0] dout;
bg aa (.din(din),.dout(dout));
initial begin
$dumpfile("bg.vcd");
$dumpvars;
$monitor("%b   %b",din,dout);

din=4'b0010;
#5
din=4'b0111;
end
endmodule


