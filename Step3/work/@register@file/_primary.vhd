library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        clock           : in     vl_logic;
        WE              : in     vl_logic;
        DstAddr         : in     vl_logic_vector(3 downto 0);
        input1          : in     vl_logic_vector(19 downto 0);
        Src1Addr        : in     vl_logic_vector(3 downto 0);
        Src1Out         : out    vl_logic_vector(19 downto 0);
        Src2Addr        : in     vl_logic_vector(3 downto 0);
        Src2Out         : out    vl_logic_vector(19 downto 0)
    );
end RegisterFile;
