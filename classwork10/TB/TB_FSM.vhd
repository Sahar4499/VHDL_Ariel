library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MooreFSM is
end TB_MooreFSM;

architecture sim of TB_MooreFSM is

    component MooreFSM
        port (
            x   : in  std_logic;
            rst : in  std_logic;
            clk : in  std_logic;
            y   : out std_logic_vector(1 downto 0)
        );
    end component;

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal x   : std_logic := '0';
    signal y   : std_logic_vector(1 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    UUT : MooreFSM
        port map (
            clk => clk,
            rst => rst,
            x   => x,
            y   => y
        );


    clk_proc : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;


    stim_proc : process
    begin
        -- Reset
        rst <= '1';
        wait for 2 * CLK_PERIOD;
        rst <= '0';

        -- Sequence of x values
        x <= '0';   -- st2 -> st0
        wait for 2 * CLK_PERIOD;

        x <= '1';   -- st0 -> st0
        wait for 2 * CLK_PERIOD;

        x <= '0';   -- st0 -> st2
        wait for 2 * CLK_PERIOD;

        x <= '1';   -- st2 -> st1
        wait for 2 * CLK_PERIOD;

        x <= '0';   -- st1 -> st2
        wait for 2 * CLK_PERIOD;

        x <= '1';   -- st2 -> st1
        wait for 2 * CLK_PERIOD;
        wait;
    end process;

end sim;