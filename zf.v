  1 `timescale 1ps/1ps
  2 
  3 module zf(clk, rst_n, zf_in, zf_out);
  4     input clk, rst_n;
  5     input zf_in;
  6     output zf_out;
  7     reg zf_out;
  8 
  9     always @(posedge clk) begin
 10         if(rst_n == 0) begin
 11             zf_out  <= 0;
 12         end else begin
 13             zf_out  <= zf_in;
 14         end
 15     end
 16 endmodule