library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Q1 is
    Port
    (
        A : in integer range 0 to 15;
        Y : out std_logic_vector(3 downto 0)
    );
end Q1;

architecture Behavioral of Q1 is
begin

    process (A)
    begin
        if (A > 10) then
            Y <= "0001";

        elsif (A < 5) then
            Y <= "0000";

        else
            Y <= std_logic_vector(to_unsigned(A, 4));
        end if;
    end process;

end Behavioral;