module mux_8_3 #(parameter bus_size = 32)
	(input [bus_size-1:0] 	a,b,c,d,e,f,g,h,
		input [2:0] 				select,
		output [bus_size-1:0] out);

	wire [bus_size-1:0] stage_1_1_out;
	wire [bus_size-1:0] stage_1_2_out;
	
	mux_4_1 #(bus_size) stage_1_1(a,b,c,d,select[1:0], stage_1_1_out);
	mux_4_1 #(bus_size) stage_1_2(e,f,g,h,select[1:0], stage_1_2_out);
	
	mux_2_1 #(bus_size) stage_2(select[2],stage_1_1_out,stage_1_2_out, out);

endmodule

