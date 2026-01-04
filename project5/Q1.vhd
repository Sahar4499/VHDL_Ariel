library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider is
    port(a,b: in std_logic_vector(7 downto 0);
         c,r: out std_logic_vector(7 downto 0));
end divider;

architecture Behavioral of divider is

    signal num_a,num_b: unsigned(7 downto 0);
begin

    num_a<=unsigned(a);
    num_b<=unsigned(b);

    process(num_a, num_b)
        variable reg: unsigned(15 downto 0);
        variable num_r: unsigned(7 downto 0);
    begin
        reg:=x"00"&num_b;
        for i in 7 downto 0 loop

            reg(15 downto 0) := reg(14 downto 0)&'0';

            if(reg(15 downto 8)<num_a ) then
                c(i)<='0';
            else
                c(i)<='1';
                reg(15 downto 8):=reg(15 downto 8)-num_a;
            end if;
        end loop;
        num_r:=reg(15 downto 8);
        R<=std_logic_vector(num_r);
    end process;
end Behavioral;
