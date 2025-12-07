library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_add4 is
    end TB_add4;

architecture B1 of TB_add4 is
    component add4
    port(
        A, B : in  std_logic_vector(3 downto 0);
        SUM  : out std_logic_vector(4 downto 0)
    );
    end component;

    signal A,B : std_logic_vector(3 downto 0);
    signal SUM : std_logic_vector(4 downto 0);

    begin
        UUT: add4 
        port map(
            A=>A,
            B=>B,
            SUM=>SUM
        );
    process 
    begin 
    A<="0001";B<="0001"; wait for 10 ns;
    A<="0010";B<="0011"; wait for 10 ns;
    A<="1111";B<="0001"; wait for 10 ns;
    wait;
    end process;
    end B1;
