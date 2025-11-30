library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Q1 is
end TB_Q1;

architecture Behavioral of TB_Q1 is

    component Q1 is
        port(
            A : in  std_logic_vector(7 downto 0);
            B : in  std_logic_vector(3 downto 0);
            Y : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A : std_logic_vector(7 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');
    signal Y : std_logic_vector(7 downto 0);

begin

    UUT1 : Q1
        port map(
            A => A,
            B => B,
            Y => Y
        );

    stim_proc : process
    begin
        -- case 1
        A <= "00000000"; B <= "0000"; wait for 10 ns;
        -- case 2
        A <= "11111111"; B <= "0000"; wait for 10 ns;
        -- case 3
        A <= "11110000"; B <= "1111"; wait for 10 ns;
        -- case 4
        A <= "00001111"; B <= "1010"; wait for 10 ns;
        -- case 5
        A <= "10101010"; B <= "0101"; wait for 10 ns;

        wait;
    end process;

end Behavioral;