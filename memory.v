  1 `timescale 1ps/1ps
  2 
  3 module memory
  4 (
  5   input  wire       clk,
  6   input  wire       rst_n,
  7   input  wire       we,
  8   input  wire [7:0] in,
  9   input  wire [7:0] addr,
 10   output wire [7:0] out,
 11 
 12   //debug
 13   output wire [7:0] debug_memory0,
 14   output wire [7:0] debug_memory1,
 15   output wire [7:0] debug_memory2,
 16   output wire [7:0] debug_memory3,
 17   output wire [7:0] debug_memory4,
 18   output wire [7:0] debug_memory5,
 19   output wire [7:0] debug_memory6,
 20   output wire [7:0] debug_memory7,
 21   output wire [7:0] debug_memory8,
 22   output wire [7:0] debug_memory9,
 23   output wire [7:0] debug_memory10,
 24   output wire [7:0] debug_memory11,
 25   output wire [7:0] debug_memory12,
 26   output wire [7:0] debug_memory13,
 27   output wire [7:0] debug_memory14,
 28   output wire [7:0] debug_memory15,
 29   output wire [7:0] debug_memory16,
 30   output wire [7:0] debug_memory17,
 31   output wire [7:0] debug_memory18,
 32   output wire [7:0] debug_memory19,
 33   output wire [7:0] debug_memory20,
 34   output wire [7:0] debug_memory21,
 35   output wire [7:0] debug_memory22,
 36   output wire [7:0] debug_memory23,
 37   output wire [7:0] debug_memory24,
 38   output wire [7:0] debug_memory25,
 39   output wire [7:0] debug_memory26,
 40   output wire [7:0] debug_memory27,
 41   output wire [7:0] debug_memory28,
 42   output wire [7:0] debug_memory29,
 43   output wire [7:0] debug_memory30,
 44   output wire [7:0] debug_memory31,
 45   output wire [7:0] debug_memory32,
 46   output wire [7:0] debug_memory33,
 47   output wire [7:0] debug_memory34,
 48   output wire [7:0] debug_memory35,
 49   output wire [7:0] debug_memory36,
 50   output wire [7:0] debug_memory37,
 51   output wire [7:0] debug_memory38,
 52   output wire [7:0] debug_memory39,
 53   output wire [7:0] debug_memory40,
 54   output wire [7:0] debug_memory41,
 55   output wire [7:0] debug_memory42,
 56   output wire [7:0] debug_memory43,
 57   output wire [7:0] debug_memory44,
 58   output wire [7:0] debug_memory45,
 59   output wire [7:0] debug_memory46,
 60   output wire [7:0] debug_memory47,
 61   output wire [7:0] debug_memory48,
 62   output wire [7:0] debug_memory49,
 63   output wire [7:0] debug_memory50,
 64   output wire [7:0] debug_memory51,
 65   output wire [7:0] debug_memory52,
 66   output wire [7:0] debug_memory53,
 67   output wire [7:0] debug_memory54,
 68   output wire [7:0] debug_memory55,
 69   output wire [7:0] debug_memory56,
 70   output wire [7:0] debug_memory57,
 71   output wire [7:0] debug_memory58,
 72   output wire [7:0] debug_memory59,
 73   output wire [7:0] debug_memory60,
 74   output wire [7:0] debug_memory61,
 75   output wire [7:0] debug_memory62,
 76   output wire [7:0] debug_memory63,
 77   output wire [7:0] debug_memory64,
 78   output wire [7:0] debug_memory65,
 79   output wire [7:0] debug_memory66,
 80   output wire [7:0] debug_memory67,
 81   output wire [7:0] debug_memory68,
 82   output wire [7:0] debug_memory69,
 83   output wire [7:0] debug_memory70,
 84   output wire [7:0] debug_memory71,
 85   output wire [7:0] debug_memory72,
 86   output wire [7:0] debug_memory73,
 87   output wire [7:0] debug_memory74,
 88   output wire [7:0] debug_memory75,
 89   output wire [7:0] debug_memory76,
 90   output wire [7:0] debug_memory77,
 91   output wire [7:0] debug_memory78,
 92   output wire [7:0] debug_memory79,
 93   output wire [7:0] debug_memory80
 94 );
 95 
 96   integer i;
 97   reg [7:0] mem [255:0];
 98 
 99   always @(posedge clk) begin
100     if (!rst_n) begin
101       for(i = 0; i < 33; i = i + 1) begin
102         mem[i] <= 8'h0;
103       end
104 
105                                  mem[0] <= 8'd0;
106                                  mem[1] <= 8'd2;
107                                  mem[2] <= 8'd0;
108                                  mem[3] <= 8'd0;
109                                  mem[4] <= 8'd0;
110                                  mem[5] <= 8'd0;
111                                  mem[6] <= 8'd8;
112                                  mem[7] <= 8'd0;
113                                  mem[8] <= 8'd4;
114 
115                                  mem[9]  <= 8'd6;
116                                  mem[10] <= 8'd0;
117                                  mem[11] <= 8'd0;
118                                  mem[12] <= 8'd0;
119                                  mem[13] <= 8'd1;
120                                  mem[14] <= 8'd0;
121                                  mem[15] <= 8'd0;
122                                  mem[16] <= 8'd0;
123                                  mem[17] <= 8'd0;
124 
125                                  mem[18] <= 8'd0;
126                                  mem[19] <= 8'd9;
127                                  mem[20] <= 8'd7;
128                                  mem[21] <= 8'd0;
129                                  mem[22] <= 8'd3;
130                                  mem[23] <= 8'd0;
131                                  mem[24] <= 8'd0;
132                                  mem[25] <= 8'd0;
133                                  mem[26] <= 8'd0;
134 
135                                  mem[27] <= 8'd3;
136                                  mem[28] <= 8'd5;
137                                  mem[29] <= 8'd0;
138                                  mem[30] <= 8'd1;
139                                  mem[31] <= 8'd0;
140                                  mem[32] <= 8'd4;
141                                  mem[33] <= 8'd2;
142                                  mem[34] <= 8'd0;
143                                  mem[35] <= 8'd0;
144 
145                                  mem[36] <= 8'd0;
146                                  mem[37] <= 8'd6;
147                                  mem[38] <= 8'd8;
148                                  mem[39] <= 8'd3;
149                                  mem[40] <= 8'd0;
150                                  mem[41] <= 8'd7;
151                                  mem[42] <= 8'd0;
152                                  mem[43] <= 8'd9;
153                                  mem[44] <= 8'd0;
154 
155                                  mem[45] <= 8'd0;
156                                  mem[46] <= 8'd4;
157                                  mem[47] <= 8'd0;
158                                  mem[48] <= 8'd9;
159                                  mem[49] <= 8'd5;
160                                  mem[50] <= 8'd8;
161                                  mem[51] <= 8'd0;
162                                  mem[52] <= 8'd0;
163                                  mem[53] <= 8'd0;
164 
165                                  mem[54] <= 8'd8;
166                                  mem[55] <= 8'd7;
167                                  mem[56] <= 8'd6;
168                                  mem[57] <= 8'd2;
169                                  mem[58] <= 8'd4;
170                                  mem[59] <= 8'd3;
171                                  mem[60] <= 8'd0;
172                                  mem[61] <= 8'd0;
173                                  mem[62] <= 8'd1;
174 
175                                  mem[63] <= 8'd2;
176                                  mem[64] <= 8'd0;
177                                  mem[65] <= 8'd0;
178                                  mem[66] <= 8'd5;
179                                  mem[67] <= 8'd9;
180                                  mem[68] <= 8'd1;
181                                  mem[69] <= 8'd6;
182                                  mem[70] <= 8'd7;
183                                  mem[71] <= 8'd0;
184 
185                                  mem[72] <= 8'd9;
186                                  mem[73] <= 8'd1;
187                                  mem[74] <= 8'd0;
188                                  mem[75] <= 8'd7;
189                                  mem[76] <= 8'd8;
190                                  mem[77] <= 8'd6;
191                                  mem[78] <= 8'd3;
192                                  mem[79] <= 8'd4;
193                                  mem[80] <= 8'd0;
194 
195                                  mem[81] <= 8'd0;
196                                  mem[82] <= 8'd0;
197                                  mem[83] <= 8'd0;
198                                  mem[84] <= 8'd0;
199                                  mem[85] <= 8'd0;
200                                  mem[86] <= 8'd0;
201                                  mem[87] <= 8'd0;
202                                  mem[88] <= 8'd0;
203                                  mem[89] <= 8'd0;
204 
205                                  mem[90] <= 8'd0;
206                                  mem[91] <= 8'd0;
207                                  mem[92] <= 8'd0;
208                                  mem[83] <= 8'd0;
209                                  mem[94] <= 8'd0;
210                                  mem[95] <= 8'd0;
211                                  mem[96] <= 8'd0;
212                                  mem[97] <= 8'd0;
213                                  mem[98] <= 8'd0;
214 
215                                  mem[99] <= 8'd0;
216                                  mem[100] <= 8'd0;
217                                  mem[101] <= 8'd0;
218                                  mem[102] <= 8'd0;
219                                  mem[103] <= 8'd0;
220                                  mem[104] <= 8'd0;
221                                  mem[105] <= 8'd0;
222                                  mem[106] <= 8'd0;
223                                  mem[107] <= 8'd0;
224 
225                                  mem[108] <= 8'd0;
226                                  mem[109] <= 8'd0;
227                                  mem[110] <= 8'd0;
228                                  mem[111] <= 8'd0;
229                                  mem[112] <= 8'd0;
230                                  mem[113] <= 8'd0;
231                                  mem[114] <= 8'd0;
232                                  mem[115] <= 8'd0;
233                                  mem[116] <= 8'd0;
234 
235                                  mem[117] <= 8'd0;
236                                  mem[118] <= 8'd0;
237                                  mem[119] <= 8'd0;
238                                  mem[120] <= 8'd0;
239                                  mem[121] <= 8'd0;
240                                  mem[122] <= 8'd0;
241                                  mem[123] <= 8'd0;
242                                  mem[124] <= 8'd0;
243                                  mem[125] <= 8'd0;
244 
245                                  mem[126] <= 8'd0;
246                                  mem[127] <= 8'd0;
247                                  mem[128] <= 8'd0;
248                                  mem[129] <= 8'd0;
249                                  mem[130] <= 8'd0;
250                                  mem[131] <= 8'd0;
251                                  mem[132] <= 8'd0;
252                                  mem[133] <= 8'd0;
253                                  mem[134] <= 8'd0;
254 
255                                  mem[135] <= 8'd0;
256                                  mem[136] <= 8'd0;
257                                  mem[137] <= 8'd0;
258                                  mem[138] <= 8'd0;
259                                  mem[139] <= 8'd0;
260                                  mem[140] <= 8'd0;
261                                  mem[141] <= 8'd0;
262                                  mem[142] <= 8'd0;
263                                  mem[143] <= 8'd0;
264 
265                                  mem[144] <= 8'd0;
266                                  mem[145] <= 8'd0;
267                                  mem[146] <= 8'd0;
268                                  mem[147] <= 8'd0;
269                                  mem[148] <= 8'd0;
270                                  mem[149] <= 8'd0;
271                                  mem[150] <= 8'd0;
272                                  mem[151] <= 8'd0;
273                                  mem[152] <= 8'd0;
274 
275                                  mem[153] <= 8'd0;
276                                  mem[154] <= 8'd0;
277                                  mem[155] <= 8'd0;
278                                  mem[156] <= 8'd0;
279                                  mem[157] <= 8'd0;
280                                  mem[158] <= 8'd0;
281                                  mem[159] <= 8'd0;
282                                  mem[160] <= 8'd0;
283                                  mem[161] <= 8'd0;
284 
285                                 // LED pattern
286                                 mem[215] <= 8'b11000000; //0
287                                 mem[216] <= 8'b11111001; //1
288                                 mem[217] <= 8'b10100100; //2
289                                 mem[218] <= 8'b10110000; //3
290                                 mem[219] <= 8'b10011001; //4
291                                 mem[220] <= 8'b10010010; //5
292                                 mem[221] <= 8'b10000010; //6
293                                 mem[222] <= 8'b11011000; //7
294                                 mem[223] <= 8'b10000000; //8
295                                 mem[224] <= 8'b10010000; //9
296 
297       for(i = 225; i < 256; i = i + 1) begin
298         mem[i] <= 8'h0;
299       end
300     end else begin
301       if (we) begin
302         mem[addr] <= in;
303       end
304     end
305   end
306 
307   assign out = mem[addr];
308 
309   //debug
310   assign debug_memory0 = mem[0];
311   assign debug_memory1 = mem[1];
312   assign debug_memory2 = mem[2];
313   assign debug_memory3 = mem[3];
314   assign debug_memory4 = mem[4];
315   assign debug_memory5 = mem[5];
316   assign debug_memory6 = mem[6];
317   assign debug_memory7 = mem[7];
318   assign debug_memory8 = mem[8];
319   assign debug_memory9 = mem[9];
320   assign debug_memory10 = mem[10];
321   assign debug_memory11 = mem[11];
322   assign debug_memory12 = mem[12];
323   assign debug_memory13 = mem[13];
324   assign debug_memory14 = mem[14];
325   assign debug_memory15 = mem[15];
326   assign debug_memory16 = mem[16];
327   assign debug_memory17 = mem[17];
328   assign debug_memory18 = mem[18];
329   assign debug_memory19 = mem[19];
330   assign debug_memory20 = mem[20];
331   assign debug_memory21 = mem[21];
332   assign debug_memory22 = mem[22];
333   assign debug_memory23 = mem[23];
334   assign debug_memory24 = mem[24];
335   assign debug_memory25 = mem[25];
336   assign debug_memory26 = mem[26];
337   assign debug_memory27 = mem[27];
338   assign debug_memory28 = mem[28];
339   assign debug_memory29 = mem[29];
340   assign debug_memory30 = mem[30];
341   assign debug_memory31 = mem[31];
342   assign debug_memory32 = mem[32];
343   assign debug_memory33 = mem[33];
344   assign debug_memory34 = mem[34];
345   assign debug_memory35 = mem[35];
346   assign debug_memory36 = mem[36];
347   assign debug_memory37 = mem[37];
348   assign debug_memory38 = mem[38];
349   assign debug_memory39 = mem[39];
350   assign debug_memory40 = mem[40];
351   assign debug_memory41 = mem[41];
352   assign debug_memory42 = mem[42];
353   assign debug_memory43 = mem[43];
354   assign debug_memory44 = mem[44];
355   assign debug_memory45 = mem[45];
356   assign debug_memory46 = mem[46];
357   assign debug_memory47 = mem[47];
358   assign debug_memory48 = mem[48];
359   assign debug_memory49 = mem[49];
360   assign debug_memory50 = mem[50];
361   assign debug_memory51 = mem[51];
362   assign debug_memory52 = mem[52];
363   assign debug_memory53 = mem[53];
364   assign debug_memory54 = mem[54];
365   assign debug_memory55 = mem[55];
366   assign debug_memory56 = mem[56];
367   assign debug_memory57 = mem[57];
368   assign debug_memory58 = mem[58];
369   assign debug_memory59 = mem[59];
370   assign debug_memory60 = mem[60];
371   assign debug_memory61 = mem[61];
372   assign debug_memory62 = mem[62];
373   assign debug_memory63 = mem[63];
374   assign debug_memory64 = mem[64];
375   assign debug_memory65 = mem[65];
376   assign debug_memory66 = mem[66];
377   assign debug_memory67 = mem[67];
378   assign debug_memory68 = mem[68];
379   assign debug_memory69 = mem[69];
380   assign debug_memory70 = mem[70];
381   assign debug_memory71 = mem[71];
382   assign debug_memory72 = mem[72];
383   assign debug_memory73 = mem[73];
384   assign debug_memory74 = mem[74];
385   assign debug_memory75 = mem[75];
386   assign debug_memory76 = mem[76];
387   assign debug_memory77 = mem[77];
388   assign debug_memory78 = mem[78];
389   assign debug_memory79 = mem[79];
390   assign debug_memory80 = mem[80];
391 
392 endmodule