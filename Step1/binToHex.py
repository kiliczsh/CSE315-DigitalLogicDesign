"""
 * 150115048-Muhammed KILIÇ
 * 150114048-M.Cumali DEMİR
 * 150114016-Rümeysa ELİÖZ
"""

binaryFile = open("output.txt","r")
hexFile = open("instructionMemory.txt","w")
while (True):
        line=binaryFile.readline()
        if not line:
        	break
        else:
        	newLine=hex(int(line, 2))
        	if (len(newLine)!=7):
        		newLine=newLine.replace("x","x0")
       		hexFile.write(newLine)
       		hexFile.write("\n")
hexFile.close()
