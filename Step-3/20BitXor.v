module xorgate (y,a,b);
	input a, b;
	output y;
	assign y =a ^ b;
endmodule

module 20BitXor (a, b, s);
	input [19:0] a, b;
	output [19:0] s;
	reg [19:0] s;
	always @(a or b) begin
		xorgate ( s[0], a[0], b[0] );
		xorgate ( s[1], a[1], b[1] );
		xorgate ( s[2], a[2], b[2] );
		xorgate ( s[3], a[3], b[3] );
		xorgate ( s[4], a[4], b[4] );
		xorgate ( s[5], a[5], b[5] );
		xorgate ( s[6], a[6], b[6] );
		xorgate ( s[7], a[7], b[7] );
		xorgate ( s[8], a[8], b[8] );
		xorgate ( s[9], a[9], b[9] );
		xorgate ( s[10], a[10], b[10] );
		xorgate ( s[11], a[11], b[11] );
		xorgate ( s[12], a[12], b[12] );
		xorgate ( s[13], a[13], b[13] );
		xorgate ( s[14], a[14], b[14] );
		xorgate ( s[15], a[15], b[15] );
		xorgate ( s[16], a[16], b[16] );
		xorgate ( s[17], a[17], b[17] );
		xorgate ( s[18], a[18], b[18] );
		xorgate ( s[19], a[19], b[19] );
	end
endmodule
