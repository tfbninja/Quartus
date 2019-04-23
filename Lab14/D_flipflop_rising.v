module D_flipflop_rising(input D, input Clk, output reg Q);
	always @(posedge Clk)
		begin
			Q <= D;
		end
endmodule
