
module ROM(
	input  [9:0] address , // Address input
	output [19:0] data    , // Data output
	input select
);

	reg [19:0] mem [9:0] ;  
	assign data = (select) ? mem[address] : 20'b0;
	initial begin
	  $readmemb("memory.txt", mem); // memory_list is memory file
	end

endmodule