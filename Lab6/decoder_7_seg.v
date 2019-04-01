module decoder_7_seg(
	input CLK,
	input [3:0] D,
	output reg [6:0] SEG
	);
	
	always @(posedge CLK)
	begin
		case(D)
			4'd0: SEG <= 8'b11000000;
			4'd1: SEG <= 8'b11111001;
			4'd2: SEG <= 8'b10100100;
			4'd3: SEG <= 8'b10110000;
			4'd4: SEG <= 8'b10011001;
			4'd5: SEG <= 8'b10010010;
			4'd6: SEG <= 8'b10000010;
			4'd7: SEG <= 8'b11111000;
			4'd8: SEG <= 8'b10000000;
			4'd9: SEG <= 8'b10010000;
			default: SEG <= 8'b11111111;
		endcase
	end
endmodule