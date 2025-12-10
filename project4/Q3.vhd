library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Question3 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           y : out STD_LOGIC);
end Question3;

architecture Behavioral of Question3 is
    signal count : integer := 0;
begin
    process (a, b, c)
        variable temp : STD_LOGIC;
        variable cnt : integer := 0;
    begin
        temp := a xor b;
        y <= temp xor c;
        cnt := cnt + 1;
        count <= cnt;
    end process;
end Behavioral;