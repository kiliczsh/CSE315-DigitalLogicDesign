`timescale 1ns / 1ps


// Verilog code for register file
module RegisterFile(
 input    clock,
 // write port
 input    WE,
 input  [3:0] DstAddr,
 input  [19:0] input1,
 //read port 1
 input  [3:0] Src1Addr,
 output  [19:0] Src1Out,
 //read port 2
 input  [3:0] Src2Addr,
 output  [19:0] Src2Out
);
 reg [19:0] register_array [15:0];
 integer i;
 // write port
 //reg [3:0] i;
 initial begin
  for(i=0;i<16;i=i+1)
   register_array[i] <= 16'd0;
 end
 always @ (posedge clock ) begin
   if(WE) begin
    register_array[DstAddr] <= input1;
   end
 end
 

 assign Src1Out = register_array[Src1Addr];
 assign Src2Out = register_array[Src2Addr];


endmodule