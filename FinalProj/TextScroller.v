module TextScroller(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	inout 		          		CLOCK4_50,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// KEY //////////
	input 		     [3:0]		KEY,
	input 		          		RESET_N,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

	wire A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, ONE, COUNT, RESET;
	
	assign ONE = 1'b1;
	assign COUNT = CLOCK_50;
	assign RESET = KEY[3];

	T_FlipFlop(ONE, COUNT, RESET, A0);
	T_FlipFlop(ONE, A0, RESET, A1);
	T_FlipFlop(ONE, A1, RESET, A2);
	T_FlipFlop(ONE, A2, RESET, A3);
	T_FlipFlop(ONE, A3, RESET, A4);
	T_FlipFlop(ONE, A4, RESET, A5);
	T_FlipFlop(ONE, A5, RESET, A6);
	T_FlipFlop(ONE, A6, RESET, A7);
	T_FlipFlop(ONE, A7, RESET, A8);
	T_FlipFlop(ONE, A8, RESET, A9);
	T_FlipFlop(ONE, A9, RESET, A10);
	T_FlipFlop(ONE, A10, RESET, A11);
	T_FlipFlop(ONE, A11, RESET, A12);
	T_FlipFlop(ONE, A12, RESET, A13);
	T_FlipFlop(ONE, A13, RESET, A14);
	T_FlipFlop(ONE, A14, RESET, A15);
	T_FlipFlop(ONE, A15, RESET, A16);
	assign LEDR[0] = ~A8;
	assign LEDR[9:1] = 8'b00000000;

//=======================================================
//  Structural coding
//=======================================================

	assign HEX5[6:0] = 7'b10010010; // S
	assign HEX4[6:0] = 7'b10100111; // c
	assign HEX3[6:0] = 7'b10101111; // r
	assign HEX2[6:0] = 7'b10100011; // o
	assign HEX1[6:0] = 7'b11000111; // L
	assign HEX0[6:0] = 7'b11000111; // L

endmodule
