library verilog;
use verilog.vl_types.all;
entity ArithmeticLogicUnit is
    port(
        input1          : in     vl_logic_vector(19 downto 0);
        input2          : in     vl_logic_vector(19 downto 0);
        \select\        : in     vl_logic_vector(1 downto 0);
        result          : out    vl_logic_vector(19 downto 0)
    );
end ArithmeticLogicUnit;
