library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MuxNx1 is
    generic(N : integer:=2);
    port(
        X     : in  std_logic_vector(2**N-1 downto 0);
        SEL   : in  std_logic_vector(N-1 downto 0);
        Y     : out std_logic
        );
end MuxNx1;
architecture RTL of MuxNx1 is
begin
    Y<=X(to_integer(unsigned(SEL));
end RTL;