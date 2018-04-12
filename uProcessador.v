module uProcessador
	#(parameter bus = 8)
	();

	wire [bus-1:0] a;
	wire [bus-1:0] b;
	wire [3:0] opselect;
	wire[bus-1:0] sout;
	wire zero;
	wire cout;
	wire overflow;
	wire negative;

	ALU #(bus) alu_dut(a,b,opselect,sout,zero,cout,overflow,negative);

endmodule


