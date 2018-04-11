module ALU
	#(parameter bus = 32)
	(ain,bin,sout,zero,overflow,negative);

	input [bus-1:0] ain;
	input [bus-1:0] bin;	
	output[bus-1:0] sout;
	output zero;
	output overflow;
	output negative;
	
	
	
	assign sout = ain+bin;
	
	

endmodule

