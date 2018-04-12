//it is a block memory of 4k*32bits = 4k*4B = 128kbits = 16kB
module mem_block
	(input [11:0]da,input [31:0] write_data,input clk,memwrite,memread,
	output reg [31:0] doa);

	reg [31:0] my_memory [0:4095];	
	
	integer i;

	initial begin
		for (i = 0; i < 4096; i = i + 1) begin
			my_memory[i] = 0;
		end	
	end
	


	always @(posedge clk) begin
	// Use memread to indicate a valid address is on the line and read the memory into a register at that address when memread is asserted
	if (memread == 1'b1) begin
		doa <= my_memory[da];
	end
	end
	
	
	always @(negedge clk) begin
	if (memwrite == 1'b1) begin
		my_memory[da] <= write_data;
	end
	end

endmodule
