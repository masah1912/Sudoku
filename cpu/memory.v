`timescale 1ps/1ps

module memory
(
  input  wire       clk,
  input  wire       rst_n,
  input  wire       we,
  input  wire [7:0] in,
  input  wire [7:0] addr,
  output wire [7:0] out,

  //debug
  output wire [7:0] debug_memory0,
  output wire [7:0] debug_memory1,
  output wire [7:0] debug_memory2,
  output wire [7:0] debug_memory3,
  output wire [7:0] debug_memory4,
  output wire [7:0] debug_memory5,
  output wire [7:0] debug_memory6,
  output wire [7:0] debug_memory7,
  output wire [7:0] debug_memory8,
  output wire [7:0] debug_memory9,
  output wire [7:0] debug_memory10,
  output wire [7:0] debug_memory11,
  output wire [7:0] debug_memory12,
  output wire [7:0] debug_memory13,
  output wire [7:0] debug_memory14,
  output wire [7:0] debug_memory15,
  output wire [7:0] debug_memory16,
  output wire [7:0] debug_memory17,
  output wire [7:0] debug_memory18,
  output wire [7:0] debug_memory19,
  output wire [7:0] debug_memory20,
  output wire [7:0] debug_memory21,
  output wire [7:0] debug_memory22,
  output wire [7:0] debug_memory23,
  output wire [7:0] debug_memory24,
  output wire [7:0] debug_memory25,
  output wire [7:0] debug_memory26,
  output wire [7:0] debug_memory27,
  output wire [7:0] debug_memory28,
  output wire [7:0] debug_memory29,
  output wire [7:0] debug_memory30,
  output wire [7:0] debug_memory31,
  output wire [7:0] debug_memory32,
  output wire [7:0] debug_memory33,
  output wire [7:0] debug_memory34,
  output wire [7:0] debug_memory35,
  output wire [7:0] debug_memory36,
  output wire [7:0] debug_memory37,
  output wire [7:0] debug_memory38,
  output wire [7:0] debug_memory39,
  output wire [7:0] debug_memory40,
  output wire [7:0] debug_memory41,
  output wire [7:0] debug_memory42,
  output wire [7:0] debug_memory43,
  output wire [7:0] debug_memory44,
  output wire [7:0] debug_memory45,
  output wire [7:0] debug_memory46,
  output wire [7:0] debug_memory47,
  output wire [7:0] debug_memory48,
  output wire [7:0] debug_memory49,
  output wire [7:0] debug_memory50,
  output wire [7:0] debug_memory51,
  output wire [7:0] debug_memory52,
  output wire [7:0] debug_memory53,
  output wire [7:0] debug_memory54,
  output wire [7:0] debug_memory55,
  output wire [7:0] debug_memory56,
  output wire [7:0] debug_memory57,
  output wire [7:0] debug_memory58,
  output wire [7:0] debug_memory59,
  output wire [7:0] debug_memory60,
  output wire [7:0] debug_memory61,
  output wire [7:0] debug_memory62,
  output wire [7:0] debug_memory63,
  output wire [7:0] debug_memory64,
  output wire [7:0] debug_memory65,
  output wire [7:0] debug_memory66,
  output wire [7:0] debug_memory67,
  output wire [7:0] debug_memory68,
  output wire [7:0] debug_memory69,
  output wire [7:0] debug_memory70,
  output wire [7:0] debug_memory71,
  output wire [7:0] debug_memory72,
  output wire [7:0] debug_memory73,
  output wire [7:0] debug_memory74,
  output wire [7:0] debug_memory75,
  output wire [7:0] debug_memory76,
  output wire [7:0] debug_memory77,
  output wire [7:0] debug_memory78,
  output wire [7:0] debug_memory79,
  output wire [7:0] debug_memory80
);

  integer i;
  reg [7:0] mem [255:0];

  always @(posedge clk) begin
    if (!rst_n) begin
      for(i = 0; i < 33; i = i + 1) begin
        mem[i] <= 8'h0;
      end

                                 mem[0] <= 8'd0;
                                 mem[1] <= 8'd2;
                                 mem[2] <= 8'd0;
                                 mem[3] <= 8'd0;
                                 mem[4] <= 8'd0;
                                 mem[5] <= 8'd0;
                                 mem[6] <= 8'd8;
                                 mem[7] <= 8'd0;
                                 mem[8] <= 8'd4;
 
                                 mem[9]  <= 8'd6;
                                 mem[10] <= 8'd0;
                                 mem[11] <= 8'd0;
                                 mem[12] <= 8'd0;
                                 mem[13] <= 8'd1;
                                 mem[14] <= 8'd0;
                                 mem[15] <= 8'd0;
                                 mem[16] <= 8'd0;
                                 mem[17] <= 8'd0;
 
                                 mem[18] <= 8'd0;
                                 mem[19] <= 8'd9;
                                 mem[20] <= 8'd7;
                                 mem[21] <= 8'd0;
                                 mem[22] <= 8'd3;
                                 mem[23] <= 8'd0;
                                 mem[24] <= 8'd0;
                                 mem[25] <= 8'd0;
                                 mem[26] <= 8'd0;
 
                                 mem[27] <= 8'd3;
                                 mem[28] <= 8'd5;
                                 mem[29] <= 8'd0;
                                 mem[30] <= 8'd1;
                                 mem[31] <= 8'd0;
                                 mem[32] <= 8'd4;
                                 mem[33] <= 8'd2;
                                 mem[34] <= 8'd0;
                                 mem[35] <= 8'd0;
 
                                 mem[36] <= 8'd0;
                                 mem[37] <= 8'd6;
                                 mem[38] <= 8'd8;
                                 mem[39] <= 8'd3;
                                 mem[40] <= 8'd0;
                                 mem[41] <= 8'd7;
                                 mem[42] <= 8'd0;
                                 mem[43] <= 8'd9;
                                 mem[44] <= 8'd0;
 
                                 mem[45] <= 8'd0;
                                 mem[46] <= 8'd4;
                                 mem[47] <= 8'd0;
                                 mem[48] <= 8'd9;
                                 mem[49] <= 8'd5;
                                 mem[50] <= 8'd8;
                                 mem[51] <= 8'd0;
                                 mem[52] <= 8'd0;
                                 mem[53] <= 8'd0;
 
                                 mem[54] <= 8'd8;
                                 mem[55] <= 8'd7;
                                 mem[56] <= 8'd6;
                                 mem[57] <= 8'd2;
                                 mem[58] <= 8'd4;
                                 mem[59] <= 8'd3;
                                 mem[60] <= 8'd0;
                                 mem[61] <= 8'd0;
                                 mem[62] <= 8'd1;
 
                                 mem[63] <= 8'd2;
                                 mem[64] <= 8'd0;
                                 mem[65] <= 8'd0;
                                 mem[66] <= 8'd5;
                                 mem[67] <= 8'd9;
                                 mem[68] <= 8'd1;
                                 mem[69] <= 8'd6;
                                 mem[70] <= 8'd7;
                                 mem[71] <= 8'd0;
 
                                 mem[72] <= 8'd9;
                                 mem[73] <= 8'd1;
                                 mem[74] <= 8'd0;
                                 mem[75] <= 8'd7;
                                 mem[76] <= 8'd8;
                                 mem[77] <= 8'd6;
                                 mem[78] <= 8'd3;
                                 mem[79] <= 8'd4;
                                 mem[80] <= 8'd0;
 
                                 mem[81] <= 8'd0;
                                 mem[82] <= 8'd0;
                                 mem[83] <= 8'd0;
                                 mem[84] <= 8'd0;
                                 mem[85] <= 8'd0;
                                 mem[86] <= 8'd0;
                                 mem[87] <= 8'd0;
                                 mem[88] <= 8'd0;
                                 mem[89] <= 8'd0;
 
                                 mem[90] <= 8'd0;
                                 mem[91] <= 8'd0;
                                 mem[92] <= 8'd0;
                                 mem[83] <= 8'd0;
                                 mem[94] <= 8'd0;
                                 mem[95] <= 8'd0;
                                 mem[96] <= 8'd0;
                                 mem[97] <= 8'd0;
                                 mem[98] <= 8'd0;
 
                                 mem[99] <= 8'd0;
                                 mem[100] <= 8'd0;
                                 mem[101] <= 8'd0;
                                 mem[102] <= 8'd0;
                                 mem[103] <= 8'd0;
                                 mem[104] <= 8'd0;
                                 mem[105] <= 8'd0;
                                 mem[106] <= 8'd0;
                                 mem[107] <= 8'd0;
 
                                 mem[108] <= 8'd0;
                                 mem[109] <= 8'd0;
                                 mem[110] <= 8'd0;
                                 mem[111] <= 8'd0;
                                 mem[112] <= 8'd0;
                                 mem[113] <= 8'd0;
                                 mem[114] <= 8'd0;
                                 mem[115] <= 8'd0;
                                 mem[116] <= 8'd0;
 
                                 mem[117] <= 8'd0;
                                 mem[118] <= 8'd0;
                                 mem[119] <= 8'd0;
                                 mem[120] <= 8'd0;
                                 mem[121] <= 8'd0;
                                 mem[122] <= 8'd0;
                                 mem[123] <= 8'd0;
                                 mem[124] <= 8'd0;
                                 mem[125] <= 8'd0;
 
                                 mem[126] <= 8'd0;
                                 mem[127] <= 8'd0;
                                 mem[128] <= 8'd0;
                                 mem[129] <= 8'd0;
                                 mem[130] <= 8'd0;
                                 mem[131] <= 8'd0;
                                 mem[132] <= 8'd0;
                                 mem[133] <= 8'd0;
                                 mem[134] <= 8'd0;
 
                                 mem[135] <= 8'd0;
                                 mem[136] <= 8'd0;
                                 mem[137] <= 8'd0;
                                 mem[138] <= 8'd0;
                                 mem[139] <= 8'd0;
                                 mem[140] <= 8'd0;
                                 mem[141] <= 8'd0;
                                 mem[142] <= 8'd0;
                                 mem[143] <= 8'd0;
 
                                 mem[144] <= 8'd0;
                                 mem[145] <= 8'd0;
                                 mem[146] <= 8'd0;
                                 mem[147] <= 8'd0;
                                 mem[148] <= 8'd0;
                                 mem[149] <= 8'd0;
                                 mem[150] <= 8'd0;
                                 mem[151] <= 8'd0;
                                 mem[152] <= 8'd0;
 
                                 mem[153] <= 8'd0;
                                 mem[154] <= 8'd0;
                                 mem[155] <= 8'd0;
                                 mem[156] <= 8'd0;
                                 mem[157] <= 8'd0;
                                 mem[158] <= 8'd0;
                                 mem[159] <= 8'd0;
                                 mem[160] <= 8'd0;
                                 mem[161] <= 8'd0;

								// LED pattern
                                mem[215] <= 8'b11000000; //0
                                mem[216] <= 8'b11111001; //1
                                mem[217] <= 8'b10100100; //2
                                mem[218] <= 8'b10110000; //3
                                mem[219] <= 8'b10011001; //4
                                mem[220] <= 8'b10010010; //5
                                mem[221] <= 8'b10000010; //6
                                mem[222] <= 8'b11011000; //7
                                mem[223] <= 8'b10000000; //8
                                mem[224] <= 8'b10010000; //9

      for(i = 225; i < 256; i = i + 1) begin
        mem[i] <= 8'h0;
      end
    end else begin
      if (we) begin
        mem[addr] <= in;
      end
    end
  end

  assign out = mem[addr];
  
  //debug
  assign debug_memory0 = mem[0];
  assign debug_memory1 = mem[1];
  assign debug_memory2 = mem[2];
  assign debug_memory3 = mem[3];
  assign debug_memory4 = mem[4];
  assign debug_memory5 = mem[5];
  assign debug_memory6 = mem[6];
  assign debug_memory7 = mem[7];
  assign debug_memory8 = mem[8];
  assign debug_memory9 = mem[9];
  assign debug_memory10 = mem[10];
  assign debug_memory11 = mem[11];
  assign debug_memory12 = mem[12];
  assign debug_memory13 = mem[13];
  assign debug_memory14 = mem[14];
  assign debug_memory15 = mem[15];
  assign debug_memory16 = mem[16];
  assign debug_memory17 = mem[17];
  assign debug_memory18 = mem[18];
  assign debug_memory19 = mem[19];
  assign debug_memory20 = mem[20];
  assign debug_memory21 = mem[21];
  assign debug_memory22 = mem[22];
  assign debug_memory23 = mem[23];
  assign debug_memory24 = mem[24];
  assign debug_memory25 = mem[25];
  assign debug_memory26 = mem[26];
  assign debug_memory27 = mem[27];
  assign debug_memory28 = mem[28];
  assign debug_memory29 = mem[29];
  assign debug_memory30 = mem[30];
  assign debug_memory31 = mem[31];
  assign debug_memory32 = mem[32];
  assign debug_memory33 = mem[33];
  assign debug_memory34 = mem[34];
  assign debug_memory35 = mem[35];
  assign debug_memory36 = mem[36];
  assign debug_memory37 = mem[37];
  assign debug_memory38 = mem[38];
  assign debug_memory39 = mem[39];
  assign debug_memory40 = mem[40];
  assign debug_memory41 = mem[41];
  assign debug_memory42 = mem[42];
  assign debug_memory43 = mem[43];
  assign debug_memory44 = mem[44];
  assign debug_memory45 = mem[45];
  assign debug_memory46 = mem[46];
  assign debug_memory47 = mem[47];
  assign debug_memory48 = mem[48];
  assign debug_memory49 = mem[49];
  assign debug_memory50 = mem[50];
  assign debug_memory51 = mem[51];
  assign debug_memory52 = mem[52];
  assign debug_memory53 = mem[53];
  assign debug_memory54 = mem[54];
  assign debug_memory55 = mem[55];
  assign debug_memory56 = mem[56];
  assign debug_memory57 = mem[57];
  assign debug_memory58 = mem[58];
  assign debug_memory59 = mem[59];
  assign debug_memory60 = mem[60];
  assign debug_memory61 = mem[61];
  assign debug_memory62 = mem[62];
  assign debug_memory63 = mem[63];
  assign debug_memory64 = mem[64];
  assign debug_memory65 = mem[65];
  assign debug_memory66 = mem[66];
  assign debug_memory67 = mem[67];
  assign debug_memory68 = mem[68];
  assign debug_memory69 = mem[69];
  assign debug_memory70 = mem[70];
  assign debug_memory71 = mem[71];
  assign debug_memory72 = mem[72];
  assign debug_memory73 = mem[73];
  assign debug_memory74 = mem[74];
  assign debug_memory75 = mem[75];
  assign debug_memory76 = mem[76];
  assign debug_memory77 = mem[77];
  assign debug_memory78 = mem[78];
  assign debug_memory79 = mem[79];
  assign debug_memory80 = mem[80];

endmodule
