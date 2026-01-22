library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ALU_MUX is
end TB_ALU_MUX;

architecture Behavioral of TB_ALU_MUX is

    component ALU_MUX is
        port(
            A       : in  unsigned;
            B       : in  unsigned;
            OP_CODE : in  std_logic_vector(2 downto 0library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ALU is
end TB_ALU;

architecture sim of TB_ALU is

    component ALU is
        port(
            A       : in  unsigned;
            B       : in  unsigned;
            OP_CODE : in  std_logic_vector(2 downto 0);
            Y       : out std_logic
        );
    end component;

    signal A_tb       : unsigned(0 downto 0) := (others => '0');
    signal B_tb       : unsigned(0 downto 0) := (others => '0');
    signal OP_CODE_tb : std_logic_vector(2 downto 0) := (others => '0');
    signal Y_tb       : std_logic;

begin

    UUT: ALU
        port map(
            A       => A_tb,
            B       => B_tb,
            OP_CODE => OP_CODE_tb,
            Y       => Y_tb
        );

    process
    begin
        -- נריץ על כל A,B (00,01,10,11) ועל כל opcode (0..7)
        for a_val in 0 to 1 loop
            for b_val in 0 to 1 loop
                A_tb(0) <= std_logic'val(character'val(a_val + character'pos('0'))); -- טריק קטן, אפשר גם if
                B_tb(0) <= std_logic'val(character'val(b_val + character'pos('0')));

                for op in 0 to 7 loop
                    OP_CODE_tb <= std_logic_vector(to_unsigned(op, 3));
                    wait for 10 ns;
                end loop;

            end loop;
        end loop;

        wait;
    end process;

end sim;);
            Y       : out std_logic
        );
    end component;

    signal A : std_logic_vector(7 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');
    signal Y : std_logic_vector(7 downto 0);

begin

    UUT1 : Q1
        port map(
            A => A,
            B => B,
            Y => Y
        );

    stim_proc : process
    begin
        -- case 1
        A <= "00000000"; B <= "0000"; wait for 10 ns;
        -- case 2
        A <= "11111111"; B <= "0000"; wait for 10 ns;
        -- case 3
        A <= "11110000"; B <= "1111"; wait for 10 ns;
        -- case 4
        A <= "00001111"; B <= "1010"; wait for 10 ns;
        -- case 5
        A <= "10101010"; B <= "0101"; wait for 10 ns;

        wait;
    end process;

end Behavioral;