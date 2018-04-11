module mux_2_1 #(parameter bus_size = 32)
	(input  select,
		input  [bus_size-1:0] A,
		input  [bus_size-1:0] B,
		output [bus_size-1:0] out);
 
assign out = select ? A : B;
 
endmodule 