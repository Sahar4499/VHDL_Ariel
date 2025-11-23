library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ALU_1bit is
end TB_ALU_1bit;

architecture Behavioral of TB_ALU_1bit is

    component ALU_1bit is
        port(
            X, Y, Cin : in  std_logic;
            OP        : in std_logic_vector(1 downto 0);
            Result    : out std_logic;
            Cout      : out std_logic
        );
    end component;

    signal X, Y, Cin : std_logic := '0';
    signal OP        : std_logic_vector(1 downto 0) := "00";
    signal Result    : std_logic;
    signal Cout      : std_logic;

begin

    UUT : ALU_1bit
        port map(
            X      => X,
            Y      => Y,
            Cin    => Cin,
            OP     => OP,
            Result => Result,
            Cout   => Cout
        );

    process
    begin
        -- AND (OP="00")
        OP  <= "00";  X <= '0'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        X <= '0'; Y <= '1'; Cin <= '0'; wait for 20 ns;
        X <= '1'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        X <= '1'; Y <= '1'; Cin <= '0'; wait for 20 ns;

        -- OR (OP="01")
        OP  <= "01";  X <= '0'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        X <= '0'; Y <= '1'; Cin <= '0'; wait for 20 ns;
        X <= '1'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        X <= '1'; Y <= '1'; Cin <= '0'; wait for 20 ns;

        -- ADD (OP="10")
        OP  <= "10";  X <= '0'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        Cin <= '1';                     wait for 20 ns;
        X <= '0'; Y <= '1'; Cin <= '0'; wait for 20 ns;
        Cin <= '1';                     wait for 20 ns;
        X <= '1'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        Cin <= '1';                     wait for 20 ns;
        X <= '1'; Y <= '1'; Cin <= '0'; wait for 20 ns;
        Cin <= '1';                     wait for 20 ns;

        -- OP="11"
        OP  <= "11";  X <= '0'; Y <= '0'; Cin <= '0'; wait for 20 ns;
        X <= '1'; Y <= '0'; Cin <= '1'; wait for 20 ns;

        wait;
    end process;

end Behavioral;