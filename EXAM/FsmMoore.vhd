library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Moore_FSM is
    port
    (
        RST : in  std_logic;                
        CLK : in  std_logic;
        X   : in  std_logic;
        Y   : out std_logic_vector(1 downto 0)
    );
end Moore_FSM;

architecture Behavioral of Moore_FSM is

    type state is (S00, S01, S11);
    signal PST,NST : state;

begin


    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                NST <= S11;        
            else
                PST <= NST;
            end if;
        end if;
    end process;

    process(PST, X)
    begin
        case state is
            when S00 =>
                Y <= "00";  
                if X = '1' then
                    NST <= S01;
                else
                    NST <= S11;
                end if;

            when S01 =>
                Y <= "01";
                if X = '1' then
                    NST <= S01; 
                else
                    NST <= S11;
                end if;

            when S11 =>
                Y <= "11";
                if X = '1' then
                    NST <= S00;
                else
                    NST <= S01;
                end if;
        end case;
    end process;
end Behavioral;
