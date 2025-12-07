library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity add4 is
    port(
        A, B : in  std_logic_vector(3 downto 0);
        SUM  : out std_logic_vector(4 downto 0)
    );
end add4;

architecture Behavioral of add4 is
    signal SUM_TEMP : unsigned(4 downto 0);
    begin
    SUM_TEMP<=(unsigned(A)+unsigned(B));
    SUM<=std_logic_vector(SUM_TEMP);
    end Behavioral;
