module gated_sr_latch(input Enable, input S, input R, output Q, output Qbar);
	wire internal_R, internal_S;
	assign internal_R = R & Enable;
	assign internal_S = S & Enable;
	assign Q = ~ (internal_R | Qbar);
	assign Qbar = ~ (internal_S | Q);
endmodule