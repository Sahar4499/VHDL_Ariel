library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Q1 is
end TB_Q1;

architecture B1 of TB_Q1 is

    component Divider is
        port (
            a, b : in  std_logic_vector(7 downto 0);
            c, r : out std_logic_vector(7 downto 0)
        );
    end component;

    signal a_tb, b_tb : std_logic_vector(7 downto 0);
    signal c_tb, r_tb : std_logic_vector(7 downto 0);

    signal num_a, num_b : integer range 0 to 10;

begin

    UUT : Divider
        port map (
            a => a_tb,
            b => b_tb,
            c => c_tb,
            r => r_tb
        );

    process
    begin
        -- Initial
        a_tb <= (others => '0');
        b_tb <= (others => '0');
        wait for 20 ns;
        
        for i in 10 downto 0 loop
            num_b <= i;

            for j in 10 downto 0 loop
                num_a <= j;

                a_tb <= std_logic_vector(to_unsigned(num_a, 8));
                b_tb <= std_logic_vector(to_unsigned(num_b, 8));

                wait for 20 ns;
            end loop;
        end loop;

        wait;
    end process;

end B1;
