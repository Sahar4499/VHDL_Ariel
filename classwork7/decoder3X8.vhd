library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder3X8 is
    port (
        D_in  : in  std_logic_vector(2 downto 0);
        D_out : out std_logic_vector(7 downto 0)
    );
end Decoder3X8;

architecture RTL of Decoder3X8 is
begin
    process (D_in)
    begin
        D_out <= (others => '0');

        case D_in is
            when "000" => D_out <= (0 => '1', others => '0');
            when "001" => D_out <= (1 => '1', others => '0');
            when "010" => D_out <= (2 => '1', others => '0');
            when "011" => D_out <= (3 => '1', others => '0');
            when "100" => D_out <= (4 => '1', others => '0');
            when "101" => D_out <= (5 => '1', others => '0');
            when "110" => D_out <= (6 => '1', others => '0');
            when "111" => D_out <= (7 => '1', others => '0');
            when others => D_out <= (others => '0');
        end case;
    end process;
end RTL;