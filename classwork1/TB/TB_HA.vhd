library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_HA is
end TB_HA;

architecture Behavioral of TB_HA is

    -- הצהרת הרכיב לבדיקה
    component HA is
        port (
            x, y : in std_logic;
            s, c : out std_logic
        );
    end component;

    -- אותות פנימיים לסימולציה
    signal x, y : std_logic := '0';
    signal s, c : std_logic;

begin

    -- יחידת הבדיקה (Unit Under Test)
    UUT: HA
        port map (
            x => x,
            y => y,
            s => s,
            c => c
        );

    -- תהליך גירויים: שינוי הקלטים כל 20ns
    stim_proc: process
    begin
        -- מצב 00
        x <= '0'; y <= '0';
        wait for 20 ns;

        -- מצב 01
        x <= '0'; y <= '1';
        wait for 20 ns;

        -- מצב 10
        x <= '1'; y <= '0';
        wait for 20 ns;

        -- מצב 11
        x <= '1'; y <= '1';
        wait for 20 ns;

        wait; -- סיום הסימולציה
    end process;

end Behavioral;
