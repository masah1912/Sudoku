  1 `timescale 1ps/1ps
  2 
  3 module synqrst
  4 (
  5   input  wire clk,
  6   input  wire asynq_rst_n,
  7   output wire synq_rst_n
  8 );
  9   reg [2:0] synq = 3'b000;
 10 
 11   always @(posedge clk) begin
 12     synq[2] <= synq[1];
 13     synq[1] <= synq[0];
 14     synq[0] <= asynq_rst_n;
 15   end
 16   assign synq_rst_n = synq[2];
 17 
 18 endmodule