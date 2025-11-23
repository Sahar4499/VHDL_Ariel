library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_mux4x1_conitional is
end TB_mux4x1_conitional;

architecture Behavioral of TB_mux4x1_conitional is
  
    component mux4x1_conitional is
        port(
            D0, D1, D2, D3 : in  std_logic_vector(2 downto 0);
            sel            : in  std_logic_vector(1 downto 0);
            Y              : out std_logic_vector(2 downto 0)
        );
    end component;

    signal D0, D1, D2, D3 : std_logic_vector(2 downto 0) := (others => '0');
    signal sel            : std_logic_vector(1 downto 0);
    signal Y              : std_logic_vector(2 downto 0);

begin

    UUT1 : mux4x1_conitional
        port map(
            D0 => D0,
            D1 => D1,
            D2 => D2,
            D3 => D3,
            sel => sel,
            Y   => Y
        );

    process
    begin
        D0 <= "000";D1 <= "001";D2 <= "010";D3 <= "011";

        sel <= "00";wait for 20 ns;
        sel <= "01";wait for 20 ns;
        sel <= "10";wait for 20 ns;
        sel <= "11";wait for 20 ns;
        
        wait;
    end process;

end Behavioral;
