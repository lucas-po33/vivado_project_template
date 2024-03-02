library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top_level_tb is
end entity;

architecture arch of top_level_tb is

constant PERIOD : time := 10 ns;

signal clk : std_ulogic := '0';
signal rst, led, rx, tx : std_ulogic;

begin

uut : entity work.top_level
    generic map (
        MODULO => 15
    )
    port map (
        sys_clk => clk,
        rst => rst,
        led => led,
        rx => rx,
        tx => tx
    );

clk_gen : process begin
    wait for PERIOD / 2;
    clk <= not clk;
end process;

stimuli : process begin
    rx <= '0';
    rst <= '1';
    wait for PERIOD;
    rst <= '0';

    wait for PERIOD * 16;

    report "ok";
    std.env.finish;
end process;

end architecture;