module zero_ext #(parameter bus_size = 32, bus_size_in = 16)
	(input [bus_size_in-1:0] in,
		output [bus_size-1:0] out);
	
	assign out[bus_size-1:0] = {{bus_size_in{1'b0}},in};

endmodule 