module reg_bank #(parameter dir = 5, bus = 2**dir) 
	(input [dir-1:0]da,db,addr_write,input [bus-1:0] write_data,input clk,memwrite,memread,
	output reg [bus-1:0] doa,dob);

	reg [bus-1:0] my_memory [0:bus-1];
	
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
		dob <= my_memory[db];
	end
	end
	
	
	always @(negedge clk) begin
	if (memwrite == 1'b1) begin
		my_memory[addr_write] <= write_data;
	end
	end

endmodule

