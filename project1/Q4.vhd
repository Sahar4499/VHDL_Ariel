library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q4 is
  port(
    X,Y,Z : in  std_logic;
    F   : out std_logic
  );
end Q4;

architecture Behavioral of Q4 is
  signal s1, s2, s3 : std_logic;
begin
  s1   <= X and Y;
  s2   <= s1 or not(Z);
  s3   <= Y or Z;
  F <= s2 and s3;
end Behavioral;
