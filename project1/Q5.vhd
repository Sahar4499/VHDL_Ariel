library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q5 is
  port(
    A,B              : in  std_logic;
    Y1,Y2,Y3,Y4,Y5   : out std_logic
  );
end Q5;

architecture Behavioral of Q5 is
begin
    Y1<=A and B;
    Y2<=A or B;
    Y3<=A xor B;
    Y4<=not(Y1);
    Y5<=not(Y2);
    
end Behavioral;
