-- CORRECTED MUX_16X1
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_16X1 IS
PORT(
    D0, D1, D2, D3, D4, D5, D6, D7 : IN  STD_LOGIC_VECTOR(3 downto 0);
    SEL                            : IN  STD_LOGIC_VECTOR(7 downto 0);
    OUTPUT                         : OUT STD_LOGIC_VECTOR(3 downto 0)
);
END MUX_16X1;

ARCHITECTURE Behavioral OF MUX_16X1 IS
BEGIN
    WITH SEL SELECT
        OUTPUT <= D0 WHEN "00000001", 
                  D1 WHEN "00000010",
                  D2 WHEN "00000100",
                  D3 WHEN "00001000",
                  D4 WHEN "00010000",
                  D5 WHEN "00100000",
                  D6 WHEN "01000000",
                  D7 WHEN "10000000",
                  "0000" WHEN OTHERS;
END Behavioral;
