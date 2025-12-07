library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Ture_table is
end TB_Ture_table;

architecture Behavioral of TB_Ture_table is
  component Ture_table is
    port(
    A,B : in std_logic_vector(3 downto 0);
    SEL : in std_logic_vector(1 downto 0);
    Y   : out std_logic_vector(7 downto 0);
   );
  end component;

  signal A,B  : std_logic_vector (3 downto 0);
  signal SEL  : std_logic_vector (1 downto 0);
  signal Y    : std_logic_vector (7 downto 0);

begin


  UUT : Ture_table
    port map(
      A   => A,
      B   => B,
      SEL => SEL,
      Y => Y
    );

  process
  begin 
      SEL<= "00";wait 20ns;
      SEL<= "01";wait 20ns;
      SEl<= "10";wait 20ns;
      SEl<= "11";wait 20ns
  end process;

  process
  begin 
     A<="0111";B<="0101"; wait for 80ns;--A=7,B=5
     A<="0100";B<="0111"; wait for 80ns;--A=4,B=7      
     A<="0001";B<="0110"; wait for 80ns;--A=1,B=6
     A<="0000";B<="1000"; wait for 80ns;--A=0,B=-8
     wait;
     end process;
    
end Behavioral;
