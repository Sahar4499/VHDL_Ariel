library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_conditional is
    port(
        D : in  std_logic_vector(7 downto 0);
        Y : out std_logic_vector(2 downto 0)
    );
end encoder_conditional;

architecture Behavioral of encoder_conditional is
begin

    Y <= "000" when D = "00000001" else
         "001" when D = "00000010" else
         "010" when D = "00000100" else
         "011" when D = "00001000" else
         "100" when D = "00010000" else
         "101" when D = "00100000" else
         "110" when D = "01000000" else
         "111" when D = "10000000" else
         "XXX";

end Behavioral;
