module orgate (y,a,b);
	input a, b;
	output y;
	assign y =a | b;
endmodule

module 20BitOr (a, b, s);
	input [19:0] a, b;
	output [19:0] s;
	reg [19:0] s;
	always @(a or b) begin
		orgate ( s[0], a[0], b[0] );
		orgate ( s[1], a[1], b[1] );
		orgate ( s[2], a[2], b[2] );
		orgate ( s[3], a[3], b[3] );
		orgate ( s[4], a[4], b[4] );
		orgate ( s[5], a[5], b[5] );
		orgate ( s[6], a[6], b[6] );
		orgate ( s[7], a[7], b[7] );
		orgate ( s[8], a[8], b[8] );
		orgate ( s[9], a[9], b[9] );
		orgate ( s[10], a[10], b[10] );
		orgate ( s[11], a[11], b[11] );
		orgate ( s[12], a[12], b[12] );
		orgate ( s[13], a[13], b[13] );
		orgate ( s[14], a[14], b[14] );
		orgate ( s[15], a[15], b[15] );
		orgate ( s[16], a[16], b[16] );
		orgate ( s[17], a[17], b[17] );
		orgate ( s[18], a[18], b[18] );
		orgate ( s[19], a[19], b[19] );
	end
endmodule
