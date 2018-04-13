module concat #(parameter bus_size = 32, bus_size_a = 16, bus_size_b = 16) (
	input [bus_size_a-1:0] a,
	input [bus_size_b-1:0] b,
	output [bus_size-1:0] out);
	
	assign out[bus_size-1:0] = {a, b};

endmodule 