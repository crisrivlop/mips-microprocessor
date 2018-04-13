module sign_ext #(parameter bus_size = 32, bus_size_in = 16) (
	input [bus_size_in-1:0] in,
	output [bus_size-1:0] 	out);
		
	wire tmp = in[bus_size_in-1];
	assign out[bus_size-1:0] = {{bus_size_in{tmp}},in};

endmodule 