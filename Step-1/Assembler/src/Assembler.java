import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;
public class Assembler {
  public static void main (String[] args) throws IOException {
	  //file input-output 
	  List<String> lines = new ArrayList<String>(); 
	  File inputFile = new File("input.txt");
	  File outputFile = new File("output.txt");
	    if(inputFile.exists()){
	        try {
	            lines = Files.readAllLines(inputFile.toPath(),Charset.defaultCharset());
	        } catch (IOException ex) {
	            ex.printStackTrace();
	        }
	      if(lines.isEmpty())
	          return;
	    }
	    String binaryFile=lineAssembler(lines);
	    Files.write(outputFile.toPath(), binaryFile.getBytes());
  }


public static String lineAssembler(List<String> lines){
	String[] lineArray = new String[lines.size()];
	lineArray= lines.toArray(lineArray);
	String[][] opCodeList=new String[lines.size()][lines.size()];
	String[] operationElement = null,dataElement = null;
	//getting components
    for(int a=0;a<lines.size();a++) {

    	String row=lines.get(a);
    	operationElement=row.split(" ");
		for(String y:operationElement) {
			dataElement= y.split(",");
			int b=1;
			for(String i:dataElement) {
				opCodeList[a][b]=i;
				b++;
			}
		}
		opCodeList[a][0]=operationElement[0];
    }
	String toFile="",opcode;
    //loop for all lines getting binary code    
    for(int a=0;a<lines.size();a++) {
    	opcode=opCodeList[a][0]; //assign opcode
    	int count=0; // get length for new array
    	for(int b=0;b<opCodeList[a].length;b++) {
    		if(opCodeList[a][b]!=null) {count++;}
    	}
    	String[] elementArray = new String[count-1];
    	for(int c=0;c<elementArray.length;c++) {elementArray[c]=opCodeList[a][c+1];}
	
    	/** use 'elementArray' for rest of operations
    	 *  to get binary code 
    	 */

        String destinationRegister=null,sourceRegister=null,sourceRegister1=null,sourceRegister2=null;
        String immediateValue=null,oneOrZero=null,addr=null,operation1=null,operation2=null;
        String n=null,z=null,p=null;
        
    switch (opcode){
        case "ADD":
            toFile=toFile.concat("0000");
            	destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
            	destinationRegister=get4Bits(destinationRegister);
            toFile=toFile.concat(destinationRegister);
            	sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
            	sourceRegister1=get4Bits(sourceRegister1);
            toFile=toFile.concat(sourceRegister1);
            	sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
            	sourceRegister2=get4Bits(sourceRegister2);
            toFile=toFile.concat(sourceRegister2);
            toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
            break;
        case "ADDI":
            toFile=toFile.concat("0001");
        		destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        		destinationRegister=get4Bits(destinationRegister);
        	toFile=toFile.concat(destinationRegister);
        		sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        		sourceRegister1=get4Bits(sourceRegister1);
        	toFile=toFile.concat(sourceRegister1);
        		int immADDI=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
        		if(immADDI<0) {
        			oneOrZero="1";
        			immediateValue=""+""+Integer.parseInt(Integer.toBinaryString((128-Math.abs(immADDI))));
        		}else {
        			oneOrZero="0";
        			immediateValue=""+""+Integer.parseInt(Integer.toBinaryString(((immADDI))));
        		}
			toFile=toFile.concat(oneOrZero);
        		immediateValue=get7Bits(immediateValue);
        	toFile=toFile.concat(immediateValue);
            break;
        case "AND":
            toFile=toFile.concat("0010");
        		destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        		destinationRegister=get4Bits(destinationRegister);
        	toFile=toFile.concat(destinationRegister);
        		sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        		sourceRegister1=get4Bits(sourceRegister1);
        	toFile=toFile.concat(sourceRegister1);
        		sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
        		sourceRegister2=get4Bits(sourceRegister2);
        	toFile=toFile.concat(sourceRegister2);
        	toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
            break;
        case "ANDI":
            toFile=toFile.concat("0011");
    			destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
    			destinationRegister=get4Bits(destinationRegister);
    		toFile=toFile.concat(destinationRegister);
    			sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
    			sourceRegister1=get4Bits(sourceRegister1);
    		toFile=toFile.concat(sourceRegister1);
    		int immANDI=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
			if(immANDI<0) {
				oneOrZero="1";
				immediateValue=""+""+Integer.parseInt(Integer.toBinaryString((128-Math.abs(immANDI))));
        	}else {
        		oneOrZero="0";
        		immediateValue=""+""+Integer.parseInt(Integer.toBinaryString(((immANDI))));
        	}
			toFile=toFile.concat(oneOrZero);
        		immediateValue=get7Bits(immediateValue);
        	toFile=toFile.concat(immediateValue);
            break;
        case "OR":
            toFile=toFile.concat("0100");
        		destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        		destinationRegister=get4Bits(destinationRegister);
        	toFile=toFile.concat(destinationRegister);
        		sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        		sourceRegister1=get4Bits(sourceRegister1);
        	toFile=toFile.concat(sourceRegister1);
        		sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
        		sourceRegister2=get4Bits(sourceRegister2);
        	toFile=toFile.concat(sourceRegister2);
        	toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
            break;
        case "ORI":
            toFile=toFile.concat("0101");
    			destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
    			destinationRegister=get4Bits(destinationRegister);
    		toFile=toFile.concat(destinationRegister);
    			sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
    			sourceRegister1=get4Bits(sourceRegister1);
    		toFile=toFile.concat(sourceRegister1);
    		int immORI=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
			if(immORI<0) {
				oneOrZero="1";
				immediateValue=""+""+Integer.parseInt(Integer.toBinaryString((128-Math.abs(immORI))));
        	}else {
        		oneOrZero="0";
        		immediateValue=""+""+Integer.parseInt(Integer.toBinaryString(((immORI))));
        	}
			toFile=toFile.concat(oneOrZero);
        		immediateValue=get7Bits(immediateValue);
        	toFile=toFile.concat(immediateValue);
            break;
        case "XOR":
        	toFile = toFile.concat("0110");
        		destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        		destinationRegister=get4Bits(destinationRegister);
        	toFile=toFile.concat(destinationRegister);
        		sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        		sourceRegister1=get4Bits(sourceRegister1);
        	toFile=toFile.concat(sourceRegister1);
        		sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
        		sourceRegister2=get4Bits(sourceRegister2);
        	toFile=toFile.concat(sourceRegister2);
        	toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
        	break;
        case "XORI":
        	toFile = toFile.concat("0111");
    			destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
    			destinationRegister=get4Bits(destinationRegister);
    		toFile=toFile.concat(destinationRegister);
    			sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
    			sourceRegister1=get4Bits(sourceRegister1);
    		toFile=toFile.concat(sourceRegister1);       	
    		int immXORI=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
			if(immXORI<0) {
				oneOrZero="1";
				immediateValue=""+""+Integer.parseInt(Integer.toBinaryString((128-Math.abs(immXORI))));
        	}else {
        		oneOrZero="0";
        		immediateValue=""+""+Integer.parseInt(Integer.toBinaryString(((immXORI))));
        	}
			toFile=toFile.concat(oneOrZero);
        		immediateValue=get7Bits(immediateValue);
        	toFile=toFile.concat(immediateValue);
        	break;	
        case "LD":
            toFile = toFile.concat("1001");
            	destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
            	destinationRegister=get4Bits(destinationRegister);
            toFile=toFile.concat(destinationRegister);
            	int addrld=Integer.parseInt(seperateRegisterAdress(elementArray[1]));
            	if(addrld<0) {
            		oneOrZero="1";
            		addr=""+""+Integer.parseInt(Integer.toBinaryString((1024-Math.abs(addrld))));
            	}else {
            		oneOrZero="0";
            		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrld))));
            	}
            toFile=toFile.concat(oneOrZero);
        		addr=get10Bits(addr);
        	toFile=toFile.concat(addr);	
            
            break;
        case "ST":
            toFile = toFile.concat("1010");
            	sourceRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
            	sourceRegister=get4Bits(sourceRegister);
            toFile=toFile.concat(sourceRegister);
            	int addrst=Integer.parseInt(seperateRegisterAdress(elementArray[1]));
            	if(addrst<0) {
            		oneOrZero="1";
            		addr=""+""+Integer.parseInt(Integer.toBinaryString((1024-Math.abs(addrst))));
            	}else {
            		oneOrZero="0";
            		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrst))));
            	}
            toFile=toFile.concat(oneOrZero);
    			addr=get10Bits(addr);
    		toFile=toFile.concat(addr);	
            
            break;
        case "JUMP":
            toFile = toFile.concat("1000");
            int addrjump=Integer.parseInt(seperateRegisterAdress(elementArray[0]));
			if(addrjump<0) {
				oneOrZero="1";
				addr=""+""+Integer.parseInt(Integer.toBinaryString((16384-Math.abs(addrjump))));
        	}else {
        		oneOrZero="0";
        		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrjump))));
        	}
			toFile=toFile.concat(oneOrZero);
        		addr=get14Bits(addr);
        	toFile=toFile.concat(addr);	
            
            break;
        case "BEQ":
            toFile = toFile.concat("1011");
            n="0";z="1";p="0";
            	operation1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
            	operation1=get4Bits(operation1);
            toFile=toFile.concat(operation1);
            	operation2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
            	operation2=get4Bits(operation2);
            toFile=toFile.concat(operation2);
        	int addrbeq=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
    			if(addrbeq<0) {
    				oneOrZero="1";
    				addr=""+""+Integer.parseInt(Integer.toBinaryString((16-Math.abs(addrbeq))));
            	}else {
            		oneOrZero="0";
            		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrbeq))));
            	}
            toFile=toFile.concat(oneOrZero);
            	addr=get4Bits(addr);
            toFile=toFile.concat(addr);	
            toFile=toFile.concat(n+""+z+""+p);
            break;
        case "BLT":
        	n="1";z="0";p="0";
            toFile = toFile.concat("1100");
        	operation1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        	operation1=get4Bits(operation1);
        toFile=toFile.concat(operation1);
        	operation2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        	operation2=get4Bits(operation2);
        toFile=toFile.concat(operation2);
    	int addrblt=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
			if(addrblt<0) {
				oneOrZero="1";
				addr=""+""+Integer.parseInt(Integer.toBinaryString((16-Math.abs(addrblt))));
        	}else {
        		oneOrZero="0";
        		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrblt))));
        	}
        toFile=toFile.concat(oneOrZero);
        	addr=get4Bits(addr);
        toFile=toFile.concat(addr);	
        toFile=toFile.concat(n+z+p);
            break;
        case "BGT":
        	n="0";z="0";p="1";
            toFile = toFile.concat("1101"); 
        	operation1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        	operation1=get4Bits(operation1);
        toFile=toFile.concat(operation1);
        	operation2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        	operation2=get4Bits(operation2);
        toFile=toFile.concat(operation2);
        	int addrbgt=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
        	if(addrbgt<0) {
        		oneOrZero="1";
        		addr=""+""+Integer.parseInt(Integer.toBinaryString((16-Math.abs(addrbgt))));
        	}else {
        		oneOrZero="0";
        		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrbgt))));
        	}
        toFile=toFile.concat(oneOrZero);
        	addr=get4Bits(addr);
        toFile=toFile.concat(addr);
        toFile=toFile.concat(n+z+p);
            break;
        case "BLE":
        	n="1";z="1";p="0";
            toFile = toFile.concat("1110");  
        	operation1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        	operation1=get4Bits(operation1);
        toFile=toFile.concat(operation1);
        	operation2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        	operation2=get4Bits(operation2);
        toFile=toFile.concat(operation2);
    	int addrble=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
    		if(addrble<0) {
    			oneOrZero="1";
    			addr=""+""+Integer.parseInt(Integer.toBinaryString((16-Math.abs(addrble))));
        	}else {
        		oneOrZero="0";
        		addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrble))));
        	}
        toFile=toFile.concat(oneOrZero);
        	addr=get4Bits(addr);
        toFile=toFile.concat(addr);
        toFile=toFile.concat(n+""+z+""+p);
            break;
        case "BGE":
        	n="0";z="1";p="1";
            toFile = toFile.concat("1111"); 
        	operation1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        	operation1=get4Bits(operation1);
        toFile=toFile.concat(operation1);
        	operation2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        	operation2=get4Bits(operation2);
        toFile=toFile.concat(operation2);
    	int addrbge=Integer.parseInt(seperateRegisterAdress(elementArray[2]));
			if(addrbge<0) {
				oneOrZero="1";
				addr=""+""+Integer.parseInt(Integer.toBinaryString((16-Math.abs(addrbge))));
			}else {
    			oneOrZero="0";
    			addr=""+""+Integer.parseInt(Integer.toBinaryString(((addrbge))));
    		}
        toFile=toFile.concat(oneOrZero);
        	addr=get4Bits(addr);
        toFile=toFile.concat(addr);	   
        toFile=toFile.concat(n+""+z+""+p);
            break;
            default:
               System.err.println("Switch Case Deafult Value Error");
    }
    toFile = toFile.concat("\n");
}
        return toFile;
}

	public static String get4Bits(String string) {
		if(string.length()==1) {
			return "000"+string;
		}else if(string.length()==2) {
			return "00"+string;
		}else if(string.length()==3) {
			return "0"+string;
		}else {
			return string;
		}
}
	
	public static String get7Bits(String string) {
		if(string.length()==1) {
			return "000000"+string;
		}else if(string.length()==2) {
			return "00000"+string;
		}else if(string.length()==3) {
			return "0000"+string;
		}else if(string.length()==4) {
			return "000"+string;
		}else if(string.length()==5) {
			return "00"+string;
		}else if(string.length()==6) {
			return "0"+string;
		}else {
			return string;
		}
}
	
	public static String get10Bits(String string) {
		if(string.length()==1) 		  {
			return "0000000000"+string;
		}else if(string.length()==2)  {
			return "000000000"+string;
		}else if(string.length()==3)  {
			return "00000000"+string;
		}else if(string.length()==4)  {
			return "0000000"+string;
		}else if(string.length()==5)  {
			return "000000"+string;
		}else if(string.length()==6)  {
			return "00000"+string;
		}else if(string.length()==7)  {
			return "0000"+string; 
		}else if(string.length()==8)  {
			return "000"+string;
		}else if(string.length()==9)  {
			return "00"+string;
		}else if(string.length()==10) {
			return "0"+string;
		}else {
			return string;
		}
}	
	

	public static String get14Bits(String string) {
		if(string.length()==1) 		  {
			return "00000000000000"+string;
		}else if(string.length()==2)  {
			return "0000000000000"+string;
		}else if(string.length()==3)  {
			return "000000000000"+string;
		}else if(string.length()==4)  {
			return "00000000000"+string;
		}else if(string.length()==5)  {
			return "0000000000"+string;
		}else if(string.length()==6)  {
			return "000000000"+string;
		}else if(string.length()==7)  {
			return "00000000"+string; 
		}else if(string.length()==8)  {
			return "0000000"+string;
		}else if(string.length()==9)  {
			return "000000"+string;
		}else if(string.length()==10) {
			return "00000"+string;
		}else if(string.length()==11) {
			return "0000"+string;
		}else if(string.length()==12) {
			return "000"+string;
		}else if(string.length()==13) {
			return "00"+string;
		}else if(string.length()==14) {
			return "0"+string;
		}else {
			return string;
		}
}	

	
	public static String seperateRegisterAdress(String register){
		String returnValue="";
    	for (String addressValue: register.split("R")) {
            returnValue=addressValue;
         }
		return returnValue;
    }
}