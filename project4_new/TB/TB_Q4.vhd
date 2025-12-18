library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Q4 is
end TB_Q4;

architecture Behavioral of TB_Q4 is

    component Q4 is
        port(
            a, b, c : in  bit;
            y       : out bit
        );
    end component;

    signal a : bit := '0';
    signal b : bit := '0';
    signal c : bit := '0';
    signal y : bit;

begin

    UUT : Q4
        port map(
            a => a,
            b => b,
            c => c,
            y => y
        );

    process
    begin
        -- t = 0 ns
        a <= '0'; b <= '0'; c <= '0'; wait for 10 ns;
        -- t = 10 ns
        a <= '0'; b <= '0'; c <= '1'; wait for 10 ns;
        -- t = 20 ns
        a <= '0'; b <= '1'; c <= '0'; wait for 10 ns;
        -- t = 30 ns
        a <= '0'; b <= '1'; c <= '1'; wait for 10 ns;
        -- t = 40 ns
        a <= '1'; b <= '0'; c <= '0'; wait for 10 ns;
        -- t = 50 ns
        a <= '1'; b <= '0'; c <= '1'; wait for 10 ns;
        -- t = 60 ns
        a <= '1'; b <= '1'; c <= '0'; wait for 10 ns;
        -- t = 70 ns
        a <= '1'; b <= '1'; c <= '1'; wait for 10 ns;

        wait;
    end process;

end Behavioral;
