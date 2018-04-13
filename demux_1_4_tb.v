`timescale 1ns / 1ns

module demux_1_4_tb #(parameter bus_size = 4);

	// Inputs
	reg [1:0] select;
	reg [bus_size-1:0] in;

	// Outputs
	wire [bus_size-1:0] a;
	wire [bus_size-1:0] b;
	wire [bus_size-1:0] c;
	wire [bus_size-1:0] d;

	// Instantiate the Unit Under Test (UUT)	
	demux_1_4 #(.bus_size(bus_size)) uut (
		.in(in),
		.select(select), 
		.a(a),
		.b(b),
		.c(c),
		.d(d)
	);

	initial begin
		// Initialize Inputs
		select = 2'b00;
		in = 4'b1010;
		#10
		select = 2'b01;
		in = 4'b1011;
		#10
		select = 2'b10;
		in = 4'b1111;
		#10
		select = 2'b11;
		in = 4'b0001;
		#10;
	end
      
endmodule 

