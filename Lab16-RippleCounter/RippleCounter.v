module RippleCounter(

	//////////// KEY //////////
	input 		     [3:0]		KEY,
	
	//////////// LED //////////
	output		     [9:0]		LEDR
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

	wire A0, A1, A2, A3, A4, A5, A6, A7, A8, ONE, COUNT, RESET;
	
	assign ONE = 1'b1;
	assign COUNT = ~KEY[0]; // inverse logic
	assign RESET = KEY[3];
	


//=======================================================
//  Structural coding
//=======================================================

	T_FlipFlop(ONE, COUNT, RESET, A0);
	T_FlipFlop(ONE, A0, RESET, A1);
	T_FlipFlop(ONE, A1, RESET, A2);
	T_FlipFlop(ONE, A2, RESET, A3);
	T_FlipFlop(ONE, A3, RESET, A4);
	T_FlipFlop(ONE, A4, RESET, A5);
	T_FlipFlop(ONE, A5, RESET, A6);
	T_FlipFlop(ONE, A6, RESET, A7);
	T_FlipFlop(ONE, A7, RESET, A8);
	
	assign LEDR[0] = ~A0;
	assign LEDR[1] = ~A1;
	assign LEDR[2] = ~A2;
	assign LEDR[3] = ~A3;
	assign LEDR[4] = ~A4;
	assign LEDR[5] = ~A5;
	assign LEDR[6] = ~A6;
	assign LEDR[7] = ~A7;
	assign LEDR[8] = ~A8;


endmodule
