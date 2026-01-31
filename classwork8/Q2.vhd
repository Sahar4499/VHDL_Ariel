library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q2 is
    port (
        X : in  std_logic_vector(3 downto 0);
        Y : out std_logic
    );
end Q2;

architecture Behavioral of Q2 is
begin

    process (X)
        variable tmp : std_logic;
    begin
        for i in 0 to 1 loop
            if i = 0 then
                tmp := X(0) or X(1);
                tmp := tmp and X(2);
            elsif i = 1 then
                tmp := tmp or X(3);
            end if;
        end loop;
        Y <= tmp;
    end process;

end Behavioral;