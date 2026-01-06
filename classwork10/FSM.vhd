library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MooreFSM is
    port
    (
        x   : in  std_logic;
        rst : in  std_logic;
        clk : in  std_logic;
        y   : out std_logic_vector(1 downto 0)
    );
end MooreFSM;

architecture Behavioral of MooreFSM is

    type state_t is (st0, st1, st2);
    signal PST, NST : state_t;

begin

  
    process(clk, rst)
    begin
        if (rst = '1') then
            PST <= st2;
        elsif rising_edge(clk) then
            PST <= NST;
        end if;
    end process;

    process(x, PST)
    begin
        NST <= PST;

        case PST is
            when st0 =>
                y <= "00";
                if (x = '1') then
                    NST <= st0;
                else
                    NST <= st2;
                end if;

            when st1 =>
                y <= "01";
                if (x = '1') then
                    NST <= st0;
                else
                    NST <= st2;
                end if;

            when st2 =>
                y <= "10";
                if (x = '1') then
                    NST <= st1;
                else
                    NST <= st0;
                end if;
        end case;
    end process;

end Behavioral;