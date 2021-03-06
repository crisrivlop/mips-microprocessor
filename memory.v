module  memory #(parameter time dir = 16, parameter time bus = 2**dir) 
	(input [dir-1:0]da,addr_write,input [dir-1:0] write_data,input clk,memwrite,memread,
	output reg [dir-1:0] doa);

	reg [dir-1:0] my_memory [0:bus-1];	
	
	integer i;

	initial begin
		for (i = 0; i < bus; i = i + 1) begin
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
		my_memory[addr_write] <= write_data;
	end
	end

endmodule
