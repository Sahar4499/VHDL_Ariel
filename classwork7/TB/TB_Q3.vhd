library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Q3 is
end TB_Q3;

architecture Behavioral of TB_Q3 is

    component Q3
        port (
            D_in  : in  std_logic_vector(7 downto 0);
            D_out : out integer range 0 to 8
        );
    end component;

    signal D_in  : std_logic_vector(7 downto 0);
    signal D_out : integer range 0 to 8;

begin

    U3 : Q3
        port map (
            D_in  => D_in,
            D_out => D_out
        );

    process
    begin
        wait for 10 ns;

        lp1 : for i in 0 to 255 loop
            D_in <= std_logic_vector(to_unsigned(i, 8));
            wait for 10 ns;
        end loop lp1;

        wait;
    end process;

end Behavioral;