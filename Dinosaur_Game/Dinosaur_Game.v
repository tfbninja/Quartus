module Dinosaur_Game(

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
	
	/////////// GPIO //////////
	input [35:0] GPIO_0,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// microSD Card //////////
	output		          		SD_CLK,
	inout 		          		SD_CMD,
	inout 		     [3:0]		SD_DATA,

	//////////// SW //////////
	input 		     [9:0]		SW
);


//=======================================================
//  REG/WIRE declarations
//=======================================================

	wire [6:0] player_bottom, player_top, off, cactus, bird, player_b_;
	assign player_bottom = 7'b0100011;
	assign player_top = 7'b0011100;
	assign off = 7'b1111111;
	assign cactus = 7'b1110111;
	assign bird = 7'b1111110;
	wire [99:0] score;
	
	wire [100:0] random;
	assign random = 101'b01011001000001111111100000111101100001111101010010011001110011001111101101001001101000100011110010010;
	
	wire a, b, c, d, e, f;
	wire jump = ~KEY[3];
	assign LEDR[0] = jump;
	assign LEDR[1] = jump;
	assign LEDR[2] = jump;
	assign HEX5[6:0] = jump ? player_top : player_bottom;
	
	

//=======================================================
//  Structural coding
//=======================================================



endmodule
