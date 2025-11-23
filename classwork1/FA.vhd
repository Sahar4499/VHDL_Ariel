library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
  port(
    A, B, Cin : in  std_logic;
    S, Cout   : out std_logic
  );
end FA;

architecture Behavioral of FA is
  signal s1, s2, s3 : std_logic;
begin
  s1   <= A xor B;
  s2   <= A and B;
  s3   <= s1 and Cin;
  S    <= s1 xor Cin;
  Cout <= s2 or s3;
end Behavioral;
