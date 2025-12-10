library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity Question2 is
    port(
        a, b, c : in bit;
        y       : out bit
    );
end Question2;

architecture arc of Question2 is
    signal temp : bit;
begin
    process (a, b, c)
    begin
        temp <= a xor b;
        y    <= temp xor c;
    end process;
end arc;