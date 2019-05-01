module scrolling_name(
    input clock,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp,
    output [3:0] an
    );

reg [28:0] ticker; //to hold a count of 50M
wire click;
reg [3:0] fourth, third, second, first; // registers to hold the LED values

always @ (posedge clock or posedge reset) //always block for the ticker
begin
 if(reset)
  ticker <= 0;
 else if(ticker == 50000000) //reset after 1 second
  ticker <= 0;
 else
  ticker <= ticker + 1;
end

reg [3:0] clickcount; //register to hold the count upto 9. That is why a 4 bit register is used. 3 bit would not have been enough.

assign click = ((ticker == 50000000)?1'b1:1'b0); //click every second

always @ (posedge click or posedge reset)
begin
 if(reset)
  clickcount <= 0;
 else if(clickcount == 8)
   clickcount <= 0;
  else 
  clickcount <= clickcount + 1;

end

always @ (*) //always block that will scroll or move the text. Accomplished with case
begin
    case(clickcount)
    0:
    begin
     fourth = 4; //H
     third = 3; //E
     second = 7; //L
     first = 7; //L
    end
    
    1:
    begin
     fourth = 3; //E
     third = 7; //L
     second = 7; //L
     first = 0; //O
    end
    
    2:
    begin
     fourth = 7; //L
     third = 7; //L
     second = 0; //O
     first = 2; //-
    end
    
    3:
    begin
     fourth = 7; //L
     third = 0; //O
     second = 2; //-
     first = 1; //T
    end
    
    4:
    begin
     fourth = 0; //O
     third = 2; //-
     second = 1; //T
     first = 4; //H
    end
    
    5:
    begin
     fourth = 2; //-
     third = 1; //T
     second = 4; //H
     first = 3; //E
    end
    
    6:
    begin
     fourth = 1; //T
     third = 4; //H
     second = 3; //E
     first = 8; //R
    end
    
    7:
    begin
     fourth = 4; //H
     third = 3; //E
     second = 8; //R
     first = 3; //E
    end
    
    8:
    begin
     fourth = 3; //E
     third = 8; //R
     second = 3; //E
     first = 2; //blank
    end
  endcase
  
end

//see my other post on explanation of LED multiplexing.

localparam N = 18;

reg [N-1:0]count;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0]sseg;
reg [3:0]an_temp;

always @ (*)
 begin
  case(count[N-1:N-2])
   
   2'b00 : 
    begin
     sseg = first;
     an_temp = 4'b1110;
    end
   
   2'b01:
    begin
     sseg = second;
     an_temp = 4'b1101;
    end
   
   2'b10:
    begin
     sseg = third;
     an_temp = 4'b1011;
    end
    
   2'b11:
    begin
     sseg = fourth;
     an_temp = 4'b0111;
    end
  endcase
 end
assign an = an_temp;

reg [6:0] sseg_temp; 
always @ (*)
 begin
  case(sseg)
   4 : sseg_temp = 7'b0001001; //to display H
   3 : sseg_temp = 7'b0000110; //to display E
   7 : sseg_temp = 7'b1000111; //to display L
   0 : sseg_temp = 7'b1000000; //to display O
   1 : sseg_temp = 7'b0000111; //to display T
   8 : sseg_temp = 7'b0001000; //to display R
   
   default : sseg_temp = 7'b0000000; //blank
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 
assign dp = 1'b1;

endmodule