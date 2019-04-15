module D_latch_behavior(input D, input Enable, output reg Q, output reg Qbar);
	always @ (D or Enable)
		if(Enable)
		begin
			Q <= D;
			Qbar <= ~D;
		end
endmodule