library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Q3 is
    port (
        D_in  : in  std_logic_vector(7 downto 0);
        D_out : out integer range 0 to 8
    );
end Q3;

architecture Behavioral of Q3 is
begin
    process (D_in)
        variable cnt : integer range 0 to 8;
    begin
        cnt := 0;

        lp1 : for i in 7 downto 0 loop
            if (D_in(i) = '1') then
                cnt := cnt + 1;
            end if;
        end loop lp1;

        D_out <= cnt;
    end process;
end Behavioral;