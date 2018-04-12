module demux_3_8 #(parameter bus_size = 8)
	(input  [2:0] select,
		input  [bus_size-1:0] in,
		output  [bus_size-1:0] a,b,c,d,e,f,g,h);
		
		wire [bus_size-1:0] stage_1_1,stage1_2;
		demux_2_4 #(bus_size) deco_1_1(select[1:0],stage_1_1,a,b,c,d);
		demux_2_4 #(bus_size) deco_1_2(select[1:0],stage_1_2,e,f,g,h);
		deco_1_2 #(bus_size) deco_1(select[2],in,stage_1_1,stage_1_2);		
		
		
endmodule 