  1 `timescale 1ps/1ps
  2 
  3 module imem
  4 (
  5   input  wire [7:0]  pc,
  6   output reg  [15:0] op
  7 );
  8 
  9 `include "def.h"
 10 
 11   always @(*) begin
 12     case (pc)
 13 
 14          //reg1:pos   reg2: newPos   reg3: mem‚ÌˆêŽž•Û‘¶æ   r    eg4:x   reg5:i   reg6: row
 15          //reg7:Š„‚èŽZŒvŽZ—p   reg8:col  reg9:ŒvŽZ—p reg10: ro    w/b  reg11: col/B
 16          //reg12: ŒvŽZ—p  //reg13: j  //reg14: ÅŒã //reg15: 0     pos
 17 
 18 
 19          //MAIN
 20          0  : op = {LI, 8'd0, 4'd2};           //reg2 = 0
 21          1  : op = {LI, 8'd80, 4'd15};         //reg15 = 80
 22          2  : op = {JMP, 8'd12, 4'd0};         //goto FindBlan    k
 23 
 24          //FindBlank
 25          12 : op = {LI, 8'd0, 4'd3};           //reg3 = 0 
 26          13 : op = {LOAD, 4'd2, 4'h0, 4'd3};   //reg3 = mem[re    g2]                 
 27          14 : op = {CMPI, 4'd3, 8'd0};         //do{if(reg3 ==     0)
 28          15 : op = {JNZ, 8'd147, 4'd0};        //true -> goto     save 0 
 29          16 : op = {ADDI, 4'd2, 8'd1};         //reg2 ++
 30          17 : op = {LTI, 4'd2, 8'd81};         //while(reg2 <     81)
 31          18 : op = {JNZ, 8'd13, 4'd0};         //true -> again 32          19 : op = {JMP, 8'd150, 4'd0};        //false -> goto     Check
 33 
 34          //CanBePlaced
 35          //row
 36          30 : op = {LI, 8'd0, 4'd6};           //reg6 = 0
 37          31 : op = {LI, 8'd0, 4'd7};           //reg7 = 0
 38          32 : op = {ADD, 4'd2, 4'd7,4'd7};     //reg7+=reg2
 39          33 : op = {LTI, 4'd7, 8'd9};          //if(reg7 < 9)
 40          34 : op = {JNZ, 8'd38, 4'd0};         //true -> goto     col
 41          35 : op = {SUBI, 4'd7, 8'd9};         //reg7 = reg7 -     9
 42          36 : op = {ADDI, 4'd6, 8'd1};         //reg6++
 43          37 : op = {JMP, 8'd33, 4'd0};         //false -> do a    gain
 44          //col   
 45          38 : op = {LI, 8'd0, 4'd8};           //reg8 = 0
 46          39 : op = {ADD, 4'd2, 4'd8, 4'd8};    //reg8 += reg2
 47          40 : op = {LTI, 4'd8, 8'd9};          //if(reg8 < 9)
 48          41 : op = {JNZ, 8'd54, 4'd0};         //true -> goto     54
 49          42 : op = {SUBI, 4'd8, 8'd9};         //reg8 = reg8 -     9
 50          43 : op = {JMP, 8'd40, 4'd0};         //false -> do a    gain           
 51          //init i
 52          54 : op = {LI, 8'd0, 4'd5};           //reg5 = 0
 53          //same row
 54          55 : op = {LI, 8'd0, 4'd9};           //reg9 = 0
 55          56 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 56          57 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 57          58 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 58          59 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 59          60 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 60          61 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 61          62 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 62          63 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 63          64 : op = {ADD, 4'd9, 4'd6, 4'd9};    //reg9 += reg6
 64          65 : op = {ADD, 4'd5, 4'd9, 4'd9};    //reg9 += reg5
 65          66 : op = {LI, 8'd0, 4'd3};           //reg3 = 0
 66          67 : op = {LOAD, 4'd9, 4'h0, 4'd3};   //reg3 = mem[re    g9]
 67          68 : op = {CMP, 4'd3, 4'd4, 4'h0};    //if(mem[reg3 =    = reg4)
 68          69 : op = {JNZ, 8'd165, 4'd0};        //true - > goto     x++
 69          //same colunm
 70          70 : op = {LI, 8'd0, 4'd9};           //reg9 = 0
 71          71 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 72          72 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 73          73 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 74          74 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 75          75 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 76          76 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 77          77 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 78          78 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 79          79 : op = {ADD, 4'd9, 4'd5, 4'd9};    //reg9 += reg5
 80          80 : op = {ADD, 4'd9, 4'd8, 4'd9};    //reg9 += reg8
 81          81 : op = {LI, 8'd0, 4'd3};           //reg3 = 0
 82          82 : op = {LOAD, 4'd9, 4'h0, 4'd3};   //reg3 = mem[re    g9]
 83          83 : op = {CMP, 4'd3, 4'd4, 4'h0};    //if(reg3 == re    g4)
 84          84 : op = {JNZ, 8'd165, 4'd0};        //true -> goto     x++
 85 
 86          85 : op = {ADDI, 4'd5, 8'd1};         //reg5++
 87          86 : op = {LTI, 4'd5, 8'd9};          //if(i < 9)
 88          87 : op = {JNZ, 8'd55, 4'd0};         //true -> goto     same row
 89          //init i
 90          88 : op = {LI, 8'd0, 4'd5};           //reg5= 0
 91          //row/B
 92          89 : op = {LI, 8'd0, 4'd10};          //reg10 = 0
 93          90 : op = {LI, 8'd0, 4'd7};           //reg7 = 0
 94          91 : op = {ADD, 4'd7, 4'd6, 4'd7};    //reg7 += reg6 
 95          92 : op = {LTI, 4'd7, 8'd3};          //if(reg7 < 3)
 96          93 : op = {JNZ, 8'd97, 4'd0};         //true -> goto     col/B
 97          94 : op = {SUBI, 4'd7, 8'd3};         //reg7 = reg7 -    3
 98          95 : op = {ADDI, 4'd10, 8'd1};        //reg10++
 99          96 : op = {JMP, 8'd92, 4'd0};         //do again
100          //col/B
101          97 : op = {LI, 8'd0, 4'd11};          //reg11 = 0
102          98 : op = {LI, 8'd0, 4'd7};           //reg7 = 0
103          99 : op = {ADD, 4'd7, 4'd8, 4'd7};    //reg7 += reg8 
104          100: op = {LTI, 4'd7, 8'd3};          //if(reg7 < 3)
105          101: op = {JNZ, 8'd105, 4'd0};        //goto topLeft 106          102: op = {SUBI, 4'd7, 8'd3};         //reg7 = reg7 -    3
107          103: op = {ADDI, 4'd11, 8'd1};        //reg11++
108          104: op = {JMP, 8'd100, 4'd0};        //do again
109          //topLeft
110          105: op = {LI, 8'd0, 4'd9};           //reg9 = 0
111          106: op = {LI, 8'd0, 4'd12};          //reg12 = 0
112          107: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
113          108: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
114          109: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
115          110: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
116          111: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
117          112: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
118          113: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
119          114: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
120          115: op = {ADD, 4'd12, 4'd10, 4'd12}; //reg12 += reg1    0
121          116: op = {ADD, 4'd12, 4'd9, 4'd9};   //reg9 += reg12
122          117: op = {ADD, 4'd12, 4'd9, 4'd9};   //reg9 += reg12
123          118: op = {ADD, 4'd12, 4'd9, 4'd9};   //reg9 += reg12
124          119: op = {ADD, 4'd9, 4'd11, 4'd9};   //reg9 +=reg11
125          120: op = {ADD, 4'd9, 4'd11, 4'd9};   //reg9 +=reg11
126          121: op = {ADD, 4'd9, 4'd11, 4'd9};   //reg9 +=reg11
127          //square of nine
128          122: op = {LI, 8'd0, 4'd5};           //reg5 = 0
129          123: op = {LI, 8'd0, 4'd13};          //reg13 = 0            
130          124: op = {LI, 8'd0, 4'd3};           //reg3 = 0
131          125: op = {LI, 8'd0, 4'd12};          //reg12 = 0
132          126: op = {ADD, 4'd12, 4'd9, 4'd12};  //reg12 += reg9
133          127: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
134          128: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
135          129: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5136          130: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5137          131: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
138          132: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
139          133: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
140          134: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5
141          135: op = {ADD, 4'd12, 4'd5, 4'd12};  //reg12 += reg5142          136: op = {ADD, 4'd12, 4'd13, 4'd12}; //reg12 += reg1    3
143          137: op = {LOAD, 4'd12, 4'h0, 4'd3};  //reg3 = mem[re    g12]  
144          138: op = {CMP, 4'd3, 4'd4, 4'h0};    //if(reg3 == re    g4)
145          139: op = {JNZ, 8'd165, 4'd0};        //goto x++ 
146          140: op = {ADDI, 4'd13, 8'd1};        //reg13++
147          141: op = {LTI, 4'd13, 8'd3};         //if(reg13 < 3)148          142: op = {JNZ, 8'd125, 4'd0};        //true -> do ag    ain
149          143: op = {ADDI, 4'd5, 8'd1};         //reg5++
150          144: op = {LTI, 4'd5, 8'd3};          //if(reg5 < 3)
151          145: op = {JNZ, 8'd123, 4'd0};        //true -> do ag    ain
152 
153          146: op = {JMP, 8'd152, 4'd0};        //goto store
154 
155          //save 0 place
156          147: op = {ADDI, 4'd15, 8'd1};        //reg15 ++
157          148: op = {STORE, 4'd15, 4'd2, 4'h0}; //mem[reg15] =     reg2
158          149: op = {JMP, 8'd150, 4'd0};        //goto check
159 
160          //Check
161          150: op = {LI, 8'd1, 4'd4};           //reg4 = 1
162          151: op = {JMP, 8'd30, 4'd0};         //do{if(canBePl    aced)
163          //YES
164          152: op = {STORE,  4'd2, 4'd4, 4'h0}; //mem[reg2] = r    eg 4
165          153: op = {ADDI, 4'd2, 8'd1};         //reg2++
166          154: op = {JMP, 8'd156, 4'd0};        //go next
167          156: op = {LTI, 4'd2, 8'd81};         //if(reg2 < 81)168          157: op = {JNZ, 8'd12, 4'd0};         //true -> goto     find blank
169          158: op = {JMP, 8'd169, 4'd0};        //end
170          //backtracking
171          159: op = {SUBI, 4'd15, 8'd1};        //reg15 --;
172          160: op = {LI, 8'd0, 4'd2};           //reg2 = 0
173          161: op = {LOAD, 4'd15, 4'h0, 4'd2};  //reg2 = mem[re    g15]
174          162: op = {LOAD, 4'd2, 4'h0, 4'd4};  //reg4 = mem[reg    2]
175          163: op = {LI, 8'd0, 4'd12};          //reg12 = 0
176          164: op = {STORE, 4'd2, 4'd12, 4'h0};//mem[reg2] = re    g12 
177          //NO
178          165: op = {ADDI, 4'd4, 8'd1};         //reg4++
179          166: op = {LTI, 4'd4, 8'd10};         //if(reg4 < 10)180          167: op = {JNZ, 8'd151, 4'd0};        //true -> do ag    ain
181          168: op = {JMP, 8'd159, 4'd0};        //goto backtrac    king
182 
183          169: op = {JMP, 8'd169, 4'd0};        //end                  
184 
185       default: op = 16'bx;
186     endcase
187   end
188 
189 endmodule