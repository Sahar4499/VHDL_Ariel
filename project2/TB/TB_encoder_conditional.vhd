library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_encoder_conditional is
end TB_encoder_conditional;

architecture Behavioral of TB_encoder_conditional is
  
    component encoder_conditional is
        port(
            D : in  std_logic_vector(7 downto 0);
            Y : out std_logic_vector(2 downto 0)
        );
    end component;

    signal D : std_logic_vector(7 downto 0) := (others => '0');
    signal Y : std_logic_vector(2 downto 0);

begin

    UUT1 : encoder_conditional
        port map(
            D => D,
            Y => Y
        );

    stim_proc : process
    begin
        D <= "00000001"; wait for 10 ns;
        D <= "00000010"; wait for 10 ns;
        D <= "00000100"; wait for 10 ns;
        D <= "00001000"; wait for 10 ns;
        D <= "00010000"; wait for 10 ns;
        D <= "00100000"; wait for 10 ns;
        D <= "01000000"; wait for 10 ns;
        D <= "10000000"; wait for 10 ns;
        wait;
    end process;

end Behavioral;
