LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Digit_Selector IS 
PORT
(
    CLK    : IN STD_LOGIC;
    RESET  : IN STD_LOGIC;
    DIGITS : OUT STD_LOGIC_VECTOR(7 downto 0)
);
END Digit_Selector;

ARCHITECTURE Behavioral OF Digit_Selector IS
    SIGNAL ANODE : STD_LOGIC_VECTOR(7 downto 0);
BEGIN

    DIGITS <= ANODE;

    PROCESS(CLK, RESET)
        VARIABLE count : INTEGER RANGE 0 to 7 := 0; 
    BEGIN
        IF (RESET = '1') THEN
            ANODE <= "00000000"; 
            count := 0;
        ELSIF rising_edge(clk) THEN
            ANODE <= "00000000";       
            ANODE(count) <= '1';   
            
            IF (count = 7) THEN   
                count := 0;
            ELSE
                count := count + 1;
            END IF;
        END IF;
    END PROCESS;

END Behavioral;
