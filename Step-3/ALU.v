`include "20BitAdder.v"
`include "20BitAnd.v"
`include "20BitOr.v"
`include "20BitXor.v"
`include "Mux.v"



module ALU (
    input wire [19:0] input1,
    input wire [19:0] input2,
    input wire [1:0] aluSelect,
    output wire [19:0] outputALU
  );
  
  wire [19:0] resultAnd,resultAdd,resultOr,resultXor;
  
  BitAnd20 andGateR (resultAnd,input1,input2);
  BitOr20 orGateR (resultOr,input1,input2);
  BitXor20 xorGateR (resultXor,input1,input2);
  BitAdder20 addGateR (resultAdd,input1,input2);
  mux4to1 muxALU (outputALU,resultAnd,resultAdd,resultOr,resultXor,aluSelect);
  
endmodule
  
  
  
