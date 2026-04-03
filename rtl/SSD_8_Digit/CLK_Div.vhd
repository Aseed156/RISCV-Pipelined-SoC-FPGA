LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; 

ENTITY CLK_Div IS
PORT
(
    CLK   : IN  STD_LOGIC;
    RESET : IN  STD_LOGIC;
    SCLK  : OUT STD_LOGIC
);
END CLK_Div;

ARCHITECTURE Behavioral OF CLK_Div IS
   
    SIGNAL DIVIDER : UNSIGNED(15 downto 0) := (others => '0');
BEGIN

   
    SCLK <= std_logic_vector(DIVIDER)(14); 

    PROCESS(CLK, RESET)
    BEGIN
        IF RESET = '1' THEN
            DIVIDER <= (others => '0');
        ELSIF rising_edge(CLK) THEN 
            DIVIDER <= DIVIDER + 1; 
        END IF; 
    END PROCESS;

END Behavioral;
