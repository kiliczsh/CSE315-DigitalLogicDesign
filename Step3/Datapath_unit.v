`timescale 1 ns / 1 ns

module Datapath_Unit(
 input clk,
 input jump,mem_load, mem_st ,mem_alu,reg_write ,
 imm_signal ,greater, less, equal, branch_sig, beq, blt, bgt, ble, bge, branch_mux,BRmux , IMM,
 input[1:0] alu_op,
 output[3:0] opcode
);
 reg  [19:0] pc_current;
 wire [19:0] pc_next,plus1;
 wire [19:0] instr;
 wire [3:0] DstAddr;
 wire [19:0] input1;
 wire [3:0] Src1Addr;
 wire [19:0] Src1Out;
 wire [3:0] Src2Addr;
 wire [19:0] Src2Out;
 wire [19:0] IMM_bits,read_data2;
 wire [1:0] select;
 wire [19:0] ALUK; // result of alu
 wire zero_flag;
 wire [19:0] PC_j, PC_beq, PC_2beq,PC_2bne,PC_bne;
 wire beq_control;
 wire [11:0] jump_shift;
 wire [19:12] jump_address;
 wire [17:13] branch_address;
 wire [19:0] Memory;
 wire [19:0] signal;

 // PC 
 initial begin
  pc_current <= 20'd0;
 end
 always @(posedge clk)
 begin 
   pc_current <= pc_next;
 end
 assign plus1 = pc_current + 20'd1;
 // instruction memory
 Instruction_Memory im(.pc(pc_current),.data(instr));
 
  assign Src1Addr = instr[7:4];
  assign Src2Addr = instr[11:8];
 // jump shift left 2
 assign jump_shift = {instr[11:0],1'b0};
 // multiplexer regdest
 assign Src1Addr = ((BRmux || mem_st) == 1'b1) ? instr[7:4] :instr[11:8];
 assign Src2Addr = (BRmux==1'b1) ? instr[11:8] :instr[15:12];


 // GENERAL PURPOSE REGISTERs
 GPRs reg_file
 (
  .clk(clk),
  .WE(reg_write),
  .DstAddr(DstAddr),
  .input1(input1),
  .Src1Addr(Src1Addr),
  .Src1Out(Src1Out),
  .Src2Addr(Src2Addr),
  .Src2Out(Src2Out)
 );
 // immediate extend
 assign IMM_bits = {{10{instr[8]}},instr[19:12]};  

 // multiplexer alu_src
 assign input2 = (imm_signal == 1'b1) ? IMM_bits : Src2Out;
 // ALU 
 ALU alu_unit(.input1(Src1Out),.input2(input2),.select(select),.result(ALUK),.zero(zero_flag));


 // PC_beq
 assign pc_next = (branch_sig || jump == 1'b1) ? signal : plus1;
 // PC_bne
 assign pc_next2 = (branch_sig == 1'b1) ? branch_address : jump_address;

 
 
 

 /// Data memory
  Data_Memory dm
   (
    .clk(clk),
    .mem_access_addr(ALU_out),
    .mem_write_data(Src2Out),
    .mem_write_en(mem_write),
    
    .q(mem_read_data)
   );
 
 // write back
 assign DstAddr = (mem_alu == 1'b1)?  Memory: ALUK;
 // output to control unit
 assign opcode = instr[3:0];
endmodule