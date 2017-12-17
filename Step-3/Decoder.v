module decoder(outputDec,inputDec,E);
output [15:0]outputDec;    //16-bit output
input [3:0]inputDec;
input E;        //4-bit input with E inputDecs eninputDecble

	assign 
		outputDec[0] = ~inputDec[3]&~inputDec[2]&~inputDec[1]&~inputDec[0]&E,  //inputDecssignment of outputDecesireoutputDec vinputDeclue to the 16-bit output
		outputDec[1] = ~inputDec[3]&~inputDec[2]&~inputDec[1]&inputDec[0]&E,
		outputDec[2] = ~inputDec[3]&~inputDec[2]&inputDec[1]&~inputDec[0]&E,
		outputDec[3] = ~inputDec[3]&~inputDec[2]&inputDec[1]&inputDec[0]&E,
		outputDec[4] = ~inputDec[3]&inputDec[2]&~inputDec[1]&~inputDec[0]&E,
		outputDec[5] = ~inputDec[3]&inputDec[2]&~inputDec[1]&inputDec[0]&E,
		outputDec[6] = ~inputDec[3]&inputDec[2]&inputDec[1]&~inputDec[0]&E,
		outputDec[7] = ~inputDec[3]&inputDec[2]&inputDec[1]&inputDec[0]&E,
		outputDec[8] = inputDec[3]&~inputDec[2]&~inputDec[1]&~inputDec[0]&E,
		outputDec[9] = inputDec[3]&~inputDec[2]&~inputDec[1]&inputDec[0]&E,
		outputDec[10]= inputDec[3]&~inputDec[2]&inputDec[1]&~inputDec[0]&E,
		outputDec[11]= inputDec[3]&~inputDec[2]&inputDec[1]&inputDec[0]&E,
		outputDec[12]= inputDec[3]&inputDec[2]&~inputDec[1]&~inputDec[0]&E,
		outputDec[13]= inputDec[3]&inputDec[2]&~inputDec[1]&inputDec[0]&E,
		outputDec[14]= inputDec[3]&inputDec[2]&inputDec[1]&~inputDec[0]&E,
		outputDec[15]= inputDec[3]&inputDec[2]&inputDec[1]&inputDec[0]&E;
	   
endmodule