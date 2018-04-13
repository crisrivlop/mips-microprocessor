module equal #(parameter bus_size = 32) (
	input  [bus_size-1:0] a,
	input  [bus_size-1:0] b,
	output out);
 
	assign out = (a == b) ? 1 : 0;
 
endmodule 