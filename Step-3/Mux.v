module mux2to1(out, in0, in1, sel);
	input [19:0] in0;
	input [19:0] in1;
	input sel;
	output [19:0] out;
	assign out = (sel==1'b0) ? in0 : in1;
endmodule

module mux4to1(out, in0, in1, in2, in3, sel);
	input [19:0] in0;
	input [19:0] in1;
	input [19:0] in2;
	input [19:0] in3;
	input [1:0] sel;
	output [19:0] out;

	assign out = (sel==2'b00) ? in0 : 
		(sel==2'b01) ? in1 : 
		(sel==2'b10) ? in2 :
		in3;
endmodule

