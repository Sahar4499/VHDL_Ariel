library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux4x1_AB is
end TB_Mux4x1_AB;

architecture Behavioral of TB_Mux4x1_AB is

    signal A  : std_logic := '0';
    signal B  : std_logic := '0';
    signal I0 : std_logic := '0';
    signal I1 : std_logic := '0';
    signal I2 : std_logic := '0';
    signal I3 : std_logic := '0';

    signal Q_A : std_logic;
    signal Q_B : std_logic;

begin

    -- Code A (SIGNAL)
    U_A : entity work.Mux4x1_A
        port map (
            A  => A,
            B  => B,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            Q  => Q_A
        );

    -- Code B (VARIABLE)
    U_B : entity work.Mux4x1_B
        port map (
            A  => A,
            B  => B,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            Q  => Q_B
        );

    process
    begin

        I0 <= '0'; I1 <= '1'; I2 <= '0'; I3 <= '1';

        A <= '0'; B <= '0'; wait for 20 ns;
        A <= '0'; B <= '1'; wait for 20 ns;
        A <= '1'; B <= '0'; wait for 20 ns;
        A <= '1'; B <= '1'; wait for 20 ns;


        I0 <= '1'; I1 <= '0'; I2 <= '1'; I3 <= '0';

        A <= '0'; B <= '0'; wait for 20 ns;
        A <= '0'; B <= '1'; wait for 20 ns;
        A <= '1'; B <= '0'; wait for 20 ns;
        A <= '1'; B <= '1'; wait for 20 ns;

        I0 <= '1'; I1 <= '1'; I2 <= '0'; I3 <= '0';

        A <= '0'; B <= '0'; wait for 20 ns;
        A <= '0'; B <= '1'; wait for 20 ns;
        A <= '1'; B <= '0'; wait for 20 ns;
        A <= '1'; B <= '1'; wait for 20 ns;

        wait;
    end process;

end Behavioral;