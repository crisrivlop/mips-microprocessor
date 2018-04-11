module mux_4_1 #(parameter bus_size = 32)
	(input [bus_size-1:0] 	a,b,c,d,
		input [1:0] 				select,
		output [bus_size-1:0] out);

	wire [bus_size-1:0] stage_1_1_out;
	wire [bus_size-1:0] stage_1_2_out;
	
	mux_2_1 #(bus_size) stage_1_1(a,b,select[0], stage_1_1_out);
	mux_2_1 #(bus_size) stage_1_2(c,d,select[0], stage_1_2_out);
	
	mux_2_1 #(bus_size) stage_2(stage_1_1_out,stage_1_2_out,select[1], out);

endmodule
