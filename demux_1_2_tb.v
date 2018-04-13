`timescale 1ns / 1ns

module demux_1_2_tb #(parameter bus_size = 4, bus_size_select = 1);

	// Inputs
	reg [bus_size_select-1:0] select;
	reg [bus_size-1:0] in;

	// Outputs
	wire [bus_size-1:0] a;
	wire [bus_size-1:0] b;

	// Instantiate the Unit Under Test (UUT)
	demux_1_2 #(.bus_size(bus_size)) uut (
		.in(in),
		.select(select), 
		.a(a),
		.b(b)
	);

	initial begin
		// Initialize Inputs
		select = 0;
		in = 4'b1010;
		#10
		select = 1;
		in = 4'b1011;
		#10
		select = 0;
		in = 4'b1111;
		#10
		select = 1;
		in = 4'b0001;
		#10;
	end
      
endmodule 