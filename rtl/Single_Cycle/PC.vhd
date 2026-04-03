LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PC IS
    PORT(
        PC_in  : IN  STD_LOGIC_VECTOR(31 downto 0);
        reset  : IN  STD_LOGIC;
        clk    : IN  STD_LOGIC;
        PC_out : OUT STD_LOGIC_VECTOR(31 downto 0)
    );
END PC;

ARCHITECTURE Behavioral OF PC IS
BEGIN
    PROCESS(clk, reset)
    BEGIN
        IF(reset = '1') THEN
            PC_out <= X"00000000";
        ELSIF (clk'event AND clk = '1') THEN
				PC_out <= PC_in;
        END IF;
    END PROCESS;
END Behavioral;
