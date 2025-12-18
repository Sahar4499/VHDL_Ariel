library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q4 is
    port 
    (
    a,b,c : in  bit;
    y      :out  bit
    );
end Q4;

architecture B1 of Q4 is
    signal count : integer;
begin
    process(a, b, c)
        variable temp : bit;
        variable cnt  : integer := 1;
    begin
        temp := a xor b;
        y    <= temp xor c;
        cnt  := cnt + 3;
        count <= cnt;
    end process;
end B1;
