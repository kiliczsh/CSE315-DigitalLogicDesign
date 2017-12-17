module andgate (y,a,b);
	input a, b;
	output y;
	assign y =a & b;
endmodule

module BitAnd20 (s, a, b);
	input [19:0] a, b;
	output [19:0] s;
	wire [19:0] s;
		andgate and00( s[0], a[0], b[0] );
		andgate and01( s[1], a[1], b[1] );
		andgate and02( s[2], a[2], b[2] );
		andgate and03( s[3], a[3], b[3] );
		andgate and04( s[4], a[4], b[4] );
		andgate and05( s[5], a[5], b[5] );
		andgate and06( s[6], a[6], b[6] );
		andgate and07( s[7], a[7], b[7] );
		andgate and08( s[8], a[8], b[8] );
		andgate and09( s[9], a[9], b[9] );
		andgate and10( s[10], a[10], b[10] );
		andgate and11( s[11], a[11], b[11] );
		andgate and12( s[12], a[12], b[12] );
		andgate and13( s[13], a[13], b[13] );
		andgate and14( s[14], a[14], b[14] );
		andgate and15( s[15], a[15], b[15] );
		andgate and16( s[16], a[16], b[16] );
		andgate and17( s[17], a[17], b[17] );
		andgate and18( s[18], a[18], b[18] );
		andgate and19( s[19], a[19], b[19] );
endmodule
