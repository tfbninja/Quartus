module L4_P3(

	//////////// LED //////////
	output [9:0]LEDR,

	//////////// SW //////////
	input [9:0]SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
	wire [1:0]a;
   wire [1:0]b;
	wire [1:0]c;
	wire x, y;
	assign x = SW[9];
	assign y = SW[8];
	assign a[1:0] = SW[1:0];
	assign b[1:0] = SW[3:2];
	assign c[1:0] = SW[5:4];
	

//=======================================================  x & !y = a
//  Structural coding                                      x &  y = b
//======================================================= !x &  y = c
	assign LEDR[9] = x;
	assign LEDR[8] = y;
	assign LEDR[0] = (x & !y & a[0]) | (x & y & b[0]) | (!x & y & c[0]);
	assign LEDR[1] = (x & !y & a[1]) | (x & y & b[1]) | (!x & y & c[1]);

endmodule