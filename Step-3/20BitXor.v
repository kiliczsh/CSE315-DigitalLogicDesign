
module xorgate (y,a,b);
	input a, b;
	output y;
	assign y =a ^ b;
endmodule

module BitXor20 (s,a, b);
	input [19:0] a, b;
	output [19:0] s;
	wire [19:0] s;
		xorgate xor00( s[0], a[0], b[0] );
		xorgate xor01( s[1], a[1], b[1] );
		xorgate xor02( s[2], a[2], b[2] );
		xorgate xor03( s[3], a[3], b[3] );
		xorgate xor04( s[4], a[4], b[4] );
		xorgate xor05( s[5], a[5], b[5] );
		xorgate xor06( s[6], a[6], b[6] );
		xorgate xor07( s[7], a[7], b[7] );
		xorgate xor08( s[8], a[8], b[8] );
		xorgate xor09( s[9], a[9], b[9] );
		xorgate xor10( s[10], a[10], b[10] );
		xorgate xor11( s[11], a[11], b[11] );
		xorgate xor12( s[12], a[12], b[12] );
		xorgate xor13( s[13], a[13], b[13] );
		xorgate xor14( s[14], a[14], b[14] );
		xorgate xor15( s[15], a[15], b[15] );
		xorgate xor16( s[16], a[16], b[16] );
		xorgate xor17( s[17], a[17], b[17] );
		xorgate xor18( s[18], a[18], b[18] );
		xorgate xor19( s[19], a[19], b[19] );
endmodule
