library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SR_Latch is
end TB_SR_Latch;

architecture Behavioral of TB_SR_Latch is
  component SR_Latch is
    port(
    S,R     : in std_logic;
    Q,Q_bar : out std_logic
   );
  end component;

  signal S,R        : std_logic(:=othrs='0');
  signal Q,Q_bar    : std_logic;

begin

  UUT : SR_Latch
    port map(
      S   => S,
      R   => R,
      Q => Q,
      Q_bar => Q_bar
    );

  process
  begin 
      S<='0';R<='0';wait 20ns;-- Q=0,Q_bar=1
      S<='0';R<='1';wait 20ns;-- Q=0,Q_bar=1
      S<='1';R<='0';wait 20ns;-- Q=1,Q_bar=0
      S<='0';R<='0';wait 20ns;-- Q=1,Q_bar=0
      S<='1';R<='1';wait 20ns;-- Q=1,Q_bar=1
     wait;
     end process;
end Behavioral;
