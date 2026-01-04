library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SIPO is
end TB_SIPO;

architecture sim of TB_SIPO is

    component SIPO is
        port
        (
            DataIn   : in  std_logic;
            start    : in  std_logic;
            hold     : in  std_logic;
            DataOut  : out std_logic_vector(7 downto 0)
        );
    end component;

    signal DataIn  : std_logic := '0';
    signal start   : std_logic := '0';
    signal hold    : std_logic := '0';
    signal DataOut : std_logic_vector(7 downto 0);

    constant T_HIGH : time := 5 ns;
    constant T_LOW  : time := 10 ns; 


    constant VEC1 : std_logic_vector(7 downto 0) := "10110010";
    constant VEC2 : std_logic_vector(7 downto 0) := "00110101";

begin

    UUT : SIPO
        port map
        (
            DataIn  => DataIn,
            start   => start,
            hold    => hold,
            DataOut => DataOut
        );

    process
        variable i : integer;
    begin

        DataIn <= '0';
        start  <= '0';
        hold   <= '0';
        wait for 20 ns;


        hold <= '0';
        for i in 7 downto 0 loop
            DataIn <= VEC1(i);
            start <= '1';
            wait for T_HIGH;
            start <= '0';
            wait for T_LOW;
        end loop;

        wait for 100 ns;


        hold <= '1';

        for i in 0 to 2 loop
            DataIn <= not DataIn;

            start <= '1';
            wait for T_HIGH;
            start <= '0';
            wait for T_LOW;
        end loop;

        hold <= '0';
        wait for 50 ns;

        for i in 7 downto 0 loop
            DataIn <= VEC2(i);

            start <= '1';
            wait for T_HIGH;
            start <= '0';
            wait for T_LOW;
        end loop;

        wait for 100 ns;

        wait;
    end process;

end sim;
