  1 `timescale 1ps/1ps
  2 
  3 module alu
  4 (
  5   input  wire [7:0] in0,
  6   input  wire [7:0] in1,
  7   input  wire [3:0] op,
  8   output reg        zf,
  9   output reg  [7:0] out
 10 );
 11 
 12 `include "def.h"
 13 
 14   always @(*) begin
 15     case (op)
 16       AND     : out = in0 & in1;
 17       OR      : out = in0 | in1;
 18       ADD     : out = in0 + in1;
 19       SUB     : out = in1 - in0;
 20       CMP     : out = (in0 == in1);
 21       ADDI    : out = in0 + in1;
 22       SUBI    : out = in1 - in0;
 23       CMPI    : out = (in0 == in1);
 24       LOAD    : out = in0 + in1;
 25       STORE   : out = in0 + in1;
 26       JMP     : out = in0;
 27       JMPR    : out = in0 + in1;
 28       JNZ     : out = in0;
 29       LI      : out = in0;
 30       LTI     : out = (in0 > in1);
 31       default : out = 8'bx;
 32     endcase
 33     zf = (out)? 1'b1 : 1'b0;
 34   end
 35 
 36 endmodule