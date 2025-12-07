library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Ture_table is
  port(
    A,B : in std_logic_vector(3 downto 0);
    SEL : in std_logic_vector(1 downto 0);
    Y   : out std_logic_vector(7 downto 0);
  );
end Ture_table;

architecture Behavioral of Ture_table is

signal ADD_int , SUB_int : integer range 0 to 15;
signal ADD , SUB : std_logic_vector(7 downto 0);

begin
    ADD_int<= to_integer(signed(A))+to_integer(signed(B));
    SUB_int<= to_integer(signed(A))-to_integer(signed(B));

    ADD<=std_logic_vector(to_signed(ADD_int,8));
    SUB<=std_logic_vector(to_signed(SUB_int,8));

with SEL select
    Y<=ADD when "00",
       SUB when "01",
       x"FF"when "10",
       std_logic_vector(to_signed(0,8)) when "11",
       (others => 'X') when others;
       
end Behavioral;
