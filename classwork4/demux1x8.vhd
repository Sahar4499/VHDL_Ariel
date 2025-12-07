library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demux1x8 is
    port(
        D   : in  std_logic;
        SEL : in  std_logic_vector(2 downto 0);
        Y   : out std_logic_vector(7 downto 0)
    );
end Demux1x8;

architecture Behavioral of Demux1x8 is

    signal tmp : std_logic_vector(1 downto 0);

begin

    with SEL(2) select
        tmp <= '0' & D             when '0',   
               D  & '0'            when '1',   
               (others => '0')     when others;



    with SEL(1 downto 0) select
        Y(3 downto 0) <= "000" & tmp(0)      when "00",  -- Y0 = tmp(0)
                          "00" & tmp(0) & "0" when "01",  -- Y1 = tmp(0)
                          "0" & tmp(0) & "00" when "10",  -- Y2 = tmp(0)
                          tmp(0) & "000"      when "11",  -- Y3 = tmp(0)
                          (others => '0')     when others;


    with SEL(1 downto 0) select
        Y(7 downto 4) <= "000" & tmp(1)      when "00",  -- Y4 = tmp(1)
                          "00" & tmp(1) & "0" when "01",  -- Y5 = tmp(1)
                          "0" & tmp(1) & "00" when "10",  -- Y6 = tmp(1)
                          tmp(1) & "000"      when "11",  -- Y7 = tmp(1)
                          (others => '0')     when others;

end Behavioral;
