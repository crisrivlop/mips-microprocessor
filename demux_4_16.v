module demux_4_16 #(parameter bus_size = 8)
	(input  [3:0] select,
		input  [bus_size-1:0] in,
		output  [bus_size-1:0] a,b,c,d, e,f,g,h, i,j,k,l, m,n,o,p);
		
		wire [bus_size-1:0] stage_1_1,stage1_2;
		demux_3_8 #(bus_size) deco_1_1(select[2:0],stage_1_1,a,b,c,d,e,f,g,h);
		demux_3_8 #(bus_size) deco_1_2(select[2:0],stage_1_2,i,j,k,l, m,n,o,p);
		deco_1_2 #(bus_size) deco_1(select[3],in,stage_1_1,stage_1_2);		
		
		
endmodule 