library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_mux4x1 is
end TB_mux4x1;

architecture Behavioral of TB_mux4x1 is
  component mux4x1 is
    port (
      I0, I1, I2, I3 : in  std_logic;
      S0, S1         : in  std_logic;
      Y              : out std_logic
    );
  end component;

  signal I0, I1, I2, I3 : std_logic := '0';
  signal S0, S1         : std_logic := '0';
  signal Y              : std_logic;
begin
  U3 : mux4x1
    port map(
      I0 => I0, I1 => I1, I2 => I2, I3 => I3,
      S0 => S0, S1 => S1,
      Y  => Y
    );

  process
  begin

    I0 <= '1'; S1 <= '0'; S0 <= '0'; wait for 10 ns; I0 <= '0';wait for 10 ns;
    I1 <= '1'; S1 <= '0'; S0 <= '1'; wait for 10 ns; I1 <= '0';wait for 10 ns;
    I2 <= '1'; S1 <= '1'; S0 <= '0'; wait for 10 ns; I2 <= '0';wait for 10 ns;
    I3 <= '1'; S1 <= '1'; S0 <= '1'; wait for 10 ns; I3 <= '0';wait for 10 ns;

    wait;
  end process;
end Behavioral;
