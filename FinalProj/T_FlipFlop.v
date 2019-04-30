module T_FlipFlop(T, Clock, Resetn, Q);
	input T, Clock, Resetn;
	output reg Q;
	
	always @(posedge Clock)
		if (Resetn == 1'b0) // synchronous clear
			Q <= 1'b1;
		else if (T)
			Q <= ~Q;
endmodule
