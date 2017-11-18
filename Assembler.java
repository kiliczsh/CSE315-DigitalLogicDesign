import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;
public class Test {
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

        String destinationRegister=null,sourceRegister1=null,sourceRegister2=null;
        String immediateValue=null,oneOrZero=null,addr=null,operation1=null,operation2=null;
        String n=null,z=null,p=null;
        
    switch (opcode){
        case "ADD":
            toFile=toFile.concat("0000");
            	destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
            	destinationRegister=getBits(destinationRegister);
            toFile=toFile.concat(destinationRegister);
            	sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
            	sourceRegister1=getBits(sourceRegister1);
            toFile=toFile.concat(sourceRegister1);
            	sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
            	sourceRegister2=getBits(sourceRegister2);
            toFile=toFile.concat(sourceRegister2);
            toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
            break;
        case "ADDI":
            toFile=toFile.concat("0001");
            
            
            
            
            
            break;
        case "AND":
            toFile=toFile.concat("0010");
        	destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        	destinationRegister=getBits(destinationRegister);
        toFile=toFile.concat(destinationRegister);
        	sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        	sourceRegister1=getBits(sourceRegister1);
        toFile=toFile.concat(sourceRegister1);
        	sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
        	sourceRegister2=getBits(sourceRegister2);
        toFile=toFile.concat(sourceRegister2);
        toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
            break;
        case "ANDI":
            toFile=toFile.concat("0011");

            break;
        case "OR":
            toFile=toFile.concat("0100");
        		destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        		destinationRegister=getBits(destinationRegister);
        	toFile=toFile.concat(destinationRegister);
        		sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        		sourceRegister1=getBits(sourceRegister1);
        	toFile=toFile.concat(sourceRegister1);
        		sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
        		sourceRegister2=getBits(sourceRegister2);
        	toFile=toFile.concat(sourceRegister2);
        	toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
            break;
        case "ORI":
            toFile=toFile.concat("0101");

            break;
        case "XOR":
        	toFile = toFile.concat("0110");
        		destinationRegister=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[0]))));
        		destinationRegister=getBits(destinationRegister);
        	toFile=toFile.concat(destinationRegister);
        		sourceRegister1=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[1]))));
        		sourceRegister1=getBits(sourceRegister1);
        	toFile=toFile.concat(sourceRegister1);
        		sourceRegister2=""+Integer.parseInt(Integer.toBinaryString(Integer.parseInt(seperateRegisterAdress(elementArray[2]))));
        		sourceRegister2=getBits(sourceRegister2);
        	toFile=toFile.concat(sourceRegister2);
        	toFile=toFile.concat(""+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1)+(int)(Math.random() * 1));
        	break;
        case "XORI":
        	toFile = toFile.concat("0111");
        	
        	break;	
        case "LD":
            toFile = toFile.concat("1001");

            break;
        case "ST":
            toFile = toFile.concat("1010");

            break;
        case "JUMP":
            toFile = toFile.concat("1000");

            break;
        case "BEQ":
            toFile = toFile.concat("1011");

            break;
        case "BLT":
            toFile = toFile.concat("1100");

            break;
        case "BGT":
            toFile = toFile.concat("1101"); 
            
            break;
        case "BLE":
            toFile = toFile.concat("1110");  
            
            break;
        case "BGE":
            toFile = toFile.concat("1111"); 
            
            break;
            default:
               System.err.println("Switch Case Deafult Value Error");
    }
    toFile = toFile.concat("\n");
}
        return toFile;
}

	public static String getBits(String string) {
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

	public static String seperateRegisterAdress(String register){
		String returnValue="";
    	for (String addressValue: register.split("R")) {
            returnValue=addressValue;
         }
		return returnValue;
    }
}
