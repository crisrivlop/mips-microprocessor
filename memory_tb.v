module memory_tb ();

	reg [31:0] dira,dirb,dirwrite;
	
	wire [31:0] a,b;
	
	reg[31:0] datawrite;
	
	reg clk,memwrite,memread;
	
	memory #(32) rmem(dira,dirwrite,datawrite,clk,memwrite,memread,a);

	
	
	initial begin
		
		dirb <= 0;
		memwrite <= 1;
		memread <= 1;
		dirwrite <= 5;
		datawrite <= 54;
		dira <= 5;
		#20
		
		
		memwrite <= 1;
		memread <= 1;
		dirwrite <= 8;
		datawrite <= 4;
		dira <= 5;
		#20
		
		memwrite <= 0;
		memread <= 1;
		dira <= 8;
		#20
		
		memwrite <= 0;
		memread <= 1;
		dirb <= 8;
		#20
		
		
		memwrite <= 0;
		memread <= 1;
		dirb <= 5;
		#20;
	
	end
	
	
		always
		begin
			clk <= 1; #10; clk <= 0; #10;
		end
	
	
endmodule
