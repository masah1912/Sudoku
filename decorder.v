  1 `timescale 1ps/1ps
  2 
  3 module decoder
  4 ( 
  5   input  wire [15:0] op,
  6   input  wire        zf,
  7   output reg  [3:0]  alu_op,
  8   output reg  [3:0]  dst,
  9   output reg  [3:0]  src0,
 10   output reg  [3:0]  src1,
 11   output reg  [7:0]  data,
 12   output reg         reg_we,
 13   output reg         mem_we,
 14   output reg         reg0,
 15   output reg         reg1,
 16   output reg         jmp,
 17   output reg         load,
 18   output reg         link
 19 );
 20 
 21 `include "def.h"
 22 
 23   always @(*) begin
 24     case (op[15:12])
 25       /*
 26       format: {ADD,OR,ADD,SUB} rs1 rs0 rd
 27       code: rd = rs1 {&,|,+,-} rs0
 28             pc = pc + 1
 29       */
 30       AND, OR, ADD, SUB : begin
 31         alu_op = op[15:12];
 32         src1   = op[11:8];
 33         src0   = op[7:4];
 34         dst    = op[3:0];
 35         data   = 8'b0;
 36         reg_we = 1'b1;
 37         mem_we = 1'b0;
 38         reg1   = 1'b1;
 39         reg0   = 1'b1;
 40         jmp    = 1'b0;
 41         load   = 1'b0;
 42         link   = 1'b0;
 43       end
 44 
 45       /*
 46       format: CMP rs1 rs0
 47       code: zf = (rs1 == rs0)? 1'b1 : 1'b0;
 48             pc = pc + 1
 49       */
 50       CMP : begin
 51         alu_op = op[15:12];
 52         src1   = op[11:8];
 53         src0   = op[7:4];
 54         dst    = 4'b0;
 55         data   = 8'b0;
 56         reg_we = 1'b0;
 57         mem_we = 1'b0;
 58         reg1   = 1'b1;
 59         reg0   = 1'b1;
 60         jmp    = 1'b0;
 61         load   = 1'b0;
 62         link   = 1'b0;
 63       end
 64 
 65       /*
 66       format: {ADDI,SUBI} rs1 imm
 67       code: rs1 = rs1 {+,-} imm
 68             pc = pc + 1
 69       */
 70       ADDI, SUBI : begin
 71         alu_op = op[15:12];
 72         src1   = op[11:8];
 73         src0   = 4'b0;
 74         dst    = op[11:8];
 75         data   = op[7:0];
 76         reg_we = 1'b1;
 77         mem_we = 1'b0;
 78         reg1   = 1'b1;
 79         reg0   = 1'b0;
 80         jmp    = 1'b0;
 81         load   = 1'b0;
 82         link   = 1'b0;
 83       end
 84 
 85       /*
 86       format: CMPI rs1 imm
 87       code: zf = (rs1 == imm)? 1'b1 : 1'b0;
 88             pc = pc + 1
 89       */
 90       CMPI : begin
 91         alu_op = op[15:12];
 92         src1   = op[11:8];
 93         src0   = 4'b0;
 94         dst    = 4'b0;
 95         data   = op[7:0];
 96         reg_we = 1'b0;
 97         mem_we = 1'b0;
 98         reg1   = 1'b1;
 99         reg0   = 1'b0;
