module test(

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

	wire click, COUNT, RESET;
	assign COUNT = CLOCK_50;
	assign RESET = KEY[3];
	scrolling_name(CLOCK_50, RESET, HEX0[0], HEX0[1], LEDR[2], LEDR[3], LEDR[4], LEDR[5], LEDR[6], LEDR[7], HEX2[3:0]);

//=======================================================
//  Structural coding
//=======================================================

endmodule
