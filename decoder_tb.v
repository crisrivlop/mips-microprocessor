`timescale 1ns / 1ns

module decoder_tb #(parameter bus_size_in = 3, bus_size_out = 8);

	// Inputs
	reg [bus_size_in-1:0] select;
	reg enabled;

	// Outputs
	wire [bus_size_out-1:0] out;

	// Instantiate the Unit Under Test (UUT)
	decoder #(.bus_size_in(bus_size_in), .bus_size_out(bus_size_out)) uut (
		.select(select), 
		.enabled(enabled),
		.out(out)
	);

	initial begin
		// Initialize Inputs
		enabled = 0;
		select = 3'b000;
		#10
		select = 3'b001;
		#10
		select = 3'b010;
		#10
		select = 3'b011;
		#10
		select = 3'b100;
		#10
		select = 3'b101;
		#10
		select = 3'b110;
		#10
		select = 3'b111;
		#10
		enabled = 1;
		select = 3'b101;
		#10
		select = 3'b011;
		#10;
	end
      
endmodule 