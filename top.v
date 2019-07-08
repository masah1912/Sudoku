  1 `timescale 1ps/1ps
  2 
  3 module top
  4 (
  5   input  wire        clk,
  6   input  wire        rst_n,
  7   input  wire [4:0]  pb,
  8   output wire [11:0] led
  9 );
 10 
 11   /* write enable */
 12   wire reg_we;
 13   wire mem_we;
 14 
 15   /* pc */
 16   wire [7:0]  pc_in;
 17   wire [7:0]  pc_out;
 18   wire [7:0]  pc_next;
 19 
 20   /* imem */
 21   wire [15:0] op;
 22 
 23   /* decoder */
 24   wire [3:0] dst;
 25   wire [3:0] src0;
 26   wire [3:0] src1;
 27   wire [7:0] dec_data;
 28 
 29   /* alu */
 30   wire [7:0] alu_in0;
 31   wire [7:0] alu_in1;
 32   wire [3:0] alu_op;
 33   wire [7:0] alu_out;
 34 
 35   /* zf */
 36   wire zf;
 37   wire zf_out;
 38 
 39   /* selector */
 40   wire reg0;
 41   wire reg1;
 42   wire jmp;
 43   wire load;
 44   wire link;
 45   wire mem_io;
 46 
 47   /* register */
 48   wire [7:0] reg_in;
 49   wire [7:0] reg_data;
 50   wire [7:0] reg_data0;
 51   wire [7:0] reg_data1;
 52 
 53   /* memory */
 54   wire [7:0] mem_out;
 55   wire [7:0] pb_out;
 56   wire [7:0] mem_io_out;
 57 
 58   /* selector */
 59   sel sel_reg0
 60   (
 61     .sel (reg0),
 62     .in0 (dec_data),
 63     .in1 (reg_data0),
 64     .out (alu_in0)
 65   );
 66 
 67   sel sel_reg1
 68   (
 69     .sel (reg1),
 70     .in0 (pc_next),
 71     .in1 (reg_data1),
 72     .out (alu_in1)
 73   );
 74 
 75   sel sel_jmp
 76   (
 77     .sel (jmp),
 78     .in0 (pc_next),
 79     .in1 (alu_out),
 80     .out (pc_in)
 81   );
 82 
 83   sel sel_link
 84   (
 85     .sel (link),
 86     .in0 (reg_in),
 87     .in1 (pc_next),
 88     .out (reg_data)
 89   );
 90 
 91   sel sel_load
 92   (
 93     .sel (load),
 94     .in0 (alu_out),
 95     .in1 (mem_io_out),
 96     .out (reg_in)
 97   );
 98 
 99   sel sel_mem
100   (
101     .sel (mem_io),
102     .in0 (mem_out),
103     .in1 (pb_out),
104     .out (mem_io_out)
105   );
106 
107   /* address decoder */
108   adec adec_inst
109   (
110     .addr   (alu_out),
111     .mem_io (mem_io)
112   );
113 
114   /* register */
115   register register_inst
116   (
117     .clk   (clk),
118     .rst_n (rst_n),
119     .we    (reg_we),
120     .src0  (src0),
121     .src1  (src1),
122     .dst   (dst),
123     .data  (reg_data),
124     .data0 (reg_data0),
125     .data1 (reg_data1)
126   );
127 
128   /* arithmetic logic unit */
129   alu alu_inst
130   (
131     .in0 (alu_in0),
132     .in1 (alu_in1),
133     .op  (alu_op),
134     .zf  (zf),
135     .out (alu_out)
136   );
137 
138   /* memory */
139   memory memory_inst
140   (
141     .clk   (clk),
142     .rst_n (rst_n),
143     .we    (mem_we),
144     .in    (reg_data0),
145     .addr  (alu_out),
146     .out   (mem_out)
147   );
148 
149   /* push button */
150   pb pb_inst
151   (
152     .clk   (clk),
153     .rst_n (rst_n),
154     .addr  (alu_out),
155     .out   (pb_out),
156     .pb    (pb)
157   );
158 
159   /* led */
160   led led_inst
161   (
162     .clk   (clk),
163     .rst_n (rst_n),
164     .we    (mem_we),
165     .in    (reg_data0),
166     .addr  (alu_out),
167     .led   (led)
168   );
169 
170   /* program counter */
171   pc pc_inst
172   (
173     .clk    (clk),
174     .rst_n  (rst_n),
175     .pc_in  (pc_in),
176     .pc_out (pc_out)
177   );
178   assign pc_next = pc_out + 1;
179 
180   /* instruction memory */
181   imem imem_inst
182   (
183     .pc (pc_out),
184     .op (op)
185   );
186 
187   /* zero flag */
188   zf zf_inst (
189     .clk(clk),
190     .rst_n(rst_n),
191     .zf_in(zf),
192     .zf_out(zf_out)
193   );
194 
195   /* decoder */
196   decoder decoder_inst
197   (
198     .op     (op),
199     .zf     (zf_out),
200     .alu_op (alu_op),
201     .dst    (dst),
202     .src0   (src0),
203     .src1   (src1),
204     .data   (dec_data),
205     .reg_we (reg_we),
206     .mem_we (mem_we),
207     .reg0   (reg0),
208     .reg1   (reg1),
209     .jmp    (jmp),
210     .load   (load),
211     .link   (link)
212   );
213 
214 endmodule