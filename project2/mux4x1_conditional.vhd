library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1_conitional is
    port(
        D0, D1, D2, D3 : in  std_logic_vector(2 downto 0);
        sel            : in  std_logic_vector(1 downto 0);
        Y              : out std_logic_vector(2 downto 0)
    );
end mux4x1_conitional;

architecture Behavioral of mux4x1_conitional is
begin
    Y <= D0 when sel = "00" else
         D1 when sel = "01" else
         D2 when sel = "10" else
         D3;
end Behavioral;
