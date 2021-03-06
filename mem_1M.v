//it is a block memory of 1M*32bits = 1M*4bytes = 1Mbits = 1MB
module mem_1M
	(input[17:0] dira,
	input[31:0] write_data,
	input clk, memwrite, memread,
	output[31:0] out);
	
	
	wire [1:0] mem_action [0:7];
	wire [31:0] mem_blk [0:7];
	wire [1:0] mem_action_val;
	assign mem_action_val[0] = memwrite;
	assign mem_action_val[1] = memread;
	
	demux_3_8 #(2) demux(dira[17:15],mem_action_val,mem_action[0],mem_action[1],mem_action[2],mem_action[3],mem_action[4],
		mem_action[5],mem_action[6],mem_action[7]); 
	mux_8_3 #(32) mux(mem_blk[0],mem_blk[1],mem_blk[2],mem_blk[3],mem_blk[4],mem_blk[5],mem_blk[6],mem_blk[7],dira[17:15],out); 
	
	
	genvar i;
	generate 
		for (i = 0; i < 8; i = i+1) begin:forloop
			mem_128k mem_piece(dira[14:0],write_data,clk,mem_action[i][0],mem_action[i][1], mem_blk[i]);
		end
	
	endgenerate
	
	
endmodule
