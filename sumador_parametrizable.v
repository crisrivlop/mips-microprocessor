module sumador_parametrizable #(bus = 8)
	(input[bus-1:0] a,b,input c2,input cin,
	output[bus-1:0] s,output overflow);
	
	
	wire[bus:0] cout;
	wire[bus-1:0] b_c2,one;
	assign one[bus-1:0] = c2;
	parameterizable_and #(bus) c2_dut (b,c2,b_c2);
	
	assign cout[0]  = cin;
	assign overflow = cout[bus];
	genvar i;
	generate 
		for (i = 0; i < bus; i = i+1) begin:forloop
			sumador_completo addr(a[i],b_c2[i],cout[i], s[i],cout[i+1]);
		end
	
	endgenerate
	
	
endmodule
