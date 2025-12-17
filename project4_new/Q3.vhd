library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity A is
    port(
        a, b, c : in  bit;
        y       : out bit
    );
end A;

architecture Behavioral of A is
    signal tmp1 : bit := '0';
begin
    process(a, c)              -- שים/י לב: b לא ב-sensitivity list
        variable tmp2 : bit := '1';
    begin
        tmp1 <= a xor b;       -- tmp1 הוא SIGNAL
        tmp2 := tmp1 and c;    -- tmp2 הוא VARIABLE, משתמש ב-tmp1 "הישן"
        y    <= tmp1 xor tmp2; -- גם y משתמש ב-tmp1 "הישן"
    end process;
end Behavioral;