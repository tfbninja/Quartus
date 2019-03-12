module LCD(KEY, HEX0, HEX1, LEDR);
	input [3:0] KEY;
	output [6:0] HEX0;
	output [2:1] HEX1;
	output [9:0] LEDR;
	
	wire a,b,c,d;
	assign a = KEY[0];
	assign b = KEY[1];
	assign c = KEY[2];
	assign d = KEY[3];
	
	assign HEX0[0] = (a ~^  c) | (b ^ d);
	assign HEX0[1] = (~c) | ((a ~| b)) | (a & (b ^ d));
	assign HEX0[2] = a | (b & c) | (~c & d) | ((b ~| d));
	assign HEX0[3] = ~a & (~c | (b & ~d)) | (~c & (b ^ d)) | (a & c & (~b | d));
	assign HEX0[4] = ~a & (b ^ d) | (~c & d);
	assign HEX0[5] = (~b & (c ^ d)) |  (b & ((c & d) | (~a & (c | d))));
	assign HEX0[6] = (c & (~b | ~a | d)) | ((b ^ d) & (~b & d | ~c));
	assign HEX1[1] = d & (b | c);
	assign HEX1[2] = d & (b | c);
	
	assign LEDR[0] = a;
	assign LEDR[1] = b;
	assign LEDR[2] = c;
	assign LEDR[3] = d;
endmodule