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
	
	assign HEX0[0] = (a xnor c) or (b xor d);
	assign HEX0[1] = ~c or (a nor b) or (a and (b xor d));
	assign HEX0[2] = a or (b and c) or (~c and d) or (b nor d);
	assign HEX0[3] = ~a and (~c or (b and ~d)) or (~c and (b xor d)) or (a and c and (~b or d);
	assign HEX0[4] = ~a and (b xor d) or (~c and d);
	assign HEX0[5] = (~b and (c xor d)) or  (b and ((c and d) or (~a and (c or d))));
	assign HEX0[6] = 
	assign HEX1[1] = d and (b or c);
	assign HEX1[2] = d and (b or c);
	
	assign LEDR[0] = a;
	assign LEDR[1] = b;
	assign LEDR[2] = c;
	assign LEDR[3] = d;
endmodule