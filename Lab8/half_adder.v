module half_adder(x, y, C, S);
	input x, y;
	output C;
	output S;
		
	assign C = x & y;
	assign S = x ^ y;
endmodule
