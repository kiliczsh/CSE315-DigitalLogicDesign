library verilog;
use verilog.vl_types.all;
entity RAM is
    port(
        data            : in     vl_logic_vector(19 downto 0);
        addr            : in     vl_logic_vector(9 downto 0);
        we              : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(19 downto 0)
    );
end RAM;
