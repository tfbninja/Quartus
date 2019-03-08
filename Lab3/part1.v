module part1 (SW, LEDR, KEY, HEX0);
	input [9:0] SW; // slide switches
	output [9:0] LEDR; // red LEDs
	
	assign LEDR = SW;
	
	input [0:3] KEY; // buttons
	output [0:3] HEX0; // digital display
	
	assign HEX0 = KEY;
endmodule