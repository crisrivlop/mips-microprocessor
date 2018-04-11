module parameterizable_and #(parameter bus_size = 32) 
	(input [bus_size-1:0] a,b, output [bus_size-1:0] out);
		assign out = a&b;
	
endmodule
