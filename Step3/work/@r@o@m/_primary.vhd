library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        address         : in     vl_logic_vector(9 downto 0);
        data            : out    vl_logic_vector(19 downto 0);
        \select\        : in     vl_logic
    );
end ROM;
