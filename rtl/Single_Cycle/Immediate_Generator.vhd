LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY Immendiate_Generator IS 
PORT( 
	IMMEDIATE_IN : IN STD_LOGIC_VECTOR(31 downto 7);
	IMMSrc : IN STD_LOGIC_VECTOR( 2 downto 0);
	IMMEDIATE_OUT : OUT STD_LOGIC_VECTOR(31 downto 0));
END Immendiate_Generator;

ARCHITECTURE Behavioral OF Immendiate_Generator IS
BEGIN

    WITH IMMSrc SELECT
        IMMEDIATE_OUT <= 
            -- I-Type
            (31 downto 12 => IMMEDIATE_IN(31)) & IMMEDIATE_IN(31 downto 20) 
                WHEN "000",

            -- S-Type
            (31 downto 12 => IMMEDIATE_IN(31)) & IMMEDIATE_IN(31 downto 25) & IMMEDIATE_IN(11 downto 7) 
                WHEN "001",

            -- B-Type
            (31 downto 13 => IMMEDIATE_IN(31)) & IMMEDIATE_IN(31) & IMMEDIATE_IN(7) & IMMEDIATE_IN(30 downto 25) & IMMEDIATE_IN(11 downto 8) & '0' 
                WHEN "010",

            -- U-Type
            IMMEDIATE_IN(31 downto 12) & X"000" 
                WHEN "100",

            -- J-Type
            (31 downto 21 => IMMEDIATE_IN(31)) & IMMEDIATE_IN(31) & IMMEDIATE_IN(19 downto 12) & IMMEDIATE_IN(20) & IMMEDIATE_IN(30 downto 21) & '0' 
                WHEN "011",

            X"00000000" WHEN OTHERS;

END Behavioral;
