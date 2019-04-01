module decoder_abc(
	input CLK,
	input [2:0] D,
	output reg [7:0] SEG
	);
	
	always @(posedge CLK)
	begin
		case(D)
			4'd0: SEG <= 8'b10100001;// d
			4'd1: SEG <= 8'b11111001;// i
			4'd2: SEG <= 8'b10000110;// E
			4'd3: SEG <= 8'b10101111;// r
			4'd4: SEG <= 8'b10001011;// h
			default: SEG <= 8'b11111111;
		endcase
	end
endmodule