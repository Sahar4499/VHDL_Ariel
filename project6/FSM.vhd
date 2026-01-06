library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MealyFSM is
    port
    (
        x   : in  std_logic;
        clk : in  std_logic;
        rst : in  std_logic;
        y   : out std_logic_vector(1 downto 0)
    );
end MealyFSM;

architecture Behavioral of MealyFSM is

    type stateType is (a, b, c, d);
    signal PST, NST : stateType;

begin


    process(clk, rst)
    begin
        if (rst = '1') then
            PST <= a;
        elsif rising_edge(clk) then
            PST <= NST;
        end if;
    end process;

    process(PST, x)
    begin
    
        NST <= PST;
        y   <= "00"; 

        case PST is
            when a =>
                if (x = '0') then
                    y   <= "00"; 
                    NST <= a;
                else
                    y   <= "01"; 
                    NST <= b;
                end if;

            when b =>
                if (x = '0') then
                    y   <= "10"; 
                    NST <= c;
                else
                    y   <= "11"; 
                    NST <= d;
                end if;

            when c =>
                if (x = '0') then
                    y   <= "10"; 
                    NST <= b;
                else
                    y   <= "00"; 
                    NST <= d;
                end if;

            when d =>
                if (x = '0') then
                    y   <= "01"; 
                    NST <= d;
                else
                    y   <= "10";
                    NST <= a;
                end if;

        end case;
    end process;

end Behavioral;