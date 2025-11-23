library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Q4 is
end TB_Q4;

architecture Behavioral of TB_Q4 is
  component Q4 is
    port (
      X,Y,Z     : in  std_logic;
      F         : out std_logic
    );
  end component;

  signal X,Y,Z : std_logic := '0';
  signal F   : std_logic;
begin
  U6 : Q4
    port map (
      X=>X, Y=>Y, Z=>Z,
      F=>F
    );

  process
  begin
    X<='0'; Y<='0'; Z<='0'; wait for 10 ns;
    X<='1'; Y<='0'; Z<='0'; wait for 10 ns;
    X<='0'; Y<='1'; Z<='0'; wait for 10 ns;
    X<='1'; Y<='1'; Z<='0'; wait for 10 ns;
    X<='0'; Y<='0'; Z<='1'; wait for 10 ns;
    X<='1'; Y<='0'; Z<='1'; wait for 10 ns;
    X<='0'; Y<='1'; Z<='1'; wait for 10 ns;
    X<='1'; Y<='1'; Z<='1'; wait for 10 ns;

    wait;
  end process;
end Behavioral;
