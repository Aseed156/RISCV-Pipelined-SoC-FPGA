LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX IS
PORT(
    IN_1   : IN  STD_LOGIC_VECTOR(31 downto 0); 
    IN_2   : IN  STD_LOGIC_VECTOR(31 downto 0);
    SEL    : IN  STD_LOGIC;                      
    MUX_Out : OUT STD_LOGIC_VECTOR(31 downto 0));
END MUX;

ARCHITECTURE Behavioral OF MUX IS
BEGIN
    WITH SEL SELECT
    MUX_Out <= IN_1  when '0',
	           IN_2  when '1',
				  (others=>'0')     when others;
END Behavioral;
