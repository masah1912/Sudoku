  1 `timescale 1ps/1ps
  2 
  3 module pc
  4 (
  5     input wire  clk,
  6     input wire  rst_n,
  7     input wire[7:0] pc_in,
  8     output reg[7:0] pc_out
  9 );
 10 
 11     always @(posedge clk) begin
 12         if(!rst_n) begin
 13             pc_out <= 0;
 14         end else begin
 15             pc_out <= pc_in;
 16         end
 17     end
 18 
 19 endmodule