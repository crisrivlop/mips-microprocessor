module deco_1_2 #(parameter bus_size = 8)(
	input  select,
	input  [bus_size-1:0] in,
	output  [bus_size-1:0] outa,
	output [bus_size-1:0] outb);
		
	genvar i;
	generate 
	for (i = 0; i < bus_size; i = i+1) begin:forloop
		assign outa[i] = ~select & in[i];
		assign outb[i] =  select & in[i];
	end
	endgenerate
		
endmodule 
