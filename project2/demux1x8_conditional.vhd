library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux1x8_conitional is
    port(
        Din : in  std_logic;
        sel : in  std_logic_vector(2 downto 0);
        Y   : out std_logic_vector(7 downto 0)
    );
end demux1x8_conitional;

architecture Behavioral of demux1x8_conitional is
begin
    Y <= ('0','0','0','0','0','0','0',Din) when sel = "000" else
         ('0','0','0','0','0','0',Din,'0') when sel = "001" else
         ('0','0','0','0','0',Din,'0','0') when sel = "010" else
         ('0','0','0','0',Din,'0','0','0') when sel = "011" else
         ('0','0','0',Din,'0','0','0','0') when sel = "100" else
         ('0','0',Din,'0','0','0','0','0') when sel = "101" else
         ('0',Din,'0','0','0','0','0','0') when sel = "110" else
         (Din,'0','0','0','0','0','0','0');
end Behavioral;
