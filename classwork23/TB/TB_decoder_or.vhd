library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Full_Adder is
end TB_Full_Adder;

architecture Behavioral of TB_Full_Adder is
  component Full_Adder is
    port(
      X, Y, Cin  : in  std_logic;
      Sum, Cout  : out std_logic
    );
  end component;

  signal X, Y, Cin  : std_logic := '0';
  signal Sum, Cout  : std_logic;

begin


  U1 : Full_Adder
    port map(
      X   => X,
      Y   => Y,
      Cin => Cin,
      Sum => Sum,
      Cout=> Cout
    );


  process
  begin
    X <= '0'; Y <= '0'; Cin <= '0'; wait for 10 ns;
    X <= '0'; Y <= '0'; Cin <= '1'; wait for 10 ns;
    X <= '0'; Y <= '1'; Cin <= '0'; wait for 10 ns;
    X <= '0'; Y <= '1'; Cin <= '1'; wait for 10 ns;
    X <= '1'; Y <= '0'; Cin <= '0'; wait for 10 ns;
    X <= '1'; Y <= '0'; Cin <= '1'; wait for 10 ns;
    X <= '1'; Y <= '1'; Cin <= '0'; wait for 10 ns;
    X <= '1'; Y <= '1'; Cin <= '1'; wait for 10 ns;
    wait;
  end process;

end Behavioral;
