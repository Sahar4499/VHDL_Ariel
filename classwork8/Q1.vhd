library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Q1 is
    port (
        A   : in  std_logic_vector(7 downto 0);
        sel : in  std_logic_vector(1 downto 0);
        Y   : out std_logic_vector(7 downto 0)
    );
end Q1;

architecture Behavioral of Q1 is

    signal counter, complement, near, multi : std_logic_vector(7 downto 0);

begin

    -- Count 1's in A
    process (A)
        variable count : integer range 0 to 7;
    begin
        count := 0;
        for i in 0 to 7 loop
            if A(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        counter <= std_logic_vector(to_unsigned(count, 8));
    end process;

    -- Two's complement of A
    process (A)
        variable com : unsigned(7 downto 0);
    begin
        com := not unsigned(A) + 1;
        complement <= std_logic_vector(com);
    end process;

    -- Count equal neighbors in A
    process (A)
        variable count : integer range 0 to 7;
    begin
        count := 0;
        for i in 0 to 6 loop
            if A(i) = A(i + 1) then
                count := count + 1;
            end if;
        end loop;
        near <= std_logic_vector(to_unsigned(count, 8));
    end process;

    -- Shift-left (x2), else X if MSB=1
    process (A)
        variable tmp : std_logic_vector(7 downto 0);
    begin
        tmp := A;
        tmp := tmp(6 downto 0) & '0';
        if A(7) = '1' then
            tmp := (others => 'X');
        end if;
        multi <= tmp;
    end process;

    -- Mux by sel
    process (sel, counter, complement, near, multi)
    begin
        case sel is
            when "00"   => Y <= counter;
            when "01"   => Y <= complement;
            when "10"   => Y <= near;
            when "11"   => Y <= multi;
            when others => Y <= (others => 'X');
        end case;
    end process;

end Behavioral;