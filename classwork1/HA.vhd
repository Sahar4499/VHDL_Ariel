library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is
    port (
        x, y : in std_logic;
        s, c : out std_logic
    );
end HA;

architecture Behavioral of HA is
begin
    -- סכום = XOR בין שני הקלטים
    s <= x xor y;
    -- נשיאה = AND בין שני הקלטים
    c <= x and y;
end Behavioral;
