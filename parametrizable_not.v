module parametrizable_not #(parameter bus_size = 32) (
	input [bus_size-1:0] 	in,
	output [bus_size-1:0] 	out);

	assign out = ~in;

endmodule 