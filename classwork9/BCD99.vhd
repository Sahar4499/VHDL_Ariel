library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_counter is
    port
    (
        EN1   : in  std_logic;
        reset : in  std_logic;
        clk   : in  std_logic;
        D1    : out std_logic_vector(3 downto 0);
        D2    : out std_logic_vector(3 downto 0)
    );
end BCD_counter;

architecture Behavioral of BCD_counter is
    signal cnt1    : unsigned(3 downto 0) := (others => '0');
    signal cnt2    : unsigned(3 downto 0) := (others => '0');
    signal REACH_9 : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                cnt1    <= (others => '0');
                REACH_9 <= '0';
            else
                REACH_9 <= '0'; 

                if (EN1 = '1') then
                    if (cnt1 = to_unsigned(9, 4)) then
                        cnt1    <= (others => '0');
                        REACH_9 <= '1';
                    else
                        cnt1 <= cnt1 + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;


    process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                cnt2 <= (others => '0');
            else
                if (REACH_9 = '1') and (EN2 = '1') then
                    if (cnt2 = to_unsigned(9, 4)) then
                        cnt2 <= (others => '0');
                    else
                        cnt2 <= cnt2 + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    D1 <= std_logic_vector(cnt1);
    D2 <= std_logic_vector(cnt2);

end Behavioral;