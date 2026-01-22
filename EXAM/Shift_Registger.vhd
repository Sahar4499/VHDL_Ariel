library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shift_Register is
    port(
        RST : in  std_logic;                 
        Sin : in  std_logic;
        SE  : in  std_logic;
        PE  : in  std_logic;
        NEG : in  std_logic;
        CLK : in  std_logic;
        x   : in  std_logic_vector(3 downto 0);
        y   : out std_logic_vector(3 downto 0)
    );
end Shift_Register;

architecture B2 of Shift_Register is
    signal SEL   : std_logic_vector(2 downto 0);
    signal REG_y : std_logic_vector(3 downto 0) := (others => '0');
begin
    SEL <= SE & PE & NEG;
    y   <= REG_y;

    process(CLK, RST)
        variable COM : unsigned(3 downto 0);
    begin
        if (RST = '0') then
            REG_y <= (others => '0');
        elsif rising_edge(CLK) then
            case SEL is
                when "100" | "101" | "110" | "111" =>
                    REG_y <= Sin & REG_y(3 downto 1);
                when "000" | "001" =>
                    null; 
                when "010" =>
                    REG_y <= x;
                when "011" =>
                    COM   := unsigned(not x) + 1;
                    REG_y <= std_logic_vector(COM);
                when others =>
                    null;
            end case;
        end if;
    end process;
end B2;