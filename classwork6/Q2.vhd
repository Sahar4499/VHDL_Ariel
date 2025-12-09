library IEEE;
use IEEE_STD_LOGIC.1164;

entity Q2 is 
port
(
    A,B,C : in STD_LOGIC;
    D     : out std_logic;
);
end Q2;

architecture Behavioral of Q2 is
     process(A,B,C) 
     variable T:std_logic;
     begin
        T:=A xor B;
        D<=T xnor C;
    end process;
end Behavioral;
