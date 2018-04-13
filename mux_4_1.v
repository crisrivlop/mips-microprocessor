module mux_4_1 #(parameter bus_size = 32)
	(input [bus_size-1:0] 		a,b,c,d,
		input [1:0] 				select,
		output [bus_size-1:0] out);

	wire [bus_size-1:0] stage_1_1_out;
	wire [bus_size-1:0] stage_1_2_out;
	
	mux_2_1 #(bus_size) stage_1_1(select[0], a,b,stage_1_1_out);
	mux_2_1 #(bus_size) stage_1_2(select[0], c,d, stage_1_2_out);
	
	mux_2_1 #(bus_size) stage_2(select[1],stage_1_1_out,stage_1_2_out, out);

endmodule
