library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_DEMUX1x4 is 
end TB_DEMUX1x4;

architecture Behavioral of TB_DEMUX1x4 is

    component DEMUX1x4
        port (
            I   : in  std_logic;
            sel : in  std_logic_vector(1 downto 0);
            D   : out std_logic_vector(3 downto 0)
        );
    end component;

    signal I   : std_logic;
    signal sel : std_logic_vector(1 downto 0);
    signal D   : std_logic_vector(3 downto 0);

begin

    U1 : DEMUX1x4
        port map (
            I   => I,
            sel => sel,
            D   => D
        );

    process
    begin
        wait for 10 ns;

        lp1 : for j in 1 downto 0 loop
            I <= std_logic_vector(to_unsigned(j, 1))(0);

            lp2 : for i in 3 downto 0 loop
                sel <= std_logic_vector(to_unsigned(i, 2));
                wait for 10 ns;
            end loop lp2;

        end loop lp1;

        wait;
    end process;

end Behavioral;