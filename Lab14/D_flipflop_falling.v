module D_flipflop_falling(input D, input Clk, output reg Q);
	always @(negedge Clk)
		begin
			Q <= D; 
		end
endmodule
