`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [1:0] ALUOp,
	 output reg [2:0] func
    );

 always @(*) begin
	if (ALUOp == 2'b00) begin  
		if (instruction == 6'h20) 
		func = 3'd0;
		else if (instruction == 6'h22)
		func = 3'd1;
		else if (instruction == 6'h24)
		func = 3'd2;
		else if (instruction == 6'h25)
		func = 3'd3;
		else if (instruction == 6'h27)
		func = 3'd4;
		else if (instruction == 6'h2a) //SLT
		func = 3'd5; 
		else
		func = 3'd7;
	end else if (ALUOp == 2'b01) begin //BEQ, BNE
		func = 3'd1;
	end else if (ALUOp == 2'b10) begin //addi
		func = 3'd0;
    end else if (ALUOp == 2'b11) begin
        func = 3'd6; 
	end else begin
		func = 3'd7;
	end
   end


endmodule
