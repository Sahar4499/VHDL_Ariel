library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    port (
        I0,I1,I2,I3,S0,S1 : in std_logic;
        Y : out std_logic
    );
end mux4x1;

architecture Behavioral of mux4x1 is
begin
    Y<=(not(S0) and not(S1) and I0) or
    (S0 and not(S1) and I1) or
    (not(S0) and S1 and I2) or
    (S0 and S1 and I3);
end Behavioral;
