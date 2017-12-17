module orgate (y,a,b);
	input a, b;
	output y;
	assign y =a | b;
endmodule

module BitOr20 (s,a, b);
	input [19:0] a, b;
	output [19:0] s;
	wire [19:0] s;
		orgate or00( s[0], a[0], b[0] );
		orgate or01( s[1], a[1], b[1] );
		orgate or02( s[2], a[2], b[2] );
		orgate or03( s[3], a[3], b[3] );
		orgate or04( s[4], a[4], b[4] );
		orgate or05( s[5], a[5], b[5] );
		orgate or06( s[6], a[6], b[6] );
		orgate or07( s[7], a[7], b[7] );
		orgate or08( s[8], a[8], b[8] );
		orgate or09( s[9], a[9], b[9] );
		orgate or10( s[10], a[10], b[10] );
		orgate or11( s[11], a[11], b[11] );
		orgate or12( s[12], a[12], b[12] );
		orgate or13( s[13], a[13], b[13] );
		orgate or14( s[14], a[14], b[14] );
		orgate or15( s[15], a[15], b[15] );
		orgate or16( s[16], a[16], b[16] );
		orgate or17( s[17], a[17], b[17] );
		orgate or18( s[18], a[18], b[18] );
		orgate or19( s[19], a[19], b[19] );
endmodule
