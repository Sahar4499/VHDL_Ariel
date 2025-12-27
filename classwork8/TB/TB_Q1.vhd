library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Q1 is
    -- Port ( );
end TB_Q1;

architecture Behavioral of TB_Q1 is

    component Q1 is
        port (
            A   : in  std_logic_vector(7 downto 0);
            sel : in  std_logic_vector(1 downto 0);
            Y   : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A, Y : std_logic_vector(7 downto 0);
    signal sel  : std_logic_vector(1 downto 0);

begin

    U1 : Q1
        port map (
            A   => A,
            sel => sel,
            Y   => Y
        );

    process
    begin
        for i in 0 to 3 loop
            sel <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;
        wait;
    end process;

    process
    begin
        for i in 0 to 255 loop
            A <= std_logic_vector(to_unsigned(i, 8));
            wait for 40 ns;
        end loop;
        wait;
    end process;

end Behavioral;