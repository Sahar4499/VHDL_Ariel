library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port(
        A       : in  unsigned; 
        B       : in  unsigned; 
        OP_CODE : in  std_logic_vector(2 downto 0);
        Y       : out std_logic
    );
end ALU;

architecture Stracture of ALU is

    component Mux2x1 is 
        generic(N : integer := 1);
        port(
            X     : in  std_logic_vector((2**N)-1 downto 0);
            SEL   : in  std_logic_vector(N-1 downto 0);
            Y     : out std_logic
        );
    end component;

    component Mux4x1 is 
        generic(N : integer := 2);
        port(
            X     : in  std_logic_vector((2**N)-1 downto 0);
            SEL   : in  std_logic_vector(N-1 downto 0);
            Y     : out std_logic
        );
    end component;


    for all : Mux2x1 use entity work.MuxNx1(RTL);
    for all : Mux4x1 use entity work.MuxNx1(RTL);
    signal ALUbit : std_logic_vector(7 downto 0) := (others => '0');
    signal Temp   : std_logic_vector(1 downto 0);

    signal Au, Bu : unsigned(0 downto 0);

begin
    Au(0) <= A(0);
    Bu(0) <= B(0);
    ALUbit(0) <= std_logic((Au + Bu)(0));    
    ALUbit(1) <= std_logic((Au - Bu)(0));   
    ALUbit(2) <= std_logic((Bu + 1)(0));     
    ALUbit(3) <= std_logic((Au + 1)(0));     
    ALUbit(4) <= A(0) and B(0);
    ALUbit(5) <= A(0) or  B(0);
    ALUbit(6) <= A(0) xor B(0);
    ALUbit(7) <= not (A(0) and B(0));      

    mux1: Mux4x1
        generic map(N => 2)
        port map(
            X   => ALUbit(3 downto 0),
            SEL => OP_CODE(1 downto 0),
            Y   => Temp(0)
        );


    mux2: Mux4x1
        generic map(N => 2)
        port map(
            X   => ALUbit(7 downto 4),
            SEL => OP_CODE(1 downto 0),
            Y   => Temp(1)
        );


    mux3: Mux2x1
        generic map(N => 1)
        port map(
            X   => Temp,        
            SEL => OP_CODE(2 downto 2),  
            Y   => Y
        );

end Stracture;