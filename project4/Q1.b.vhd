library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Mux4x1_Variable is
    Port ( 
        A  : in  STD_LOGIC;
        B  : in  STD_LOGIC;
        I0 : in  STD_LOGIC;
        I1 : in  STD_LOGIC;
        I2 : in  STD_LOGIC;
        I3 : in  STD_LOGIC;
        Q  : out STD_LOGIC
    );
end Mux4x1_Variable;

architecture Behavioral of Mux4x1_Variable is
    signal SEL_test : INTEGER range 0  to 3;
begin
    PROCESS (A, B, I0, I1, I2, I3)

        variable sel : INTEGER range 0 to 3;
    BEGIN
        sel := 0; 

     
        if (B = '1') then
            sel := sel + 1; 
        end if;


        if (A = '1') then
            sel := sel + 2;
        end if;

        SEL_test<=sel;


        case sel is
            when 0 => Q <= I0;
            when 1 => Q <= I1;
            when 2 => Q <= I2;
            when 3 => Q <= I3;
            when others => Q <= '0';
        end case;
        
    END PROCESS;
end Behavioral;