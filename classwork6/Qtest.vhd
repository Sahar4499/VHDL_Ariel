library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity V is
    port (
        a : in  std_logic;
        b : out std_logic
    );
end V;

architecture Behavioral of V is
    signal t : std_logic := '0';
begin

    process(a)
    begin
        t <= t xor a after 25 ns;
        b <= a and t;
    end process;

end Behavioral;
