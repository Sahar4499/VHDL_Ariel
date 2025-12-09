library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_V is
end TB_V;

architecture Behavioral of TB_V is

    component V is
        port (
            a : in  std_logic;
            b : out std_logic
        );
    end component;

    signal a_tb : std_logic := '0';
    signal b_tb : std_logic;

begin


    UUT : V
        port map (
            a => a_tb,
            b => b_tb
        );


    stim_proc : process
    begin
 
        a_tb <= '0';
        wait for 20 ns;

        a_tb <= '1';
        wait for 20 ns;

        a_tb <= '0';
        wait for 20 ns;

        a_tb <= '1';
        wait for 20 ns;

        a_tb <= '0';
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
