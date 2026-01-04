library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
    port
    (
        DataIn   : in  std_logic;
        start    : in  std_logic;
        hold     : in  std_logic;
        DataOut  : out std_logic_vector(7 downto 0)
    );
end SIPO;

architecture B3 of SIPO is
    signal Vec_shift  : std_logic_vector(7 downto 0) := (others => '0');
    signal SHIFT_DONE : std_logic := '0'; 
begin


    shift : process
        variable cnt : integer range 0 to 8 := 0;
    begin
        SHIFT_DONE <= '0';
        cnt := 0;
        while cnt < 8 loop
            if hold = '1' then
                wait until hold = '0';
            end if;
            wait until start = '1';
            if hold = '0' then
                Vec_shift <= Vec_shift(6 downto 0) & DataIn;
                cnt := cnt + 1;
            end if;
            wait until start = '0';
        end loop;
        SHIFT_DONE <= '1';
        wait for 20 ns;
        SHIFT_DONE <= '0';
        cnt := 0;
        wait until start = '0';

    end process;

    ou : process
    begin
        wait until SHIFT_DONE = '1';
        DataOut <= Vec_shift;
    end process;

end B3;
