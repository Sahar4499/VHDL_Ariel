library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1_select is
    port(
        D0, D1, D2, D3 : in  std_logic_vector(2 downto 0);
        sel            : in  std_logic_vector(1 downto 0);
        Y              : out std_logic_vector(2 downto 0)
    );
end mux4x1_select;

architecture Behavioral of mux4x1_select is
begin
    with sel select
        Y <= D0 when "00",
             D1 when "01",
             D2 when "10",
             D3 when "11",
             (others => 'X') when others;  
end Behavioral;
