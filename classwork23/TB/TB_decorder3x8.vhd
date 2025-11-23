library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_decorder3x8 is
end TB_decorder3x8;

architecture Behavioral of TB_decorder3x8 is
component decorder3x8 is
    Port ( A,B,C : in std_logic;
           D0,D1,D2,D3,D4,D5,D6,D7 : out std_logic);
end component;

signal A,B,C,D0,D1,D2,D3,D4,D5,D6,D7 : std_logic;

begin
U1:decorder3x8 port map(A=>A,B=>B,C=>C,D0=>D0,D1=>D1,D2=>D2,D3=>D3,D4=>D4,D5=>D5,D6=>D6,D7=>D7);

process
begin
    A<='0';B<='0';C<='0';wait for 10ns;
    A<='0';B<='0';C<='1';wait for 10ns;
    A<='0';B<='1';C<='0';wait for 10ns;
    A<='0';B<='1';C<='1';wait for 10ns;
    A<='1';B<='0';C<='0';wait for 10ns;
    A<='1';B<='0';C<='1';wait for 10ns;
    A<='1';B<='1';C<='0';wait for 10ns;
    A<='1';B<='1';C<='1';wait for 10ns;
    wait;
    end process;

end Behavioral;
