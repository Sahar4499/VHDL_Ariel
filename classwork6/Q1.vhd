library IEEE
use IEEE.STD_LOGIC_1164.ALL;

entity Q1 is
    port(
        A,B : in std_logic;
        Y,Z : out std_logic
    );
end Q1;

architecture Behavioral of Q1 is  
process(A,B)
begin 
     Y<=A and B;
     Z<=A or B;
end process;
end Behavioral;