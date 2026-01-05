library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider is
    port(
        clk     : in  std_logic;                
        reset   : in  std_logic;                    
        Div     : in  std_logic_vector(1 downto 0);   
        Div_clk : out std_logic
    );
end ClockDivider;

architecture Behavioral of ClockDivider is

    signal div_reg   : std_logic_vector(1 downto 0) := (others => '0');
    signal cnt       : integer := 0;
    signal threshold : integer := 1;
    signal div_clk_r : std_logic := '0';

begin

    Div_clk <= div_clk_r;

    process(clk, reset)
        variable new_threshold : integer;
    begin
        if (reset = '1') then
            div_reg    <= (others => '0');
            cnt        <= 0;
            threshold  <= 1;
            div_clk_r  <= '0';

        elsif rising_edge(clk) then
        
            div_reg <= Div;
            case div_reg is
                when "00" => new_threshold := 250000;  
                when "01" => new_threshold := 25000;  
                when "10" => new_threshold := 2500; 
                when "11" => new_threshold := 250;
                when others => new_threshold := 250000;
            end case;
            
            if (Div /= div_reg) then
                cnt       <= 0;
                threshold <= new_threshold;
                div_clk_r <= '0';

            else
                threshold <= new_threshold;

                if (cnt = threshold - 1) then
                    cnt       <= 0;
                    div_clk_r <= not div_clk_r;
                else
                    cnt <= cnt + 1;
                end if;
            end if;

        end if;
    end process;

end Behavioral;
