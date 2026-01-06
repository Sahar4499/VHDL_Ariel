library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_BCD_counter is
end TB_BCD_counter;

architecture sim of TB_BCD_counter is

    component BCD_counter
        port (
            EN1   : in  std_logic;
            EN2   : in  std_logic;
            reset : in  std_logic;
            clk   : in  std_logic;
            D1    : out std_logic_vector(3 downto 0);
            D2    : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal EN1   : std_logic := '0';
    signal EN2   : std_logic := '0';
    signal D1    : std_logic_vector(3 downto 0);
    signal D2    : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin


    UUT : BCD_counter
        port map (
            clk   => clk,
            reset => reset,
            EN1   => EN1,
            EN2   => EN2,
            D1    => D1,
            D2    => D2
        );

    -- Clock 
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;


    process
    begin
    
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        for i in 0 to 3 loop
            (EN1,EN2)<= std_logic_vector(to_unsigned(i, 2));
            wait for 100 ns;
        end loop;
        wait;
    end process;

end sim;