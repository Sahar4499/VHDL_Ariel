library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--מימוש הבלוק
entity encoder8x3 is 
    port(D0,D1,D2,D3,D4,D5,D6,D7:in std_logic;
    Y0,Y1,Y2:out std_logic);
end  encoder8x3;
--מימוש התנהגות לפי סכמה לוגית
architecture Behavioral of encoder8x3 is
    begin
        Y0<=D1 or D3 or D5 or D7;
        Y1<=D2 or D3 or D6 or D7;
        Y2<=D4 or D5 or D6 or D7;
        end Behavioral;



