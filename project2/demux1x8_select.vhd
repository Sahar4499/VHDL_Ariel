library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux4x1_select is
    port(
        Din      : in  std_logic;
        s0,s1,s2 : in  std_logic;
        Y        : out std_logic_vector(7 downto 0)
    );
end demux4x1_select;

architecture Behavioral of demux4x1_select is
    signal sel : std_logic_vector(2 downto 0);
begin
    sel <= s2 & s1 & s0;
    with sel select
        Y <= ('0','0','0','0','0','0','0',Din) when "000",
             ('0','0','0','0','0','0',Din,'0') when "001",
             ('0','0','0','0','0',Din,'0','0') when "010",
             ('0','0','0','0',Din,'0','0','0') when "011",
             ('0','0','0',Din,'0','0','0','0') when "100",
             ('0','0',Din,'0','0','0','0','0') when "101",
             ('0',Din,'0','0','0','0','0','0') when "110",
             (Din,'0','0','0','0','0','0','0') when "111",
             (others => 'X')                  when others;
end Behavioral;
