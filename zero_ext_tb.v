`timescale 1ns / 1ns

module zero_ext_tb #(parameter bus_size = 8, bus_size_in = 4);

	// Inputs
	reg [bus_size_in-1:0] datoin;

	// Outputs
	wire [bus_size-1:0] datoout;

	// Instantiate the Unit Under Test (UUT)
	zero_ext #(.bus_size(bus_size), .bus_size_in(bus_size_in)) uut (
		.in(datoin), 
		.out(datoout)
	);

	initial begin
		// Initialize Inputs
		datoin = 4'b0101;
		#10
		datoin = 4'b0001;
		#10;
	end
      
endmodule 