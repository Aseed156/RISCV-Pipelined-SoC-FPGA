LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PC_Decision_Module IS 
PORT(  
    PC_in      : IN  STD_LOGIC_VECTOR (31 downto 0);
    RS1        : IN  STD_LOGIC_VECTOR (31 downto 0);
    OFFSET     : IN  STD_LOGIC_VECTOR (31 downto 0);
    BRANCH     : IN  STD_LOGIC;
    JUMP       : IN  STD_LOGIC;
    PCSrc      : IN  STD_LOGIC;
    ALU_RESULT : IN  STD_LOGIC;
    PC_out     : OUT STD_LOGIC_VECTOR (31 downto 0)
);
END PC_Decision_Module;

ARCHITECTURE Behavioral OF PC_Decision_Module IS

    COMPONENT MUX
    PORT(  
        IN_1   : IN  STD_LOGIC_VECTOR(31 downto 0); 
        IN_2   : IN  STD_LOGIC_VECTOR(31 downto 0);
        SEL    : IN  STD_LOGIC;                      
        MUX_Out : OUT STD_LOGIC_VECTOR(31 downto 0)
    );
    END COMPONENT;
        
    SIGNAL OUT_MUX_1, OUT_MUX_2, IN_1_MUX_2 : STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL MUX_2_SEL : STD_LOGIC;

BEGIN

    IN_1_MUX_2 <= X"00000004"; 
    MUX_2_SEL  <= (BRANCH AND ALU_RESULT) OR JUMP;

    MUX1 : MUX 
        PORT MAP(
            IN_1   => PC_in,
            IN_2   => RS1,
            SEL    => PCSrc,
            MUX_Out => OUT_MUX_1
        );
        
    MUX2 : MUX 
        PORT MAP(
            IN_1   => IN_1_MUX_2,
            IN_2   => OFFSET,
            SEL    => MUX_2_SEL,
            MUX_Out => OUT_MUX_2
        );
        
    PC_out <= STD_LOGIC_VECTOR(UNSIGNED(OUT_MUX_1) + UNSIGNED(OUT_MUX_2));

END Behavioral;
