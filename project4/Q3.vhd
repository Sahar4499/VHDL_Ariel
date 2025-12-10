library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Question3 is
    port(
        a, b, c : in bit;
        y       : out bit
    );
end Question3;

architecture arc of Question3 is
    signal count : integer;
begin
    process (a, b, c)
        variable temp : bit;
        variable cnt  : integer := 0;
    begin
        temp := a xor b;
        y    <= temp xor c;
        
        cnt   := cnt + 1;
        count <= cnt;
    end process;
end arc;