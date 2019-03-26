module LCD(KEY, HEX0, HEX1, HEX3, LEDR);
	input [3:0] KEY;
	output [6:0] HEX0;
	output [2:1] HEX1;
	output [3:0] LEDR;
	output [6:0] HEX3;
	
	wire a,b,c,d;
	assign d = ~KEY[0];
	assign c = ~KEY[1];
	assign b = ~KEY[2];
	assign a = ~KEY[3];
	wire A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Z;
	assign A = ~a & ~b & ~c & ~d;
	assign B = ~a & ~b & ~c &  d;
	assign C = ~a & ~b &  c & ~d;
	assign D = ~a & ~b &  c &  d;
	assign E = ~a &  b & ~c & ~d;
	assign F = ~a &  b & ~c &  d;
	assign G = ~a &  b &  c & ~d;
	assign H = ~a &  b &  c &  d;
	assign I =  a & ~b & ~c & ~d;
	assign J =  a & ~b & ~c &  d;
	assign K =  a & ~b &  c & ~d;
	assign L =  a & ~b &  c &  d;
	assign M =  a &  b & ~c & ~d;
	assign N =  a &  b & ~c &  d;
	assign O =  a &  b &  c & ~d;
	assign P =  a &  b &  c &  d;
	// 0 A 0
	// 1 B 1
	// 2 C 2
	// 3 D 3
	// 4 E 4
	// 5 F 5
	// 6 G 6
	// 7 H 7
	// 8 I 8
	// 9 J 9
	//10 K A
	//11 L B
	//12 M C
	//13 N D
	//14 O E
	//15 P F
	
	assign HEX0[0] = (A | B | E | L | O);
	assign HEX0[1] = (A | F | G | P);
	assign HEX0[2] = (A | C | M);
	assign HEX0[3] = (A | B | E | H | L | O);
	assign HEX0[4] = ~(C | G | I | K | M);
	assign HEX0[5] = ~(E | F | G | I | J | K | O | P);
	assign HEX0[6] = (A | B | H | K | L);
	assign HEX1[1] = ~(a & (b | c));
	assign HEX1[2] = ~(a & (b | c));
	
	assign HEX3[0] = ~(C | D | F | G | H | I | J | K | M | O | P);
	assign HEX3[1] = ~(B | C | D | E | H | I | J | K | N);
	assign HEX3[2] = ~(B | D | E | F | G | H | I | J | K | L | N);
	assign HEX3[3] = ~(C | D | F | G | I | J | L | M | N | O);
	assign HEX3[4] = ~(C | G | I | K | L | M | N | O | P);
	assign HEX3[5] = ~(E | F | G | I | J | K | L | M | O | P);
	assign HEX3[6] = ~(C | D | E | F | G | I | J | K | L | N | O | P);
	
	assign LEDR[0] = d;
	assign LEDR[1] = c;
	assign LEDR[2] = b;
	assign LEDR[3] = a;

endmodule