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

	wire [6:0] player_bottom, player_top, off, cactus, bird, player_bottom_bird, player_top_cactus;
	wire [6:0] disp0, disp1, disp2, disp3, disp4, disp5;
	assign player_bottom = 7'b0100011;
	assign player_top = 7'b0011100;
	assign player_bottom_bird = 7'b0100010;
	assign player_top_cactus = 7'b0010100;
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
	//assign HEX5[6:0] = jump ? player_top : player_bottom;
	
	
//=======================================================
//  Timing
//=======================================================
	wire game_over;
	reg [28:0] counter;
	assign LEDR[9] = counter[0];
	assign LEDR[9] = counter[10];
	reg [3:0] loop_ticker; // can hold up to 15
	wire [6:0] state5, state4, state3, state2, state1, state0;
	wire game_clock;
	wire [28:0] game_speed;
	assign game_speed = 20000000;
	assign game_clock = counter == game_speed;
	
	always @ (posedge CLOCK_50)
		begin
			if (counter > game_speed)
				counter <= 0;
			else 				
				counter <= counter + 1;
		end
		
	always @ (posedge game_clock)
		begin
			if(loop_ticker == 10)
				begin
					loop_ticker <= 0;
					assign HEX0[6:0] = counter[0] ? cactus : bird;
				end
			else 
				loop_ticker <= loop_ticker + 1;
			
			if (jump)
				begin
					if (state4 == bird)
						begin
							// lose
							LEDR[9:0] <= 10'b0101010101;
						end
					else
					HEX5[6:0] <= state4 == cactus ? player_top_cactus : player_top;
				end
			else
				begin
					if (state4 == cactus)
						begin
							// lose
							LEDR[9:0] <= 10'b0101010101;
						end
					else
					HEX5 <= state4 == bird ? player_bottom_bird : player_bottom;
				end
			disp4[6:0] <= state3;
			disp3[6:0] <= state2;
			disp2[6:0] <= state1;
			disp1[6:0] <= state0;
			
		end
	
	always @ (negedge game_clock)
		begin
			state5 <= HEX5;
			state4 <= HEX4;
			state3 <= HEX3;
			state2 <= HEX2;
			state1 <= HEX1;
			state0 <= HEX0;
		end





endmodule
