  1 `timescale 1ps/1ps
  2 
  3 module led
  4 (
  5   input  wire        clk,
  6   input  wire        rst_n,
  7   input  wire        we,
  8   input  wire [7:0]  in,
  9   input  wire [7:0]  addr,
 10   output reg  [11:0] led
 11 );
 12 
 13   reg [7:0]  mem [3:0];
 14   reg [13:0] cnt;
 15 
 16   always @(posedge clk) begin
 17     if (!rst_n) begin
 18       mem[0] <= 8'b0;
 19       mem[1] <= 8'b0;
 20       mem[2] <= 8'b0;
 21       mem[3] <= 8'b0;
 22       cnt    <= 14'b0;
 23       led    <= 12'b0;
 24     end else begin
 25       cnt <= cnt + 1;
 26       if (we) begin
 27         case (addr)
 28           8'hfc : mem[0] <= in;
 29           8'hfd : mem[1] <= in;
 30           8'hfe : mem[2] <= in;
 31           8'hff : mem[3] <= in;
 32         endcase
 33       end
 34       if (!cnt[11:0]) begin
 35         case (cnt[13:12])
 36           2'b00 : led <= {4'b1110, mem[0]};
 37           2'b01 : led <= {4'b1101, mem[1]};
 38           2'b10 : led <= {4'b1011, mem[2]};
 39           2'b11 : led <= {4'b0111, mem[3]};
 40         endcase
 41       end