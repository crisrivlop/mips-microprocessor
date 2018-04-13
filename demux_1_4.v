module demux_1_4 #(parameter bus_size = 8)(
	input  [1:0] select,
	input  [bus_size-1:0] in,
	output  [bus_size-1:0] a,b,c,d);
		
	wire [bus_size-1:0] stage_1_1_out,stage_1_2_out;
	
	demux_1_2 #(bus_size) stage_1_1(select[0],stage_1_1_out,a,b);
	demux_1_2 #(bus_size) stage_1_2(select[0],stage_1_2_out,c,d);
	
	demux_1_2 #(bus_size) stage_2(select[1],in,stage_1_1_out,stage_1_2_out);
			
endmodule 