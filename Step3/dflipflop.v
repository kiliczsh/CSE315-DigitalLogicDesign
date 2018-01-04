
 module d_latch(data,clk,out);
	input data, clk; 
	output out;
	reg out;
	always @ ( clk or data ) begin
		if (clk == 1) begin
		out <= data;
		end
	end
endmodule