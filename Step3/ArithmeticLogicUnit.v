
// Verilog code for ALU
module ArithmeticLogicUnit(       
      input [19:0] input1, //src1  
      input [19:0] input2,  //src2  
      input [1:0] select,     //function sel  
      output reg [19:0] result         //result       
      
   );  
 always @(*)  
 begin   
      case(select)  
      2'b00: result = input1 + input2; // add  
      2'b01: result = input1 & input2; // and 
      2'b10: result = input1 | input2; // or  
      2'b11: result = input1 ^ input2; // xor  
     
      default:result = input1 + input2; // add  
      endcase  
 end  
 
 endmodule  