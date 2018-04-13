module demux_1_2  #(parameter bus_size = 8)(
   input select,
	input [bus_size-1:0] in,
   output wire [bus_size-1:0] a,
   output wire [bus_size-1:0] b);

	assign a = (select) ? {bus_size{1'b0}} : in;
	assign b = (select) ? in : {bus_size{1'b0}};
 
endmodule 