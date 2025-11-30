library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- מימוש הבלוק
entity Q1 is
    port(
        A : in  std_logic_vector(7 downto 0);
        B : in  std_logic_vector(3 downto 0);
        Y : out std_logic_vector(7 downto 0)
    );
end Q1;

-- 1) Aggregation
architecture Aggregation of Q1 is
    signal Y_NAND, Y_XOR : std_logic_vector(3 downto 0);
begin

    Y_NAND <= A(7 downto 4) nand B;
    Y_XOR  <= A(3 downto 0) xor Y_NAND;

    -- Aggregation of the output
    Y <= ( Y_NAND(3), Y_NAND(2), Y_NAND(1), Y_NAND(0),
           Y_XOR(3),  Y_XOR(2),  Y_XOR(1),  Y_XOR(0) );

end Aggregation;


-- 2) Concatenation
architecture Concatenation of Q1 is
    signal Y_NAND, Y_XOR : std_logic_vector(3 downto 0);
begin

    Y_NAND <= A(7 downto 4) nand B;
    Y_XOR  <= A(3 downto 0) xor Y_NAND;

    -- Concatenation of the output
    Y <= Y_NAND & Y_XOR;

end Concatenation;

-- 3) Slicing
architecture Slicing of Q1 is
    signal Y_NAND, Y_XOR : std_logic_vector(3 downto 0);
begin

    Y_NAND <= A(7 downto 4) nand B;
    Y_XOR  <= A(3 downto 0) xor Y_NAND;

    -- Slicing of the output
    Y(7 downto 4) <= Y_NAND;
    Y(3 downto 0) <= Y_XOR;

end Slicing;