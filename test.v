  1 `timescale 1ps/1ps
  2 
  3 module test;
  4     reg         clk;
  5     reg         rst_n;
  6     reg [4:0]   pb;
  7     wire [11:0] led;
  8 
  9     /* top */
 10     top top_inst
 11     (
 12         .clk    (clk),
 13         .rst_n  (rst_n),
 14         .pb     (pb),
 15         .led    (led)
 16     );
 17 
 18     always #5 clk = ~clk;
 19 
 20     initial begin
 21         $dumpfile("top_test.vcd");
 22         $dumpvars(0, test);
 23         $dumplimit(10000000000);
 24     //  $monitor($stime, "clk:%d rst:%b pb:%b led:%b", clk, rs    t_n, pb, led);
 25         rst_n <= 0;
 26         clk <= 0;
 27         pb <= 0;
 28 #150
 29         rst_n <= 1;
 30 #6000000
 31         $finish;
 32     end
 33 
 34 endmodule