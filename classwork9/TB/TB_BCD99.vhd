library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_BCD_counter is
end TB_BCD_counter;

architecture sim of TB_BCD_counter is

    component BCD_counter
        port (
            EN1   : in  std_logic;
            reset : in  std_logic;
            clk   : in  std_logic;
            D1    : out std_logic_vector(3 downto 0);
            D2    : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal EN1   : std_logic := '0';
    signal D1    : std_logic_vector(3 downto 0);
    signal D2    : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    -- DUT
    UUT : BCD_counter
        port map (
            clk   => clk,
            reset => reset,
            EN1   => EN1,
            D1    => D1,
            D2    => D2
        );

    -- Clock
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
    
        reset <= '1';
        wait for 2 * CLK_PERIOD;
        reset <= '0';
        EN1 <= '1';
        wait for 120 * CLK_PERIOD;
        EN1 <= '0';
        wait;
    end process;

end sim;