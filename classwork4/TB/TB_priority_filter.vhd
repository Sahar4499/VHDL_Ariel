library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_priority_filter  is
end TB_priority_filter;

architecture Behavioral of TB_priority_filter is
  component priority_filter is
  port(
    A :in std_logic_vector(7 downto 0);
    B: out integer range 0 to 8
  );
  end component;

  signal A : std_logic vector(7 downto 0) := (others => '0');
  signal B : integer range 0 to 8;
begin
  U5 : priority_filter
    port map (
      A=>A, 
      B=>B
    );

  process
  begin
    A<="11111111";  wait for 10 ns;--8
    A<="01000001";  wait for 10 ns;--7
    A<="00111111";  wait for 10 ns;--6
    A<="00010011";  wait for 10 ns;--5
    A<="00001111";  wait for 10 ns;--4
    A<="00000111";  wait for 10 ns;--3
    A<="00000010";  wait for 10 ns;--2
    A<="00000001";  wait for 10 ns;--1
    A<="00000000";  wait for 10 ns;--0
    wait;
  end process;
end Behavioral;
