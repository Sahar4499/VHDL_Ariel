library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_demux1x8_conitional is
end TB_demux1x8_conitional;

architecture Behavioral of TB_demux1x8_conitional is
  
    component demux1x8_conitional is
        port(
            Din : in  std_logic;
            sel : in  std_logic_vector(2 downto 0);
            Y   : out std_logic_vector(7 downto 0)
        );
    end component;

    signal Din : std_logic := '0';
    signal sel : std_logic_vector(2 downto 0);
    signal Y   : std_logic_vector(7 downto 0);

begin

    UUT1 : demux1x8_conitional
        port map(
            Din => Din,
            sel => sel,
            Y   => Y
        );

    process
    begin
        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "000"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "001"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "010"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "011"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "100"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "101"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "110"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';
        sel <= "111"; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';

        wait;
    end process;

end Behavioral;
