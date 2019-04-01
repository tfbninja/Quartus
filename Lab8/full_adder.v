module full_adder(x, y, cin, S, C);
	input x, y, cin;
	output S, C;
	
	wire S1, C1, C2;
	
	half_adder(x, y, C1, S1);
	half_adder(S1, C1, C2, S);
	assign C = C1 | C2;
endmodule
