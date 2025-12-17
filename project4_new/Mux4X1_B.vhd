library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4x1_B is
    Port (
        A  : in  STD_LOGIC;
        B  : in  STD_LOGIC;
        I0 : in  STD_LOGIC;
        I1 : in  STD_LOGIC;
        I2 : in  STD_LOGIC;
        I3 : in  STD_LOGIC;
        Q  : out STD_LOGIC
    );
end Mux4x1_B;

architecture Behavioral of Mux4x1_B is
begin
    PROC : process(A, B, I0, I1, I2, I3)
        variable sel : integer range 0 to 3;
    begin
        sel := 3;
        if (B = '0') then
            sel := sel - 1;
        end if;

        if (A = '0') then
            sel := sel - 2;
        end if;

        case sel is
            when 0 => Q <= I0;
            when 1 => Q <= I1;
            when 2 => Q <= I2;
            when 3 => Q <= I3;
        end case;
    end process;
end Behavioral;