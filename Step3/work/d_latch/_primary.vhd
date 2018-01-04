library verilog;
use verilog.vl_types.all;
entity d_latch is
    port(
        data            : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end d_latch;
