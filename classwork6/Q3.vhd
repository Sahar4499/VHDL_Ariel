library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity V is
    port (
        a : in  std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        sel : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(7 downto 0)
    );
end V;

architecture Behavioral of V is
    signal a_s,b_s : signed(3 downto 0);
    signal y_s :signed(7 downto 0)
begin
a_s<=signed(a);
b_s<=signed(b);
    process(a,b,sel)
    begin
    case sel is 
        when "00"=> y_s<=a_s+b_s;
        when "01"=> y_s<=a_s-b_s;
        when "10"=> y_s<=(others='1'); --y_s<=x"FF";
        when others y_s<=(others='0');
        end case;
    end process;
    y<=std_logic_vector(y_s);
end Behavioral;
