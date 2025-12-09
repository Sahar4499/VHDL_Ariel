library IEEE;
use IEEE.STD_LOGIC_1164.ALL:

entity TB_Q1 is
    end TB_Q1;

architecture behavioral of TB_Q1 is

    component process_logic
    port(
        A,B : in std_logic;
        Y,Z : out std_logic
    );
    end component;

    signal A,B : std_logic;
    signal Y,Z : std_logic;

begin 
    UUT: process_logic 
    port map
   (
    A=>A,
    B=>B,
    Y=>Y,
    Z=>Z
   );

   process 
   begin
    wait for 10 ns;--must because the sestive list
    A<='0';B<='0'; wait for 20 ns;
    A<='0';B<='1'; wait for 20 ns;
    A<='1';B<='0'; wait for 20 ns;
    A<='1';B<='1'; wait for 20 ns;
    wait;
    end process;
end behavioral;
