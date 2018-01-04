`timescale 1ns / 1ps


// Verilog code for Control Unit 

module Control_Unit(
      input[3:0] opcode,
      input clock,
      output reg[1:0] alu_op,
      output reg jump, mem_load, mem_st ,mem_alu,reg_write ,alu_control, imm_signal
	  ,greater,less,equal,branch_sig,beq,blt,bgt,ble,bge,branch_mux ,
       PC_WE,IR_WE 
    );


always @(posedge clock)
begin
 case(opcode) 

 4'h0:  // ADD
   begin
reg_write = 1'b1;
alu_control =  2'b00;
   end

 4'h1:  // ADDI
   begin
reg_write = 1'b1;
imm_signal = 1'b1;
alu_control =  2'b00;
   end

 4'h2:  // AND
   begin
reg_write = 1'b1;
alu_control =  2'b01;
   end

 4'h3:  // ANDI
   begin
reg_write = 1'b1;
imm_signal = 1'b1;
alu_control =  2'b01;
   end

4'h4:  // OR
   begin
reg_write = 1'b1;
alu_control =  2'b10;
   end

 4'h5:  // ORI
   begin
reg_write = 1'b1;
imm_signal = 1'b1;
alu_control =  2'b10;
   end

4'h6:  // XOR
   begin
reg_write = 1'b1;
alu_control =  2'b11;
   end

 4'h7:  // XORI
   begin
reg_write = 1'b1;
imm_signal = 1'b1;
alu_control =  2'b11;
   end

 4'h8:  // JUMP
begin
   jump = 1'b1;
   end

 4'h9:  // LD
   begin
reg_write = 1'b1;
mem_load = 1'b1;
mem_alu = 1'b1;
     
   end

 4'ha:  // ST
   begin
reg_write = 1'b1;
mem_st = 1'b1;
mem_alu = 1'b1;
   end

 4'hb:  // beq
   begin
if(equal == 1'b1 )
begin 
branch_sig =1'b1;
end
   reg_write = 1'b0; 
   branch_mux = 1'b1; 
   end

 4'hc:  // blt
   begin
if(less == 1'b1 )
begin 
branch_sig =1'b1;
end
reg_write = 1'b0;
branch_mux = 1'b1; 
    end

 4'hd:  // bgt
   begin
if(greater == 1'b1 )
begin 
branch_sig =1'b1;
end
   reg_write = 1'b0;
   branch_mux = 1'b1; 
   end 

 4'he:  // ble
   begin
if(equal == 1'b1 || less == 1'b1 )
begin 
branch_sig =1'b1;
end
     reg_write = 1'b0;
     branch_mux = 1'b1; 
   end
   
  4'hf:  // bge
   begin
if(equal == 1'b1 || greater == 1'b1 )
begin 
branch_sig =1'b1;
end
     reg_write = 1'b0;
     branch_mux = 1'b1; 
   end 

 endcase
 end
             always @(posedge clock) begin
		PC_WE = 1'b1;
		IR_WE = 1'b0;
               end
		
	    always @( negedge clock) begin
		PC_WE = 1'b0;
		IR_WE = 1'b1;
              end
		


 

endmodule

