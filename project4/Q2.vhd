library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Question2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
end Question2;

architecture Behavioral of Question2 is
    signal temp : STD_LOGIC;
begin
    process (a, b, c)
    begin
        temp <= a xor b;
        y <= temp xor c;
    end process;
end Behavioral;