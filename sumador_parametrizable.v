module sumador_parametrizable #(bus = 8)
	(input[bus-1:0] a,b,input cin,
	output[bus-1:0] s,output overflow);
	
	
	wire[bus:0] cout;
	assign cout[0]  = cin;
	assign overflow = cout[bus];
	genvar i;
	generate 
		for (i = 0; i < bus; i = i+1) begin:forloop
			sumador_completo addr(a[i],b[i],cout[i], s[i],cout[i+1]);
		end
	
	endgenerate
	
	
endmodule
