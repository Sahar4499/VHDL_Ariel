library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decorder3x8 is
    Port ( A,B,C : in std_logic;
           D0,D1,D2,D3,D4,D5,D6,D7 : out std_logic);
end decorder3x8;

architecture Behavioral of decorder3x8 is

begin
D0<=not(A) and not(B) and not(C);
D1<=not(A) and not(B) and C;
D2<=not(A) and B and not(C);
D3<=not(A) and b and c;
D4<=A and not(B) and not(C);
D5<=A and not(B) and C;
D6<=A and B and not(C);
D7<=A and b and c;
end Behavioral;
