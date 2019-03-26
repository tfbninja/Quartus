module Lab4 (SW, LEDR);
	// part 2
	input [9:0] SW;
	output [9:0] LEDR;
	
	wire s;
	wire [3:0] x, y, m;
	
	assign x = SW[3:0];
	assign y = SW[7:4];
	assign s = SW[9];
	
	assign m[0] = (s & x[0] | ~s & y[0]);
	assign m[1] = (s & x[1] | ~s & y[1]);
	assign m[2] = (s & x[2] | ~s & y[2]);
	assign m[3] = (s & x[3] | ~s & y[3]);
	
	assign LEDR[9] = s;
	assign LEDR[8:4] = 5'b0;
	assign LEDR[3:0] = m;
endmodule