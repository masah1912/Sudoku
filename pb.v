  1 `timescale 1ps/1ps
  2 
  3 module pb
  4 (
  5   input  wire       clk,
  6   input  wire       rst_n,
  7   input  wire [7:0] addr,
  8   output wire [7:0] out,
  9   input  wire [4:0] pb
 10 );
 11 
 12   reg [2:0]  debounce [4:0];
 13   reg [11:0] cnt;
 14   reg [4:0]  state;
 15 
 16   always @(posedge clk) begin
 17     if (!rst_n) begin
 18       debounce[0] <= 3'b0;
 19       debounce[1] <= 3'b0;
 20       debounce[2] <= 3'b0;
 21       debounce[3] <= 3'b0;
 22       debounce[4] <= 3'b0;
 23       cnt         <= 12'b0;
 24       state       <= 5'b0;
 25     end else begin
 26       cnt <= cnt + 1;
 27       if (!cnt) begin
 28         debounce[0] <= {debounce[0][1:0], pb[0]};
 29         debounce[1] <= {debounce[1][1:0], pb[1]};
 30         debounce[2] <= {debounce[2][1:0], pb[2]};
 31         debounce[3] <= {debounce[3][1:0], pb[3]};
 32         debounce[4] <= {debounce[4][1:0], pb[4]};
 33       end
 34       state[0] <= (|debounce[0] == 1'b0)? 1'b0 :
 35                   (&debounce[0] == 1'b1)? 1'b1 : state[0];
 36       state[1] <= (|debounce[1] == 1'b0)? 1'b0 :
 37                   (&debounce[1] == 1'b1)? 1'b1 : state[1];
 38       state[2] <= (|debounce[2] == 1'b0)? 1'b0 :
 39                   (&debounce[2] == 1'b1)? 1'b1 : state[2];
 40       state[3] <= (|debounce[3] == 1'b0)? 1'b0 :
 41                   (&debounce[3] == 1'b1)? 1'b1 : state[3];
 42       state[4] <= (|debounce[4] == 1'b0)? 1'b0 :
 43                   (&debounce[4] == 1'b1)? 1'b1 : state[4];
 44     end
 45   end
 46 
 47   assign out = (addr == 8'hfb)? {3'b0, state} : 8'b0;
 48 
 49 endmodule