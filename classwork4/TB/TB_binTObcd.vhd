library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_binTObcd  is
end TB_binTObcd;

architecture Behavioral of TB_binTObcd is

  component binTObcd is
    port(
        BIN   : in  integer range 0 to 31;
        BCD_H : out std_logic_vector(1 downto 0);
        BCD_L : out std_logic_vector(3 downto 0)
    );
  end component;

  signal BIN   : integer range 0 to 31 := 0;
  signal BCD_H : std_logic_vector(1 downto 0);
  signal BCD_L : std_logic_vector(3 downto 0);

begin

  U6 : binTObcd
    port map (
      BIN   => BIN, 
      BCD_H => BCD_H,
      BCD_L => BCD_L
    );

  process
  begin
    for i in 0 to 31 loop
      BIN <= i;
      wait for 10 ns;
    end loop;
    wait;
  end process;

end Behavioral;