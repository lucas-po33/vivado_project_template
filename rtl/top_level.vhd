library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top_level is
    generic (
        MODULO : positive := 50000000
    );
    port (
        sys_clk, rst, rx : in std_ulogic;
        led, tx : out std_ulogic
        );
end top_level;

architecture Behavioral of top_level is

signal clk : std_ulogic;

begin

clk_gen : entity work.clk_wiz
    port map (
        clk_in => sys_clk,
        reset => rst,
        clk_out => clk
    );
    
bd : entity work.design_1_wrapper
    port map (
        clk => clk,
        rst => rst,
        uart_rxd => rx,
        uart_txd => tx
    );

process(clk)
    variable count : natural := 0;
begin

    if rising_edge(clk) then
        if rst = '1' then
            count := 0;
            led <= '0';
        elsif count = MODULO - 1 then
            count := 0;
            led <= not led;
        else
            count := count + 1;
        end if;
    end if;

end process;

end Behavioral;
