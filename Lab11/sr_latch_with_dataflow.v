module sr_latch_with_dataflow(input S, input R, output Q, output Qbar);
	assign Q = ~ (R | Qbar);
	assign Qbar = ~ (S | Q);
endmodule
