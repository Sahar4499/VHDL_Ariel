library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Demux1x8 is
end TB_Demux1x8;

architecture Behavioral of TB_Demux1x8 is

    component Demux1x8 is
        port(
            D   : in  std_logic;
            SEL : in  std_logic_vector(2 downto 0);
            Y   : out std_logic_vector(7 downto 0)
        );
    end component;

    signal D   : std_logic := '0';
    signal SEL : std_logic_vector(2 downto 0) := (others => '0');
    signal Y   : std_logic_vector(7 downto 0);

begin
    UUT : Demux1x8
        port map(
            D   => D,
            SEL => SEL,
            Y   => Y
        );

    process
    begin
        D <= '1';

        SEL <= "000"; wait for 20 ns;
        SEL <= "001"; wait for 20 ns;
        SEL <= "010"; wait for 20 ns;
        SEL <= "011"; wait for 20 ns;
        SEL <= "100"; wait for 20 ns;
        SEL <= "101"; wait for 20 ns;
        SEL <= "110"; wait for 20 ns;
        SEL <= "111"; wait for 20 ns;

        wait;
    end process;

end Behavioral;
