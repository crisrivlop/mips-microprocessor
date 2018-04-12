//it is a block memory of 2k*32bits = 2k*4bytes = 64kbits = 8kB
module mem_4GB
	(input[29:0] dira,
	input[31:0] write_data,
	input clk, memwrite, memread,
	output[31:0] out);
	
	
	wire [1:0] mem_action [0:7];
	wire [31:0] mem_blk [0:7];
	wire [1:0] mem_action_val;
	assign mem_action_val[0] = memwrite;
	assign mem_action_val[1] = memread;
	
	demux_3_8 #(2) demux(dira[29:27],mem_action_val,mem_action[0],mem_action[1],mem_action[2],mem_action[3],mem_action[4],
		mem_action[5],mem_action[6],mem_action[7]); 
	mux_8_3 #(32) mux(mem_blk[0],mem_blk[1],mem_blk[2],mem_blk[3],mem_blk[4],mem_blk[5],mem_blk[6],mem_blk[7],dira[29:27],out); 
	
	
	genvar i;
	generate 
		for (i = 0; i < 8; i = i+1) begin:forloop
			mem_512M mem_piece(dira[26:0],write_data,clk,mem_action[i][0],mem_action[i][1], mem_blk[i]);
		end
	
	endgenerate
	
	
endmodule