100         jmp    = 1'b0;
101         load   = 1'b0;
102         link   = 1'b0;
103       end
104 
105       /*
106       format: LOAD rs1 rd imm
107       code: rd = mem[rs1+imm]
108             pc = pc + 1
109       */
110       LOAD : begin
111         alu_op = op[15:12];
112         src1   = op[11:8];
113         src0   = 4'b0;
114         dst    = op[3:0];
115         data   = {4'b0, op[7:4]};
116         reg_we = 1'b1;
117         mem_we = 1'b0;
118         reg1   = 1'b1;
119         reg0   = 1'b0;
120         jmp    = 1'b0;
121         load   = 1'b1;
122         link   = 1'b0;
123       end
124 
125       /*
126       format: STORE rs1 rs0 imm
127       code: mem[rs1+imm] = rs0
128             pc = pc + 1
129       */
130       STORE : begin
131         alu_op = op[15:12];
132         src1   = op[11:8];
133         src0   = op[7:4];
134         dst    = 4'b0;
135         data   = {4'b0, op[3:0]};
136         reg_we = 1'b0;
137         mem_we = 1'b1;
138         reg1   = 1'b1;
139         reg0   = 1'b0;
140         jmp    = 1'b0;
141         load   = 1'b0;
142         link   = 1'b0;
143       end
144 
145       /*
146       format: JMP rd imm
147       code: rd = pc + 1
148             pc = imm
149       */
150       JMP : begin
151         alu_op = op[15:12];
152         src1   = 4'b0;
153         src0   = 4'b0;
154         dst    = op[3:0];
155         data   = op[11:4];
156         reg_we = 1'b1;
157         mem_we = 1'b0;
158         reg1   = 1'b0;
159         reg0   = 1'b0;
160         jmp    = 1'b1;
161         load   = 1'b0;
162         link   = 1'b1;
163       end
164 
165       /*
166       format: JMPR rs1 rd imm
167       code: rd = pc + 1
168             pc = rs1 + imm
169       */
170       JMPR : begin
171         alu_op = op[15:12];
172         src1   = op[11:8];
173         src0   = 4'b0;
174         dst    = op[3:0];
175         data   = {4'b0, op[7:4]};
176         reg_we = 1'b1;
177         mem_we = 1'b0;
178         reg1   = 1'b1;
179         reg0   = 1'b0;
180         jmp    = 1'b1;
181         load   = 1'b0;
182         link   = 1'b1;
183       end
184 
185       /*
186       format: JNZ rd imm
187       code: rd = pc + 1
188             pc = (zf)? imm : (pc + 1)
189       */
190       JNZ : begin
191         alu_op = op[15:12];
192         src1   = 4'b0;
193         src0   = 4'b0;
194         dst    = op[3:0];
195         data   = op[11:4];
196         reg_we = 1'b1;
197         mem_we = 1'b0;
198         reg1   = 1'b0;
199         reg0   = 1'b0;
200         jmp    = zf;
201         load   = 1'b0;
202         link   = zf;
203       end
204 
205       /*
206       format: LI rd imm
207       code: rd = imm
208             pc = pc + 1
209       */
210       LI : begin
211         alu_op = op[15:12];
212         src1   = 4'b0;
213         src0   = 4'b0;
214         dst    = op[3:0];
215         data   = op[11:4];
216         reg_we = 1'b1;
217         mem_we = 1'b0;
218         reg1   = 1'b1;
219         reg0   = 1'b0;
220         jmp    = 1'b0;
221         load   = 1'b0;
222         link   = 1'b0;
223       end
224 
225        /*
226        format: LTI rs1 imm
227        code: zf = (rs1 < imm)? 1'b1 : 1'b0;
228              pc = pc + 1
229        */
230        LTI    : begin
231          alu_op = op[15:12];
232          src1   = op[11:8];
233          src0   = 4'b0;
234          dst    = 4'b0;
235          data   = op[7:0];
236          reg_we = 1'b0;
237          mem_we = 1'b0;
238          reg1   = 1'b1;
239          reg0   = 1'b0;
240          jmp    = 1'b0;
241          load   = 1'b0;
242          link   = 1'b0;
243        end
244 
245       default : begin
246         alu_op = 4'bx;
247         src1   = 4'bx;
248         src0   = 4'bx;
249         dst    = 4'bx;
250         data   = 8'bx;
251         reg_we = 1'bx;
252         mem_we = 1'bx;
253         reg1   = 1'bx;
254         reg0   = 1'bx;
255         jmp    = 1'bx;
256         load   = 1'bx;
257         link   = 1'bx;
258       end
259     endcase
260   end
261 
262 endmodule