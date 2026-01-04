library ieee;
use ieee.std_logic_1164.all;

entity tb_alu_1bit is
end;

architecture sim of tb_alu_1bit is

    component alu_1bit is
        port(
            A, B      : in  std_logic;
            F_0, F_1  : in  std_logic;
            INVA      : in  std_logic;
            ENA, ENB  : in  std_logic;
            carry_in  : in  std_logic;
            OUT_SIG, C_OUT : out std_logic
        );
    end component;

    signal A, B     : std_logic := '0';
    signal F_0, F_1 : std_logic := '0';
    signal INVA     : std_logic := '0';
    signal ENA, ENB : std_logic := '0';
    signal carry_in : std_logic := '0';
    signal OUT_SIG  : std_logic;
    signal C_OUT    : std_logic;

    constant T_STEP : time := 10 ns;
    constant T_GAP  : time := 50 ns;

begin

    uut: alu_1bit
        port map(
            A => A, B => B,
            F_0 => F_0, F_1 => F_1,
            INVA => INVA,
            ENA => ENA, ENB => ENB,
            carry_in => carry_in,
            OUT_SIG => OUT_SIG,
            C_OUT => C_OUT
        );

    process
        variable a_v, b_v : integer;
        variable inv_v, ena_v, enb_v, cin_v : integer;
    begin

        --AND
        F_1 <= '0';
        F_0 <= '0';
        INVA <= '0';
        carry_in <= '0';
        wait for T_GAP;

        for ena_v in 0 to 1 loop
            for enb_v in 0 to 1 loop
                for a_v in 0 to 1 loop
                    for b_v in 0 to 1 loop

                        if ena_v = 0 then
                         ENA <= '0';
                        else ENA <= '1';
                        end if;
                        if enb_v = 0 then 
                        ENB <= '0'; 
                        else ENB <= '1';
                        end if;
                        if a_v = 0 then 
                        A <= '0';
                        else A <= '1';
                        end if;
                        if b_v = 0 then 
                        B <= '0'; 
                        else B <= '1';
                        end if;

                        wait for T_STEP;
                    end loop;
                end loop;
            end loop;
        end loop;

        wait for T_GAP;

        --OR
        F_1 <= '0';
        F_0 <= '1';
        carry_in <= '0';
        wait for T_GAP;

        for inv_v in 0 to 1 loop
            for ena_v in 0 to 1 loop
                for enb_v in 0 to 1 loop
                    for a_v in 0 to 1 loop
                        for b_v in 0 to 1 loop
                        
                        if ena_v = 0 then
                         ENA <= '0';
                        else ENA <= '1';
                        end if;
                        if enb_v = 0 then 
                        ENB <= '0'; 
                        else ENB <= '1';
                        end if;
                        if a_v = 0 then 
                        A <= '0';
                        else A <= '1';
                        end if;
                        if b_v = 0 then 
                        B <= '0'; 
                        else B <= '1';
                        end if;
                        
                            wait for T_STEP;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;

        wait for T_GAP;

        --NOT
        F_1 <= '1';
        F_0 <= '0';
        INVA <= '0';
        ENA <= '0';
        A <= '0';
        carry_in <= '0';
        wait for T_GAP;

        for enb_v in 0 to 1 loop
            for b_v in 0 to 1 loop

                if enb_v = 0 then 
                ENB <= '0'; 
                else ENB <= '1'; 
                end if;    
                if b_v = 0 then 
                B <= '0';
                else B <= '1'; 
                end if;

                wait for T_STEP;
            end loop;
        end loop;

        wait for T_GAP;

        --ADD
        F_1 <= '1';
        F_0 <= '1';
        wait for T_GAP;

        for inv_v in 0 to 1 loop
            for ena_v in 0 to 1 loop
                for enb_v in 0 to 1 loop
                    for cin_v in 0 to 1 loop
                        for a_v in 0 to 1 loop
                            for b_v in 0 to 1 loop
                        
                                if ena_v = 0 then
                                 ENA <= '0';
                                else ENA <= '1';
                                end if;
                                if enb_v = 0 then 
                                ENB <= '0'; 
                                else ENB <= '1';
                                end if;
                                if a_v = 0 then 
                                A <= '0';
                                else A <= '1';
                                end if;
                                if b_v = 0 then 
                                B <= '0'; 
                                else B <= '1';
                                end if;
                                wait for T_STEP;
                                
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;

        wait;
    end process;

end architecture;
