module d_latch(data,clk,out);
	input data, clk; 
	output out;
	reg out;
	always @ ( clk or data ) begin
		if (clk == 1) begin
		out <= data;
		end
	end
endmodule //End Of Module dlatch

module DFF(out,data, reset,clk);
	input data, clk; 
	output out;
	reg out;
	always @ ( posedge clk) 
	begin //TODO
		if reset == 1
			out <= 0
		else
			out <= data;
	end
endmodule //End Of Module dflipflop

module BitRegister20(PCOut,PCin,reset,clk);  
 output [19:0] PCOut;  
 input [19:0] PCin;  
 input reset,clk;  
 DFF dff0(PCOut[0],PCin[0],reset,clk);  
 DFF dff1(PCOut[1],PCin[1],reset,clk);  
 DFF dff2(PCOut[2],PCin[2],reset,clk);  
 DFF dff3(PCOut[3],PCin[3],reset,clk);  
 DFF dff4(PCOut[4],PCin[4],reset,clk);  
 DFF dff5(PCOut[5],PCin[5],reset,clk);  
 DFF dff6(PCOut[6],PCin[6],reset,clk);  
 DFF dff7(PCOut[7],PCin[7],reset,clk);  
 DFF dff8(PCOut[8],PCin[8],reset,clk);  
 DFF dff9(PCOut[9],PCin[9],reset,clk);  
 DFF dff10(PCOut[10],PCin[10],reset,clk);  
 DFF dff11(PCOut[11],PCin[11],reset,clk);  
 DFF dff12(PCOut[12],PCin[12],reset,clk);  
 DFF dff13(PCOut[13],PCin[13],reset,clk);  
 DFF dff14(PCOut[14],PCin[14],reset,clk);  
 DFF dff15(PCOut[15],PCin[15],reset,clk);  
 DFF dff16(PCOut[16],PCin[16],reset,clk);  
 DFF dff17(PCOut[17],PCin[17],reset,clk);  
 DFF dff18(PCOut[18],PCin[18],reset,clk);  
 DFF dff19(PCOut[19],PCin[19],reset,clk);  
 
endmodule  