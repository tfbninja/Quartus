
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module d_latch_test(

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

//=======================================================
//  Structural coding
//=======================================================
	D_latch_behavior(SW[0], SW[1], LEDR[1], LEDR[0]);

endmodule
