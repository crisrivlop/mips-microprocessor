module decoder #(parameter bus_size_out = 4, bus_size_in = 2)(
	input [bus_size_in-1:0] select,
	input enabled,
	output [bus_size_out-1:0] out);
	
	wire [bus_size_out-1:0] tmp = {{bus_size_out-1{1'b0}}, 1'b1};

	assign out = enabled ? 0 : (tmp << select);

endmodule 