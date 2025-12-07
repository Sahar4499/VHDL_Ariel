library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SR_Latch is
end TB_SR_Latch;

architecture Behavioral of TB_SR_Latch is

    component SR_Latch
    Port ( 
        S : in STD_LOGIC;
        R : in STD_LOGIC;
        Q : out STD_LOGIC;
        Q_bar : out STD_LOGIC
    );
    end component;

    signal S_tb : STD_LOGIC := '0';
    signal R_tb : STD_LOGIC := '0';
    signal Q_tb : STD_LOGIC;
    signal Q_bar_tb : STD_LOGIC;

begin

    UUT: SR_Latch 
    Port Map (
        S => S_tb,
        R => R_tb,
        Q => Q_tb,
        Q_bar => Q_bar_tb
    );


    stim_proc: process
    begin
       
        wait for 20 ns;
        S_tb <= '0';R_tb <= '1';wait for 40 ns;
        S_tb <= '0';R_tb <= '0';wait for 40 ns;
        S_tb <= '1';R_tb <= '0';wait for 40 ns;
        S_tb <= '0';R_tb <= '0';wait for 40 ns;
        S_tb <= '1';R_tb <= '1';wait for 40 ns;
        S_tb <= '0';R_tb <= '0';
        wait;
    end process;

end Behavioral;