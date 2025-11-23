library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
  port(
    X, Y, Cin  : in  std_logic;
    Sum, Cout  : out std_logic
  );
end Full_Adder;

architecture Behavioral of Full_Adder is
    signal Din  : std_logic_vector(2 downto 0);
    signal Dout : std_logic_vector(7 downto 0);
begin

    Din <= X & Y & Cin;

    with Din select
        Dout <= "00000001" after 4 ns when "000",  -- 0
                "00000010" after 4 ns when "001",  -- 1
                "00000100" after 4 ns when "010",  -- 2
                "00001000" after 4 ns when "011",  -- 3
                "00010000" after 4 ns when "100",  -- 4  (תיקון: היה 000010000)
                "00100000" after 4 ns when "101",  -- 5
                "01000000" after 4 ns when "110",  -- 6  (תיקון: היה 0100000)
                "10000000" after 4 ns when "111",  -- 7
                "XXXXXXXX"             when others;


    Sum  <= Dout(1) or Dout(2) or Dout(4) or Dout(7) after 2 ns;
    Cout <= Dout(3) or Dout(5) or Dout(6) or Dout(7) after 2 ns;

end Behavioral;
