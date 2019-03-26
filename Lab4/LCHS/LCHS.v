
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module LCHS(

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

	wire on, off;
	assign on = 5'b0; // backwards because the 7-seg displays are weird...idk
	assign off = !on;

//=======================================================
//  Structural coding
//=======================================================

	assign HEX3[0] = off;
	assign HEX3[1] = off;
	assign HEX3[2] = off;
	assign HEX3[3] = on;
	assign HEX3[4] = on;
	assign HEX3[5] = on;
	assign HEX3[6] = off;
	
	assign HEX2[0] = on;
	assign HEX2[1] = off;
	assign HEX2[2] = off;
	assign HEX2[3] = on;
	assign HEX2[4] = on;
	assign HEX2[5] = on;
	assign HEX2[6] = off;
	
	assign HEX1[0] = off;
	assign HEX1[1] = on;
	assign HEX1[2] = on;
	assign HEX1[3] = off;
	assign HEX1[4] = on;
	assign HEX1[5] = on;
	assign HEX1[6] = on;
	
	assign HEX0[0] = on;
	assign HEX0[1] = off;
	assign HEX0[2] = on;
	assign HEX0[3] = on;
	assign HEX0[4] = off;
	assign HEX0[5] = on;
	assign HEX0[6] = on;

endmodule
