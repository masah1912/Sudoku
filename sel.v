  1 `timescale 1ps/1ps
  2 
  3 module sel
  4 (
  5     input wire          sel,
  6     input wire [7:0]    in0,
  7     input wire [7:0]    in1,
  8     output reg [7:0]    out
  9 );
 10 
 11     always @(*) begin
 12         if(!sel) begin
 13             out = in0;
 14         end else begin
 15             out = in1;
 16         end
 17     end
 18 
 19 endmodule