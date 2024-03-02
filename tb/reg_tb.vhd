library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity reg_tb is
end entity;

architecture arch of reg_tb is

constant PERIOD : time := 10 ns;

signal clk : std_ulogic := '0';
signal rst, ce, d, q : std_ulogic;

begin

uut : entity work.reg
    port map (
        clk => clk,
        rst => rst,
        ce => ce,
        d => d,
        q => q
    );

clk_gen : process begin
    wait for PERIOD / 2;
    clk <= not clk;
end process;

stimuli : process begin
    rst <= '1';
    ce <= '0';
    d <= '0';
    wait for PERIOD;
    rst <= '0';
    ce <= '1';
    d <= '1';
    wait for PERIOD;
    ce <= '0';
    d <= '0';
    wait for PERIOD;

    report "ok" severity failure;
    std.env.finish;
end process;

end architecture;