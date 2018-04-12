
//the following ALU is a parameterizable module if you want increase or decrease the bus size is up to you! :)
module ALU
	#(parameter bus = 8)
	(a,b,opselect,sout,zero,cout,overflow,negative);

	input [bus-1:0] a;
	input [bus-1:0] b;
	input [3:0] opselect;
	output[bus-1:0] sout;
	output zero;
	output cout;
	output overflow;
	output negative;
	
	wire u_operation;
	assign u_operation = opselect[3];
	
	//complemento a 2
	
	wire [bus-1:0] c2_in,bc2;
	wire c2_function;
	
	//operacion 101 sub y 111 slt, activan el complemento a 2
	assign c2_function = opselect[0] & opselect[2];
	
	
	genvar i;
	generate 
		for (i = 0; i < bus; i = i+1) begin:forloop
			assign c2_in[i] = c2_function;
		end
	
	endgenerate
	
	parameterizable_nand #(bus) and_c2(b,c2_in,b_c2);
	
	
	//and
	wire [bus-1:0] andout;
	parameterizable_and #(bus) and_dut(a,b,andout);
	
	//sumador/restador
	wire [bus-1:0] sumout;	
	wire local_carry;
	sumador_parametrizable #(bus) sumador(a,b_c2,cin, sumout, local_carry);
	
	//or
	wire [bus-1:0] orout;
	parameterizable_or #(bus) or_dut(a,b,orout);
	
		//nor
	wire [bus-1:0] norout;
	parametrizable_not #(bus) nor_dut(orout,norout);


	//sll y srl
	wire [bus-1:0] sllout,srlout;
	parameterizable_shift_left #(bus) sll_dut(a,b,sllout);
	parameterizable_shift_right #(bus) srl_dut(a,b,srlout);


	
	wire [bus-1:0] sltout;
	
	
	
	parametrizable_slt #(bus) slt_dut(a,b,sltout);
	
	//operations - opselect value
	//000 - sll
	//001 - srl
	//010 - or (y derivados) [ori]
	//011 - nor
	//100 - add (y derivados) [addi,addiu,addu]
	//101 - sub (y derivados) [subu]
	//110 - and (y derivados) [andi]
	//111 - slt (y derivados) [sltu,slti,sltui]
	
	mux_8_3 #(bus) operation_sel(sllout,srlout,orout,norout,sumout,sumout,andout,sltout,opselect[2:0],sout);
	
	
	//flags
	
	assign zero = ~| sumout;
	//negative is true if the msb is 1 and the processed operation isn't an unsigned operation
	//also if the opselect has the form 10X
	//in other words the opselect bus is 10X0 (where X is 0 or 1).
	wire sub_add_op;
	assign sub_add_op = opselect[0] & ~opselect[1];
	assign negative = sout[bus-1] & ~u_operation & sub_add_op; 

	assign cout = local_carry & sub_add_op & ~opselect[2]; 

	//overflow is active if the following sentences are true
	//the operation substraction or addition are dectected.
	//if a and the result has oposite signs (msb are 1)
	//and opselect[2] ^ a[bus-1] ^ b[bus-1] are 010 or 100
	assign overflow = ~(opselect[2] ^ a[bus-1] ^ b[bus-1]) & (a[bus-1] ^ sumout[bus-1]) & sub_add_op;
	

endmodule
