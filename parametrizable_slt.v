module parametrizable_slt #(parameter bus_size = 32) (
	input [bus_size-1:0] 	a,b,
	output [bus_size-1:0] out);

	assign out[0] = a<b;

	genvar i;
	generate 
		for (i = 1; i < bus_size; i = i+1) begin:forloop
			assign out[i] = 0;
		end
	
	endgenerate

endmodule 