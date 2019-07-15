`timescale 1ps/1ps

module imem
(
  input  wire [7:0]  pc,
  output reg  [15:0] op
);

`include "def.h"

  always @(*) begin
    case (pc)

         //reg1:pos   reg2: newPos   reg3: memの一時保存先   reg4:x   reg5:i   reg6: row
         //reg7:割り算計算用   reg8:col  reg9:計算用 reg10: row/b  reg11: col/B
         //reg12: 計算用  //reg13: j  //reg14: 最後 //reg15: 0 pos


         //MAIN
         0  : op = {LI, 8'd0, 4'd2};           //reg2 = 0
		 1  : op = {LI, 8'd80, 4'd15};         //reg15 = 80
         2  : op = {JMP, 8'd12, 4'd0};         //goto FindBlank
 
         //FindBlank
         12 : op = {LI, 8'd0, 4'd3};           //reg3 = 0 
         13 : op = {LOAD, 4'd2, 4'h0, 4'd3};   //reg3 = mem[reg2]                 
         14 : op = {CMPI, 4'd3, 8'd0};         //do{if(reg3 == 0)
         15 : op = {JNZ, 8'd147, 4'd0};        //true -> goto save 0 
         16 : op = {ADDI, 4'd2, 8'd1};         //reg2 ++
         17 : op = {LTI, 4'd2, 8'd81};         //while(reg2 < 81)
         18 : op = {JNZ, 8'd13, 4'd0};         //true -> again
         19 : op = {JMP, 8'd150, 4'd0};        //false -> goto Check
 
         //CanBePlaced
         //row
         30 : op = {LI, 8'd0, 4'd6};           //reg6 = 0
         31 : op = {LI, 8'd0, 4'd7};           //reg7 = 0
         32 : op = {ADD, 4'd2, 4'd7,4'd7};     //reg7+=reg2
         33 : op = {LTI, 4'd7, 8'd9};          //if(reg7 < 9)
         34 : op = {JNZ, 8'd38, 4'd0};         //true -> goto col
         35 : op = {SUBI, 4'd7, 8'd9};         //reg7 = reg7 - 9
         36 : op = {ADDI, 4'd6, 8'd1};         //reg6++
         37 : op = {JMP, 8'd33, 4'd0};         //false -> do again
         //col   
         38 : op = {LI, 8'd0, 4'd8};           //reg8 = 0
         39 : op = {ADD, 4'd2, 4'd8, 4'd8};    //reg8 += reg2
         40 : op = {LTI, 4'd8, 8'd9};          //if(reg8 < 9)
         41 : op = {JNZ, 8'd54, 4'd0};         //true -> goto 54
         42 : op = {SUBI, 4'd8, 8'd9};         //reg8 = reg8 - 9
         43 : op = {JMP, 8'd40, 4'd0};         //false -> do again           
         //init i
         54 : op = {LI, 8'd0, 4'd5};           //reg5 = 0
         //same row
         55 : op = {LI, 8'd0, 4'd9};           //reg9 = 0
         56 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         57 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         58 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         59 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         60 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         61 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         62 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         63 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         64 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
         65 : op = {ADD, 4'd5, 4'd9, 4'd9};    //reg9 += reg5
         66 : op = {LI, 8'd0, 4'd3};           //reg3 = 0
         67 : op = {LOAD, 4'd9, 4'h0, 4'd3};   //reg3 = mem[reg9]
         68 : op = {CMP, 4'd3, 4'd4, 4'h0};    //if(mem[reg3 == reg4)
         69 : op = {JNZ, 8'd165, 4'd0};        //true - > goto x++
         //same colunm
         70 : op = {LI, 8'd0, 4'd9};           //reg9 = 0
         71 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         72 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         73 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         74 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         75 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         76 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         77 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         78 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         79 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
         80 : op = {ADD, 4'd9, 4'd8, 4'd9};    //reg9 += reg8
         81 : op = {LI, 8'd0, 4'd3};           //reg3 = 0
         82 : op = {LOAD, 4'd9, 4'h0, 4'd3};   //reg3 = mem[reg9]
         83 : op = {CMP, 4'd3, 4'd4, 4'h0};    //if(reg3 == reg4)
         84 : op = {JNZ, 8'd165, 4'd0};        //true -> goto x++
 
         85 : op = {ADDI, 4'd5, 8'd1};         //reg5++
         86 : op = {LTI, 4'd5, 8'd9};          //if(i < 9)
         87 : op = {JNZ, 8'd55, 4'd0};         //true -> goto same row
         //init i
         88 : op = {LI, 8'd0, 4'd5};           //reg5= 0
         //row/B
         89 : op = {LI, 8'd0, 4'd10};          //reg10 = 0
         90 : op = {LI, 8'd0, 4'd7};           //reg7 = 0
         91 : op = {ADD, 4'd7, 4'd6, 4'd7};    //reg7 += reg6 
         92 : op = {LTI, 4'd7, 8'd3};          //if(reg7 < 3)
         93 : op = {JNZ, 8'd97, 4'd0};         //true -> goto col/B
         94 : op = {SUBI, 4'd7, 8'd3};         //reg7 = reg7 -3
         95 : op = {ADDI, 4'd10, 8'd1};        //reg10++
         96 : op = {JMP, 8'd92, 4'd0};         //do again
         //col/B
         97 : op = {LI, 8'd0, 4'd11};          //reg11 = 0
         98 : op = {LI, 8'd0, 4'd7};           //reg7 = 0
         99 : op = {ADD, 4'd7, 4'd8, 4'd7};    //reg7 += reg8 
         100: op = {LTI, 4'd7, 8'd3};          //if(reg7 < 3)
         101: op = {JNZ, 8'd105, 4'd0};        //goto topLeft 
         102: op = {SUBI, 4'd7, 8'd3};         //reg7 = reg7 -3
         103: op = {ADDI, 4'd11, 8'd1};        //reg11++
         104: op = {JMP, 8'd100, 4'd0};        //do again
         //topLeft
         105: op = {LI, 8'd0, 4'd9};           //reg9 = 0
         106: op = {LI, 8'd0, 4'd12};          //reg12 = 0
         107: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         108: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         109: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         110: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         111: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         112: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         113: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         114: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         115: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg10
         116: op = {ADD, 4'd12, 4'd9, 4'd9};   //reg9 += reg12
         117: op = {ADD, 4'd12, 4'd9, 4'd9};   //reg9 += reg12
         118: op = {ADD, 4'd12, 4'd9, 4'd9};   //reg9 += reg12
         119: op = {ADD, 4'd9, 4'd11, 4'd9};   //reg9 +=reg11
         120: op = {ADD, 4'd9, 4'd11, 4'd9};   //reg9 +=reg11
         121: op = {ADD, 4'd9, 4'd11, 4'd9};   //reg9 +=reg11
         //square of nine
         122: op = {LI, 8'd0, 4'd5};           //reg5 = 0
         123: op = {LI, 8'd0, 4'd13};          //reg13 = 0        
		 124: op = {LI, 8'd0, 4'd3};           //reg3 = 0
		 125: op = {LI, 8'd0, 4'd12};          //reg12 = 0
		 126: op = {ADD, 4'd12, 4'd9, 4'd12};  //reg12 += reg9
         127: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         128: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         129: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         130: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         131: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         132: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         133: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         134: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         135: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
         136: op = {ADD, 4'd12, 4'd13, 4'd12}; //reg12 += reg13
         137: op = {LOAD, 4'd12, 4'h0, 4'd3};  //reg3 = mem[reg12]  
         138: op = {CMP, 4'd3, 4'd4, 4'h0};    //if(reg3 == reg4)
         139: op = {JNZ, 8'd165, 4'd0};        //goto x++ 
         140: op = {ADDI, 4'd13, 8'd1};        //reg13++
         141: op = {LTI, 4'd13, 8'd3};         //if(reg13 < 3)
         142: op = {JNZ, 8'd125, 4'd0};        //true -> do again
         143: op = {ADDI, 4'd5, 8'd1};         //reg5++
         144: op = {LTI, 4'd5, 8'd3};          //if(reg5 < 3)
         145: op = {JNZ, 8'd123, 4'd0};        //true -> do again
 
         146: op = {JMP, 8'd152, 4'd0};        //goto store
 
         //save 0 place
         147: op = {ADDI, 4'd15, 8'd1};        //reg15 ++
         148: op = {STORE, 4'd15, 4'd2, 4'h0}; //mem[reg15] = reg2
		 149: op = {JMP, 8'd150, 4'd0};        //goto check
 
         //Check
         150: op = {LI, 8'd1, 4'd4};           //reg4 = 1
         151: op = {JMP, 8'd30, 4'd0};         //do{if(canBePlaced)
         //YES
         152: op = {STORE,  4'd2, 4'd4, 4'h0}; //mem[reg2] = reg 4
         153: op = {ADDI, 4'd2, 8'd1};         //reg2++
		 154: op = {JMP, 8'd156, 4'd0};        //go next
		 156: op = {LTI, 4'd2, 8'd81};         //if(reg2 < 81)
         157: op = {JNZ, 8'd12, 4'd0};         //true -> goto find blank
         158: op = {JMP, 8'd169, 4'd0};        //end
         //backtracking
         159: op = {SUBI, 4'd15, 8'd1};        //reg15 --;
         160: op = {LI, 8'd0, 4'd2};           //reg2 = 0
         161: op = {LOAD, 4'd15, 4'h0, 4'd2};  //reg2 = mem[reg15]
         162: op = {LOAD, 4'd2, 4'h0, 4'd4};  //reg4 = mem[reg2]
         163: op = {LI, 8'd0, 4'd12};          //reg12 = 0
         164: op = {STORE, 4'd2, 4'd12, 4'h0};//mem[reg2] = reg12 
         //NO
         165: op = {ADDI, 4'd4, 8'd1};         //reg4++
         166: op = {LTI, 4'd4, 8'd10};         //if(reg4 < 10)
         167: op = {JNZ, 8'd151, 4'd0};        //true -> do again
         168: op = {JMP, 8'd159, 4'd0};        //goto backtracking
 
         169: op = {JMP, 8'd169, 4'd0};        //end              

      default: op = 16'bx;
    endcase
  end

endmodule
