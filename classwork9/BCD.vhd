library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_counter is
    port
    (
        EN1   : in  std_logic;
        EN2   : in  std_logic;
        reset : in  std_logic;
        clk   : in  std_logic;
        D1    : out std_logic_vector(3 downto 0);
        D2    : out std_logic_vector(3 downto 0)
    );
end BCD_counter;

architecture Behavioral of BCD_counter is
    signal cnt1 : integer range 0 to 9 := 0;
    signal cnt2 : integer range 0 to 9 := 0;
begin

    -- Counter 1 (D1)
    process(clk, reset)
    begin
        if (reset = '1') then
            cnt1 <= 0;
        elsif rising_edge(clk) then
            if (EN1 = '1') then
                if (cnt1 = 9) then
                    cnt1 <= 0;
                else
                    cnt1 <= cnt1 + 1;
                end if;
            end if;
        end if;
    end process;

    D1 <= std_logic_vector(to_unsigned(cnt1, 4));

    -- Counter 2 (D2)
    process(clk, reset)
    begin
        if (reset = '1') then
            cnt2 <= 0;
        elsif rising_edge(clk) then
            if (EN2 = '1') then
                if (cnt2 = 9) then
                    cnt2 <= 0;
                else
                    cnt2 <= cnt2 + 1;
                end if;
            end if;
        end if;
    end process;

    D2 <= std_logic_vector(to_unsigned(cnt2, 4));

end Behavioral;