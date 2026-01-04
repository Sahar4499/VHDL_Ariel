library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_1bit is
    port
    (
        A, B          : in  std_logic;
        F_0, F_1      : in  std_logic;
        INVA          : in  std_logic;
        ENA, ENB      : in  std_logic;
        carry_in      : in  std_logic;
        OUT_SIG, C_OUT: out std_logic
    );
end alu_1bit;


architecture B2 of alu_1bit is

    signal F_and, F_or, F_B_not, F_add : std_logic;
    signal out_and, out_or, out_not, out_add : std_logic;
    signal A_alu, B_alu : std_logic;

begin

    process(B, ENB)
    begin
        B_alu <= '0';
        if ENB = '1' then
            B_alu <= B;
        end if;
    end process;


    process(A, ENA, INVA)
    begin
        A_alu <= '0';
        if ENA = '1' then
            if INVA = '0' then
                A_alu <= A;
            else
                A_alu <= not A;
            end if;
        end if;
    end process;


    process(F_0, F_1)
        variable F : std_logic_vector(1 downto 0);
    begin
        F_and   <= '0';
        F_or    <= '0';
        F_B_not <= '0';
        F_add   <= '0';

        F := F_1 & F_0;

        case F is
            when "00" => F_and   <= '1';
            when "01" => F_or    <= '1';
            when "10" => F_B_not <= '1';
            when "11" => F_add   <= '1';
            when others => null;
        end case;
    end process;


    process(F_add, A_alu, B_alu, carry_in)
    begin
        out_add <= '0';
        C_OUT   <= '0';

        if F_add = '1' then
            out_add <= A_alu xor B_alu xor carry_in;
            C_OUT   <= (A_alu and B_alu) or (A_alu and carry_in) or (B_alu and carry_in);
        end if;
    end process;


    out_and <= A_alu and B_alu and F_and;
    out_or  <= (A_alu or B_alu) and F_or;
    out_not <= (not B)and ENB and F_B_not;


    OUT_SIG <= out_and or out_or or out_not or out_add;

end B2;
