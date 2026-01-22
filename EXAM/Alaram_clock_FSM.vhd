library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ex_2 is
    port(
        EN    : in  std_logic;
        UP_DN : in  std_logic;
        CLR   : in  std_logic;
        CLK   : in  std_logic;
        Y     : out std_logic
    );
end Ex_2;
