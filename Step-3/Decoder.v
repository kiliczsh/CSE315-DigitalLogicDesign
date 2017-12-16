module decoder(D,a,E);
output [15:0]D;    //16-bit output
input [3:0]a;
input E;        //4-bit input with E as enable

	assign 
		D[0] = ~a[3]&~a[2]&~a[1]&~a[0]&E,  //assignment of desired value to the 16-bit output
		D[1] = ~a[3]&~a[2]&~a[1]&a[0]&E,
		D[2] = ~a[3]&~a[2]&a[1]&~a[0]&E,
		D[3] = ~a[3]&~a[2]&a[1]&a[0]&E,
		D[4] = ~a[3]&a[2]&~a[1]&~a[0]&E,
		D[5] = ~a[3]&a[2]&~a[1]&a[0]&E,
		D[6] = ~a[3]&a[2]&a[1]&~a[0]&E,
		D[7] = ~a[3]&a[2]&a[1]&a[0]&E,
		D[8] = a[3]&~a[2]&~a[1]&~a[0]&E,
		D[9] = a[3]&~a[2]&~a[1]&a[0]&E,
		D[10]= a[3]&~a[2]&a[1]&~a[0]&E,
		D[11]= a[3]&~a[2]&a[1]&a[0]&E,
		D[12]= a[3]&a[2]&~a[1]&~a[0]&E,
		D[13]= a[3]&a[2]&~a[1]&a[0]&E,
		D[14]= a[3]&a[2]&a[1]&~a[0]&E,
		D[15]= a[3]&a[2]&a[1]&a[0]&E;
	   
endmodule