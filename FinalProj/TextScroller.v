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
	//output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

//=======================================================
//  REG/WIRE declarations
//=======================================================



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
