library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_encoder_select is
end TB_encoder_select;

architecture Behavioral of TB_encoder_select is

 
    component encoder_select is
        port(
            D0,D1,D2,D3,D4,D5,D6,D7 : in  std_logic;
            Y                       : out std_logic_vector(2 downto 0)
        );
    end component;

    signal D0,D1,D2,D3,D4,D5,D6,D7 : std_logic := '0';
    signal Y                       : std_logic_vector(2 downto 0);

begin

    U2 : encoder_select
        port map(
            D0 => D0,
            D1 => D1,
            D2 => D2,
            D3 => D3,
            D4 => D4,
            D5 => D5,
            D6 => D6,
            D7 => D7,
            Y  => Y
        );

    process
    begin
        D0 <= '1'; wait for 10 ns;D0 <= '0';
        D1 <= '1'; wait for 10 ns;D1 <= '0';
        D2 <= '1'; wait for 10 ns;D2 <= '0';
        D3 <= '1'; wait for 10 ns;D3 <= '0';
        D4 <= '1'; wait for 10 ns;D4 <= '0';
        D5 <= '1'; wait for 10 ns;D5 <= '0';
        D6 <= '1'; wait for 10 ns;D6 <= '0';
        D7 <= '1'; wait for 10 ns;D7 <= '0';
        wait;
    end process;

end Behavioral;
