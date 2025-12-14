library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Q1 is
end TB_Q1;

architecture Behavioral of TB_Q1 is

    component Q1
        port (
            A : in  integer range 0 to 15;
            Y : out std_logic_vector(3 downto 0)
        );
    end component;

    signal A : integer range 0 to 15 := 0;
    signal Y : std_logic_vector(3 downto 0);

begin

    UUT : Q1
        port map (
            A => A,
            Y => Y
        );

    process
    begin
        wait for 10 ns;

        lp1 : for i in 0 to 15 loop
            A <= i;
            wait for 10 ns;
        end loop lp1;

        lp2 : for j in 15 downto 0 loop
            A <= j;
            wait for 10 ns;
        end loop lp2;

        wait;
    end process;

end Behavioral;