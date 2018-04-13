module demux_2_4 #(parameter bus_size = 8)(
	input  [1:0] select,
	input  [bus_size-1:0] in,
	output  [bus_size-1:0] a,b,c,d);
		
	wire [bus_size-1:0] stage_1_1,stage1_2;
	
	deco_1_2 #(bus_size) deco_1_1(select[0],stage_1_1,a,b);
	deco_1_2 #(bus_size) deco_1_2(select[0],stage_1_2,c,d);
	deco_1_2 #(bus_size) deco_1(select[1],in,stage_1_1,stage_1_2);		
			
endmodule 