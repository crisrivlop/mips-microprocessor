module ALU
	#(parameter bus = 8)
	(a,b,cin,c2,sout,zero,cout,overflow,negative);

	input [bus-1:0] a;
	input [bus-1:0] b;
	input cin,c2;	
	output[bus-1:0] sout;
	output zero;
	output cout;
	output overflow;
	output negative;
	
	//wire[bus-1:0] b_c2,one;
	//assign one[bus-1:0] = c2;
	//parameterizable_and #(bus) c2_dut (b,c2,b_c2);
	
	
	
	//and, el siguiente and tiene la capacidad de ser un complemento a dos (c2) y ser un and
	
	wire [bus-1:0] c2_in,bc2;
	assign c2_in = c2? c2:a;
	parameterizable_and #(bus) and_c2(b,c2_in,b_c2);
	
	//sumador
	wire [bus-1:0] sumout;	
	sumador_parametrizable #(bus) sumador(a,b_c2,cin, sumout, cout);
	

endmodule
