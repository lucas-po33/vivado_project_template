library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity reg is
    port (
        clk, rst, ce, d : in std_ulogic;
        q : out std_ulogic
        );
end entity;

architecture arch of reg is begin

process(clk) begin
    if rising_edge(clk) then
        if rst then
            q <= '0';
        elsif ce then
            q <= d;
        end if;
    end if;
end process;

end architecture;