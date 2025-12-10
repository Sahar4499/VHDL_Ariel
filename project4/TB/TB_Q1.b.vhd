library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity TB_Mux4x1_Variable is
end TB_Mux4x1_Variable;

architecture B2 of TB_Mux4x1_Variable is

    component Mux4x1_Variable is
        port (
            A  : in  STD_LOGIC;
            B  : in  STD_LOGIC;
            I0 : in  STD_LOGIC;
            I1 : in  STD_LOGIC;
            I2 : in  STD_LOGIC;
            I3 : in  STD_LOGIC;
            Q  : out STD_LOGIC
        );
    end component;

    signal A, B               : STD_LOGIC := '0';
    signal I0, I1, I2,I3      : STD_LOGIC := '0';
    signal Q                  : STD_LOGIC := '0';

begin

    UUT1 : Mux4x1_Variable
        port map (
            A  => A,
            B  => B,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            Q  => Q
        );

    process
    begin
        I0 <= '0';
        I1 <= '1';
        I2 <= '0';
        I3 <= '1';

        A <= '0'; B <= '0'; wait for 20 ns;
        A <= '0'; B <= '1'; wait for 20 ns;
        A <= '1'; B <= '0'; wait for 20 ns;
        A <= '1'; B <= '1'; wait for 20 ns;

        wait;
    end process;

end B2;
