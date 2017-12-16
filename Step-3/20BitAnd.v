module andgate (y,a,b);
	input a, b;
	output y;
	assign y =a & b;
endmodule

module 20BitAnd (a, b, s);
	input [19:0] a, b;
	output [19:0] s;
	reg [19:0] s;
	always @(a or b) begin
		andgate ( s[0], a[0], b[0] );
		andgate ( s[1], a[1], b[1] );
		andgate ( s[2], a[2], b[2] );
		andgate ( s[3], a[3], b[3] );
		andgate ( s[4], a[4], b[4] );
		andgate ( s[5], a[5], b[5] );
		andgate ( s[6], a[6], b[6] );
		andgate ( s[7], a[7], b[7] );
		andgate ( s[8], a[8], b[8] );
		andgate ( s[9], a[9], b[9] );
		andgate ( s[10], a[10], b[10] );
		andgate ( s[11], a[11], b[11] );
		andgate ( s[12], a[12], b[12] );
		andgate ( s[13], a[13], b[13] );
		andgate ( s[14], a[14], b[14] );
		andgate ( s[15], a[15], b[15] );
		andgate ( s[16], a[16], b[16] );
		andgate ( s[17], a[17], b[17] );
		andgate ( s[18], a[18], b[18] );
		andgate ( s[19], a[19], b[19] );
	end
endmodule
