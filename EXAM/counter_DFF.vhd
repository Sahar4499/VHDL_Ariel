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

architecture B1 of Ex_2 is
    signal Count : unsigned(1 downto 0) := (others => '0');
    signal B     : std_logic_vector(3 downto 0) := (others => '0');
    signal Q1    : std_logic := '0';
    signal Q2    : std_logic := '0';
begin

    -- Output
    Y <= Q2 xor B(1);   -- B1

    -- Counter 
    process(CLK)
    begin
        if rising_edge(CLK) then
            if (CLR = '1') then
                Count <= (others => '0');
            elsif (EN = '1') then
                if (UP_DN = '1') then
                    Count <= Count + 1;
                else
                    Count <= Count - 1;
                end if;
            end if;
        end if;
    end process;

    -- Decoder 2x4 
    process(Count)
    begin
        B <= (others => '0');
        case Count is
            when "00"   => B(0) <= '1';   -- B0
            when "01"   => B(1) <= '1';   -- B1
            when "10"   => B(2) <= '1';   -- B2
            when others => B    <= "0000";   
        end case;
    end process;

    -- DFF
    process(CLK)
    begin
        if rising_edge(CLK) then
            Q1 <= B(2);          -- Right 
            Q2 <= Q1 and B(0);   -- Left
        end if;
    end process;
end B1;