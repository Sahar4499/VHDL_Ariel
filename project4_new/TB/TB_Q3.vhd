library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_A_Q3 is
end TB_A_Q3;

architecture Behavioral of TB_A_Q3 is

    component A is
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

    UUT : A
        port map(
            a => a,
            b => b,
            c => c,
            y => y
        );

    process
    begin
        a <= '0'; b <= '0'; c <= '0'; wait for 10 ns;
        a <= '0'; b <= '0'; c <= '1'; wait for 10 ns;
        a <= '0'; b <= '1'; c <= '1'; wait for 10 ns;
        a <= '1'; b <= '1'; c <= '0'; wait for 10 ns;
        a <= '1'; b <= '0'; c <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; c <= '1'; wait for 10 ns;
        a <= '0'; b <= '1'; c <= '0'; wait for 10 ns;

        wait;
    end process;

end Behavioral;