library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1bit is
  port(
    X, Y, Cin : in  std_logic;
    OP        : in std_logic_vector(1 downto 0);
    Result    : out std_logic;
    Cout      : out std_logic
  );
end ALU_1bit;

architecture Behavioral of ALU_1bit is

  -- Delays
  constant gate_delay : time := 2 ns;
  constant mux_delay  : time := 5 ns;
  constant FA_delay   : time := 8 ns;

  -- Internal signals
  signal s_and, s_or, s_sum : std_logic;


begin

  s_and <= (X and Y) after gate_delay;

  s_or  <= (X or  Y) after gate_delay;

  s_sum   <= (X xor Y xor Cin) after FA_delay;

  Cout <= ((X and Y) or (X and Cin) or (Y and Cin)) after FA_delay;


  Result <= s_and after mux_delay when OP = "00" else
            s_or  after mux_delay when OP = "01" else
            s_sum after mux_delay when OP = "10" else
            X     after mux_delay; 

end Behavioral;