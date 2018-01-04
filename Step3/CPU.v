
module CPU(
 input clk
);
 wire jump, mem_load, mem_st ,mem_alu,reg_write ,alu_control, imm_signal ,greater,less,equal,branch_sig,beq,blt,bgt,ble,bge,branch_mux ,
PC_WE,IR_WE;
 wire[1:0] select;
 wire [3:0] opcode;
 // Datapath
 Datapath_Unit DU
 (
  .clk(clk),
  .jump(jump),
  .mem_load(mem_load),
  .mem_st(mem_st),
  .mem_alu(mem_alu),
  .reg_write(reg_write),
  .alu_control(alu_control),
  .imm_signal(imm_signal),
  .greater(greater),
  .less(less),
  .equal(equal),
  .branch_sig(branch_sig),
  .beq(beq),
  .blt(blt),
  .bgt(bgt),
  .ble(ble),
  .bge(bge),  
  .branch_mux(branch_mux),
  .PC_WE(PC_WE),
  .IR_WE(IR_WE),
  .select(select),
  .opcode(opcode)
 );
 // control unit
 Control_Unit Control
 (
  .jump(jump),
  .mem_load(mem_load),
  .mem_st(mem_st),
  .mem_alu(mem_alu),
  .reg_write(reg_write),
  .alu_control(alu_control),
  .imm_signal(imm_signal),
  .greater(greater),
  .less(less),
  .equal(equal),
  .branch_sig(branch_sig),
  .beq(beq),
  .blt(blt),
  .bgt(bgt),
  .ble(ble),
  .bge(bge),  
  .branch_mux(branch_mux),
  .PC_WE(PC_WE),
  .IR_WE(IR_WE),
  .select(select),
  .opcode(opcode)
 );

endmodule