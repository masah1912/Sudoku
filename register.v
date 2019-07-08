  1 `timescale 1ps/1ps
  2 
  3 module register
  4 (
  5     input wire          clk,
  6     input wire          rst_n,
  7     input wire          we,
  8     input wire [3:0]    src0,
  9     input wire [3:0]    src1,
 10     input wire [3:0]    dst,
 11     input wire [7:0]    data,
 12     output wire [7:0]   data0,
 13     output wire [7:0]   data1,
 14 //debug
 15     output wire [7:0]   debug_reg0,
 16     output wire [7:0]   debug_reg1,
 17     output wire [7:0]   debug_reg2,
 18     output wire [7:0]   debug_reg3,
 19     output wire [7:0]   debug_reg4,
 20     output wire [7:0]   debug_reg5,
 21     output wire [7:0]   debug_reg6,
 22     output wire [7:0]   debug_reg7,
 23     output wire [7:0]   debug_reg8,
 24     output wire [7:0]   debug_reg9,
 25     output wire [7:0]   debug_reg10,
 26     output wire [7:0]   debug_reg11,
 27     output wire [7:0]   debug_reg12,
 28     output wire [7:0]   debug_reg13,
 29     output wire [7:0]   debug_reg14,
 30     output wire [7:0]   debug_reg15
 31 );
 32 
 33     reg [7:0] regis [15:0];
 34 
 35     always @(posedge clk) begin
 36         if(!rst_n) begin
 37             regis[0]    <= 0;
 38             regis[1]    <= 0;
 39             regis[2]    <= 0;
 40             regis[3]    <= 0;
 41             regis[4]    <= 0;
 42             regis[5]    <= 0;
 43             regis[6]    <= 0;
 44             regis[7]    <= 0;
 45             regis[8]    <= 0;
 46             regis[9]    <= 0;
 47             regis[10]   <= 0;
 48             regis[11]   <= 0;
 49             regis[12]   <= 0;
 50             regis[13]   <= 0;
 51             regis[14]   <= 0;
 52             regis[15]   <= 0;
 53         end else begin
 54             if (we) begin
 55                 regis[dst] <= data;
 56             end
 57         end
 58     end
 59 
 60     assign data0 = regis[src0];
 61     assign data1 = regis[src1];
 62 
 63     //debug
 64     assign debug_reg0 = regis[0];
 65     assign debug_reg1 = regis[1];
 66     assign debug_reg2 = regis[2];
 67     assign debug_reg3 = regis[3];
 68     assign debug_reg4 = regis[4];
 69     assign debug_reg5 = regis[5];
 70     assign debug_reg6 = regis[6];
 71     assign debug_reg7 = regis[7];
 72     assign debug_reg8 = regis[8];
 73     assign debug_reg9 = regis[9];
 74     assign debug_reg10 = regis[10];
 75     assign debug_reg11 = regis[11];
 76     assign debug_reg12 = regis[12];
 77     assign debug_reg13 = regis[13];
 78     assign debug_reg14 = regis[14];
 79     assign debug_reg15 = regis[15];
 80 endmodule