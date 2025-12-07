library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_shift_reg is
end TB_shift_reg;

architecture Behavioral of TB_shift_reg is

  component shift_reg is
  port(
    REG       : in std_logic_vector(7 downto 0);
    OP        : in std_logic_vector(1 downto 0);
    REG_OUT   : out std_logic_vector(7 downto 0)
  );
  end component;

  signal REG     : std_logic_vector(7 downto 0) := "10101010";
  signal OP      : std_logic_vector(1 downto 0) := "00";
  signal REG_OUT : std_logic_vector(7 downto 0);

begin

  UUT : shift_reg
    port map(
      REG     => REG,
      OP      => OP,
      REG_OUT => REG_OUT
    );

  process
  begin 
    OP <= "00"; wait for 20 ns; 
    OP <= "01"; wait for 20 ns;
    OP <= "10"; wait for 20 ns;
    OP <= "11"; wait for 20 ns;
    wait;
  end process;

end Behavioral;