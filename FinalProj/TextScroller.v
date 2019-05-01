module TextScroller(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	inout 		          		CLOCK4_50,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// KEY //////////
	input 		     [3:0]		KEY,
	input 		          		RESET_N,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

//=======================================================
//  Registers, wires, and constant assignments
//=======================================================

	reg [2:0] clickcount; //register to hold the count up to 7.
	wire click, RESET, dir, fastmode;
	reg [28:0] ticker; //to hold a count of 50M
	
	assign click = ((ticker == (fastmode ? 9000000 : 20000000))?1'b1:1'b0);
	assign RESET = ~KEY[3];
	assign dir = ~SW[9];
	assign fastmode = SW[8];
	assign LEDR[0] = RESET;
	assign LEDR[9] = ~dir;
	assign LEDR[8] = fastmode;
	assign LEDR[7:1] = 7'b0000000;
	
	
	reg [6:0] a, b, c, d, e, f;
	
	assign HEX5[6:0] = a;
	assign HEX4[6:0] = b;
	assign HEX3[6:0] = c;
	assign HEX2[6:0] = d;
	assign HEX1[6:0] = e;
	assign HEX0[6:0] = f;
	
	
	wire [6:0] S, C, R, O, L, SP;
	
	assign S = 7'b0010010; // S
	assign C = 7'b0100111; // c
	assign R = 7'b0101111; // r
	assign O = 7'b0100011; // o
	assign L = 7'b1000111; // L
	assign SP = 7'b1111111; // ' '	

	
//=======================================================
//  Clock loop to increment counter
//=======================================================
	always @ (posedge CLOCK_50 or posedge RESET)
		begin
			if(RESET)
				ticker <= 0;
			else if(ticker == (fastmode ? 9000000 : 20000000))
				ticker <= 0;
			else
				ticker <= ticker + 1;
		end

			
//=======================================================
//  Timed delay loop
//=======================================================
	always @ (posedge click or posedge RESET)
		begin
			if(RESET)
				clickcount <= 0;
			else if(clickcount == 6)
				clickcount <= 0;
			else 
				clickcount <= clickcount + 1;
		end

	
	
	
//=======================================================
//  Character placement loop
//=======================================================
	always @ (*)
		begin
			 case(clickcount)
			 0:
			 begin
				a <= S;
				b <= C;
				c <= R;
				d <= O;
				e <= L;
				f <= L;
			 end
			 
			 1:
			 begin
			 
			 if (dir)
			 begin
				a <= C;
				b <= R;
				c <= O;
				d <= L;
				e <= L;
				f <= SP;
			end
			else
			begin
				a <= 7'b0111100; // S
				b <= 7'b0011110; // c
				c <= 7'b1011110; // r
				d <= 7'b0011100; // o
				e <= 7'b0011111; // L
				f <= 7'b0011111; // L
			end
			end
			 
			 2:
			 begin
			 if (dir)
			 begin
				a <= R;
				b <= O;
				c <= L;
				d <= L;
				e <= SP;
				f <= S;
			end
			else
			begin
				a <= 7'b1111110; // S
				b <= 7'b1111110; // c
				c <= 7'b1111111; // r
				d <= 7'b1111110; // o
				e <= 7'b1111110; // L
				f <= 7'b1111110; // L
			end
			end
			 
			 3:
			 begin
			 if (dir)
			 begin
				a <= O;
				b <= L;
				c <= L;
				d <= SP;
				e <= S;
				f <= C;
			end
			else
			begin
				a <= SP;
				b <= SP;
				c <= SP;
				d <= SP;
				e <= SP;
				f <= SP;
			end
			 end
			 
			 4:
			 begin
			 if (dir)
			 begin
				a <= L;
				b <= L;
				c <= SP;
				d <= S;
				e <= C;
				f <= R;
			end
			else
			begin
				a <= SP;
				b <= SP;
				c <= SP;
				d <= SP;
				e <= SP;
				f <= SP;
			end
			end
			 
			 5:
			 begin
			 if (dir)
			 begin
				a <= L;
				b <= SP;
				c <= S;
				d <= C;
				e <= R;
				f <= O;
			end
			else
			begin
				a <= 7'b1110111; // S
				b <= 7'b1111111; // c
				c <= 7'b1111111; // r
				d <= 7'b1111111; // o
				e <= 7'b1111111; // L
				f <= 7'b1111111; // L
			end
			end
			 
			 6:
			 begin
			 if (dir)
			 begin
				a <= SP;
				b <= S;
				c <= C;
				d <= R;
				e <= O;
				f <= L;
			end
			else
			begin
				a <= 7'b0100111; // S
				b <= 7'b1110111; // c
				c <= 7'b1110111; // r
				d <= 7'b1110111; // o
				e <= 7'b1101111; // L
				f <= 7'b1101111; // L
			end
			end
  endcase
end

endmodule
