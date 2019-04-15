module sr_latch_with_gates(input S, input R, output Q, output Qbar);
	nor(Q, R, Qbar);
	nor(Qbar, S, Q);
endmodule
