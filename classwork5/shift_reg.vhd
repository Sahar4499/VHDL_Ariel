library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
  port(
    REG       : in std_logic_vector(7 downto 0);
    OP        : in std_logic_vector(1 downto 0); 
    REG_OUT   : out std_logic_vector(7 downto 0) 
  );
end shift_reg;

architecture Behavioral of shift_reg is
begin

with OP select
    REG_OUT <= REG(6 downto 0) & '0'      when "00", -- הזזה שמאלה (דחיפת 0 מימין)
               '0' & REG(7 downto 1)      when "01", -- הזזה ימינה (דחיפת 0 משמאל)
               REG(6 downto 0) & REG(7)   when "10", -- רוטציה שמאלה
               REG(0) & REG(7 downto 1)   when "11", -- רוטציה ימינה
               (others => 'X')            when others;

end Behavioral;