library verilog;
use verilog.vl_types.all;
entity Datapath_Unit is
    port(
        clk             : in     vl_logic;
        jump            : in     vl_logic;
        mem_load        : in     vl_logic;
        mem_st          : in     vl_logic;
        mem_alu         : in     vl_logic;
        reg_write       : in     vl_logic;
        imm_signal      : in     vl_logic;
        greater         : in     vl_logic;
        less            : in     vl_logic;
        equal           : in     vl_logic;
        branch_sig      : in     vl_logic;
        beq             : in     vl_logic;
        blt             : in     vl_logic;
        bgt             : in     vl_logic;
        ble             : in     vl_logic;
        bge             : in     vl_logic;
        branch_mux      : in     vl_logic;
        BRmux           : in     vl_logic;
        IMM             : in     vl_logic;
        alu_op          : in     vl_logic_vector(1 downto 0);
        opcode          : out    vl_logic_vector(3 downto 0)
    );
end Datapath_Unit;
