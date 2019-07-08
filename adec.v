  1 `timescale 1ps/1ps
  2 
  3 module adec
  4 (
  5   input  wire [7:0] addr,
  6   output reg        mem_io
  7 );
  8 
  9   always @(*) begin
 10     if (addr == 8'hfb) begin
 11       mem_io = 1'b1;
 12     end else begin
 13       mem_io = 1'b0;
 14     end
 15   end
 16 
 17 endmodule