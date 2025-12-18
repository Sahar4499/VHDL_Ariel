library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity A_Q3 is
    port(
        a, b, c : in  bit;
        y       : out bit
    );
end A_Q3;

architecture Behavioral of A_Q3 is
    signal tmp1 : bit := '0';
begin
    process(a, c)              -- שי�?/י לב: b ל�? ב-sensitivity list
        variable tmp2 : bit := '1';
    begin
        tmp1 <= a xor b;       -- tmp1 הו�? SIGNAL
        tmp2 := tmp1 and c;    -- tmp2 הו�? VARIABLE, משתמש ב-tmp1 "הישן"
        y    <= tmp1 xor tmp2; -- ג�? y משתמש ב-tmp1 "הישן"
    end process;
end Behavioral;