library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Q5 is
end TB_Q5;

architecture Behavioral of TB_Q5 is
  component Q5 is
  port(
    A,B              : in  std_logic;
    Y1,Y2,Y3,Y4,Y5   : out std_logic
  );
  end component;

  signal A,B : std_logic := '0';
  signal Y1,Y2,Y3,Y4,Y5   : std_logic;
begin
  U7 : Q5
    port map (
      A=>A, B=>B,
      Y1=>Y1, Y2=>Y2, Y3=>Y3, Y4=>Y4, Y5=>Y5
    );

  process
  begin
    A<='0'; B<='0'; wait for 10 ns;
    A<='1'; B<='0'; wait for 10 ns;
    A<='0'; B<='1'; wait for 10 ns;
    A<='1'; B<='1'; wait for 10 ns;

    wait;
  end process;
end Behavioral;
