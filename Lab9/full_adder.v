module full_adder(S, C, x, y, cin);
	input x, y, cin;
	output S, C;
	
	wire S1, C1, C2;
	
	half_adder(x, y, C1, S1);
	half_adder(S1, cin, C2, S);
	assign C = C1 | C2;
endmodule
