library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_demux1x8_select is
end TB_demux1x8_select;

architecture Behavioral of TB_demux1x8_select is
  
    component demux1x8_select is
    port(
        Din      : in  std_logic;
        s0,s1,s2 : in  std_logic;
        Y        : out std_logic_vector(7 downto 0)
    );
    end component;

    signal Din            : std_logic;
    signal s0,s1,s2       : std_logic;
    signal Y              : std_logic_vector(7 downto 0);

begin

    UUT1 : demux1x8_select
        port map(
            Din => Din,
            s0 => s0,
            s1 => s1,
            s2 => s2,
            Y   => Y
        );

    process
    begin
        --0
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '0';s1<='0';s0<='0'; wait for 20 ns;

        --1
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '0';s1<='0';s0<='1'; wait for 20 ns;

        --2
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '0';s1<='1';s0<='0'; wait for 20 ns;

        --3
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '0';s1<='1';s0<='1'; wait for 20 ns;

        --4
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '1';s1<='0';s0<='0'; wait for 20 ns;

        --5
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '1';s1<='0';s0<='1'; wait for 20 ns;

        --6
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '1';s1<='1';s0<='0'; wait for 20 ns;

        --7
        Din <= '0'; wait for 10 ns; Din <= '1';
        s2 <= '1';s1<='1';s0<='1'; wait for 20 ns;

        Din <= '0'; wait for 10 ns; Din <= '1';

        wait;
    end process;

end Behavioral;
