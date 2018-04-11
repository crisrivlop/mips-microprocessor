module  memory(input wire[31:0] dir, output wire[31:0] out);
reg [31:0] my_memory [0:255];
integer d = dir;
assign out = my_memory[d];

endmodule
