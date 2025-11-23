library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder_select is
    port(
        D0,D1,D2,D3,D4,D5,D6,D7 : in  std_logic;
        Y                       : out std_logic_vector(2 downto 0)
    );
end encoder_select;

architecture Behavioral of encoder_select is
    signal Din : std_logic_vector(7 downto 0);
begin

    Din <= D7 & D6 & D5 & D4 & D3 & D2 & D1 & D0;
    with Din select
        Y <= "000" when "00000001",
             "001" when "00000010",
             "010" when "00000100",
             "011" when "00001000",
             "100" when "00010000",
             "101" when "00100000",
             "110" when "01000000",
             "111" when "10000000",
             "XXX" when others;  
end Behavioral;
