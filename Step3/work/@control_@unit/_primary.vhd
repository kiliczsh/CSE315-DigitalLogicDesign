library verilog;
use verilog.vl_types.all;
entity Control_Unit is
    port(
        opcode          : in     vl_logic_vector(3 downto 0);
        clock           : in     vl_logic;
        alu_op          : out    vl_logic_vector(1 downto 0);
        jump            : out    vl_logic;
        mem_load        : out    vl_logic;
        mem_st          : out    vl_logic;
        mem_alu         : out    vl_logic;
        reg_write       : out    vl_logic;
        alu_control     : out    vl_logic;
        imm_signal      : out    vl_logic;
        greater         : out    vl_logic;
        less            : out    vl_logic;
        equal           : out    vl_logic;
        branch_sig      : out    vl_logic;
        beq             : out    vl_logic;
        blt             : out    vl_logic;
        bgt             : out    vl_logic;
        ble             : out    vl_logic;
        bge             : out    vl_logic;
        branch_mux      : out    vl_logic;
        PC_WE           : out    vl_logic;
        IR_WE           : out    vl_logic
    );
end Control_Unit;
