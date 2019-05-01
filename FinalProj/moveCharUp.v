module moveCharUp(input [6:0] char, input [2:0] amt, input up, output reg [6:0] newChar);
	always @ (*)
		begin
		// b 0  1  0  0  1  0  1
		//   0  1  2  3  4  5  6
		// ----------------------
		//   m        b        t
		//   i        o        o
		//   d        t        p
			 case(amt)
			 0:  newChar[6:0] <= char[6:0];			 
			 1:
			 begin
				if (up)
					begin
					newChar[6] <= char[0]; // make mid top
					newChar[0] <= char[3]; // make bot mid
					 newChar[4:2] <= 3'b111; // make new bot off
					 newChar[5] <= char[4];
					 newChar[1] <= char[2];
					end
				else
					begin
					 newChar[1] <= 1'b1;
					 newChar[6:5] <= 2'b11;
					 newChar[0] <= char[6]; // make top mid
					 newChar[3] <= char[0]; // make mid bot
					 newChar[4] <= char[5];
					 newChar[2] <= char[1];
					end
			end
			2:
			begin
				if (up)
					begin
					 newChar[6] <= char[3]; // make bot top
					 newChar[5:0] <= 6'b111111; // turn off others
					end
				else
					begin
					 newChar[3] <= char[6]; // make top bot
					 newChar[2:0] <= 3'b111;
					 newChar[6:4] <= 3'b111;
					end
			end
			3:	 newChar[6:0] <= 7'b1111111;
  endcase
  end
 endmodule
 