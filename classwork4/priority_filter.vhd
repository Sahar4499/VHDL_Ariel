library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_filter is
  port(
    A :in std_logic_vector(7 downto 0);
    B: out integer range 0 to 8
  );
end priority_filter;

architecture Behavioral of priority_filter is
begin
B<= 8 when A(7)='1' else
    7 when A(6)='1' else
    6 when A(5)='1' else
    5 when A(4)='1' else
    4 when A(3)='1' else
    3 when A(2)='1' else
    2 when A(1)='1' else
    1 when A(0)='1' else
    0;
end Behavioral;
