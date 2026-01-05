library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ClockDivider is
end TB_ClockDivider;

architecture sim of TB_ClockDivider is

    component ClockDivider is
        port(
            clk     : in  std_logic;
            reset   : in  std_logic;
            Div     : in  std_logic_vector(1 downto 0);
            Div_clk : out std_logic
        );
    end component;

    signal clk_tb     : std_logic := '0';
    signal reset_tb   : std_logic := '0';
    signal Div_tb     : std_logic_vector(1 downto 0) := "00";
    signal Div_clk_tb : std_logic;

    constant CLK_PERIOD : time := 20 ns; 

begin

    UUT : ClockDivider
        port map(
            clk     => clk_tb,
            reset   => reset_tb,
            Div     => Div_tb,
            Div_clk => Div_clk_tb
        );

    clk_gen : process
    begin
        clk_tb <= '0';
        wait for CLK_PERIOD / 2;
        clk_tb <= '1';
        wait for CLK_PERIOD / 2;
    end process;

  
    process
    begin
  
        reset_tb <= '1';
        wait for 10000 ns;
        reset_tb <= '0';

 
        for i in 0 to 3 loop
            Div_tb <= std_logic_vector(to_unsigned(i, 2));
            wait for 100 ms;
        end loop;

        wait;
    end process;

end sim;
