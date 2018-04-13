module mux_2_1 #(parameter bus_size = 32) (
	input  select,
	input  [bus_size-1:0] a,
	input  [bus_size-1:0] b,
	output [bus_size-1:0] out);
 
	assign out = select ? a : b;
 
endmodule 