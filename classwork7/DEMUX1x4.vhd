library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DEMUX1x4 is
    port (
        I   : in  std_logic;
        sel : in  std_logic_vector(1 downto 0);
        D   : out std_logic_vector(3 downto 0)
    );
end DEMUX1x4;

architecture Behavioral of DEMUX1x4 is
begin

    process (I, sel)
    begin
        case sel is
            when "00" => D <= (0 => I, others => '0');
            when "01" => D <= (1 => I, others => '0');
            when "10" => D <= (2 => I, others => '0');
            when "11" => D <= (3 => I, others => '0');
            when others => D <= "XXXX";
        end case;
    end process;

end Behavioral;