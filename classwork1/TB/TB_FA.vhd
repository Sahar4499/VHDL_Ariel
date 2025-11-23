library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_FA is
end TB_FA;

architecture Behavioral of TB_FA is
  component FA is
    port (
      A, B, Cin : in  std_logic;
      S, Cout   : out std_logic
    );
  end component;

  signal A, B, Cin : std_logic := '0';
  signal S, Cout   : std_logic;
begin
  U5 : FA
    port map (
      A=>A, B=>B, Cin=>Cin,
      S=>S, Cout=>Cout
    );

  process
  begin
    A<='0'; B<='0'; Cin<='0'; wait for 10 ns;
    A<='0'; B<='0'; Cin<='1'; wait for 10 ns;
    A<='0'; B<='1'; Cin<='0'; wait for 10 ns;
    A<='0'; B<='1'; Cin<='1'; wait for 10 ns;
    A<='1'; B<='0'; Cin<='0'; wait for 10 ns;
    A<='1'; B<='0'; Cin<='1'; wait for 10 ns;
    A<='1'; B<='1'; Cin<='0'; wait for 10 ns;
    A<='1'; B<='1'; Cin<='1'; wait for 10 ns;
    wait;
  end process;
end Behavioral;
