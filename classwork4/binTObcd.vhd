library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binTObcd is
    port(
        BIN   : in  integer range 0 to 31;
        BCD_H : out std_logic_vector(1 downto 0);
        BCD_L : out std_logic_vector(3 downto 0)
    );
end binTObcd;

architecture Behavioral of binTObcd is
begin


    with BIN select
        BCD_L <= "0000" when 0 | 10 | 20 | 30,
                 "0001" when 1 | 11 | 21 | 31,
                 "0010" when 2 | 12 | 22,
                 "0011" when 3 | 13 | 23,
                 "0100" when 4 | 14 | 24,
                 "0101" when 5 | 15 | 25,
                 "0110" when 6 | 16 | 26,
                 "0111" when 7 | 17 | 27,
                 "1000" when 8 | 18 | 28,
                 "1001" when 9 | 19 | 29,
                 "XXXX" when others;

    with val select
        BCD_H <= "00" when (BIN<10),
                 "01" when (BIN<20),
                 "10" when (BIN<30),
                 "11" when others;

end Behavioral;