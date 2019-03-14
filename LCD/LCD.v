module LCD(KEY, HEX0, HEX1, LEDR);
	input [3:0] KEY;
	output [6:0] HEX0;
	output [2:1] HEX1;
	output [3:0] LEDR;
	
	wire a,b,c,d;
	assign a = KEY[0];
	assign b = KEY[1];
	assign c = KEY[2];
	assign d = KEY[3];
	wire A,B,C,D,E,F,G,H,I,J,K,L,M,N,O, Z;
	assign A = ~a & ~b & ~c & ~d;
	assign B = ~a & ~b & ~c & d;
	assign C = ~a & ~b & c & ~d;
	assign D = ~a & ~b & c & d;
	assign E = ~a & b & ~c & ~d;
	assign F = ~a & b & ~c & d;
	assign G = ~a & b & c & ~d;
	assign H = ~a & b & c & d;
	assign I = a & ~b & ~c & ~d;
	assign J = a & ~b & ~c & d;
	assign K = a & ~b & c & ~d;
	assign L = a & ~b & c & d;
	assign M = a & b & ~c & ~d;
	assign N = a & b & ~c & d;
	assign O = a & b & c & ~d;
	assign P = a & b & c & d;
	assign Z = a & ~a;
	// 0 A
	// 1 B
	// 2 C
	// 3 D
	// 4 E
	// 5 F
	// 6 G
	// 7 H
	// 8 I
	// 9 J
	//10 K
	//11 L
	//12 M
	//13 N
	//14 O
	//15 P
	
	assign HEX0[0] = ~(A | B | E | L | O);
	assign HEX0[1] = ~(A | F | G | P);
	assign HEX0[2] = ~(A | C | M);
	assign HEX0[3] = ~(A | B | E | H | J | L | O | P);
	assign HEX0[4] =  (C | G | I | J | K | O | P);
	assign HEX0[5] =  (E | F | G | I | J | K | O | P);
	assign HEX0[6] = ~(A | B | H | K | L);
	assign HEX1[1] = d & (b | c);
	assign HEX1[2] = d & (b | c);
	
	assign LEDR[0] = ~a;
	assign LEDR[1] = ~b;
	assign LEDR[2] = ~c;
	assign LEDR[3] = ~d;

endmodule