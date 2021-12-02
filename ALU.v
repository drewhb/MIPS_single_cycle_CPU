`timescale 1ns / 1ns


module ALU(
    a,
    b,
	 func,
    out,
    zero_flag
    );


	 parameter size = 32;
	 
    input [size-1:0] a;
    input [size-1:0] b;
	 input [2:0] func;
    output reg [size-1:0] out;
    output reg zero_flag;
	 
	 	
	
	
	always @(*) begin
		if (func == 3'd0) 
		out = a+b;
		else if (func == 3'd1)
		out = a-b;
		else if (func == 3'd2)
		out = a&b;
		else if (func == 3'd3)
		out = a|b;
		else if (func == 3'd4)
		out = ~(a|b);
		else if (func == 3'd5)
		out = ((a < b)? 1:0);	
		else if (func == 3'd6)
		out = {b[15:0], 16'b0};
		else
		out = 0;
   end

    always @(*) begin
	case (out) 
	0: zero_flag = 1'b1; //BEQ
	default: zero_flag = 1'b0;
	endcase
	end

endmodule
