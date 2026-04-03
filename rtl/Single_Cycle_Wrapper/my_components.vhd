library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mycomponents is

	type mem_array is array (0 to 255) of std_logic_vector(31 downto 0);
	 
  component instruction_memory is
  port (
   addr  :	in  std_logic_vector(31 downto 0);  
	instr :	out std_logic_vector(31 downto 0)
	);
	end component;
	
	
	component Register_File is
	port ( 
  clk            : in std_logic;
  reset          : in std_logic;
  read_register1 : in std_logic_vector(4 downto 0);
  read_register2 : in std_logic_vector(4 downto 0);
  write_register : in std_logic_vector(4 downto 0);
  read_data1     : out std_logic_vector(31 downto 0);
  read_data2     : out std_logic_vector(31 downto 0);
  register_write : in std_logic;
  write_data     : in std_logic_vector(31 downto 0)
  );
  end component;
  
  component alu_controller is
  port(
  op5        : in  std_logic;
  funct3     : in  std_logic_vector(2 downto 0);
  funct7_5   : in  std_logic;
  ALUOp      : in  std_logic_vector(1 downto 0);
  ALUControl : out std_logic_vector(3 downto 0)
  );
  end component;
  
  component control_unit is
  port(
        opcode    : in  std_logic_vector (6 downto 0);
        immsrc    : out std_logic_vector (2 downto 0);
        aluop     : out std_logic_vector (1 downto 0);
        alusrc1   : out std_logic; -- imm vs rs2
        alusrc2   : out std_logic; -- PC vs rs1
		  memtoreg  : out std_logic;
        luisrc    : out std_logic;
        pcsrc     : out std_logic; -- rs1 base select
        branch    : out std_logic;
        jump      : out std_logic;
        memwrite  : out std_logic;
        regwrite  : out std_logic
	);
	end component;
	
	component ALU is
	port (
	 ALU_Operand1: in std_logic_vector(31 downto 0);
	 ALU_Operand2: in std_logic_vector(31 downto 0);
	 ALU_Control : in std_logic_vector(3 downto 0);
	 ALU_Result : out std_logic_vector(31 downto 0)
	 );
	 end component;
	 
	component Data_Memory is
   port (
    clk : in std_logic;
	address : in std_logic_vector(7 downto 0);
	data_rd : out std_logic_vector(31 downto 0);
	data_wr : in std_logic_vector(31 downto 0);
	Mem_Write : in std_logic
   );
   end component;
	
	component PC is
	port(
	     PC_in  : IN  STD_LOGIC_VECTOR(31 downto 0);
        reset  : IN  STD_LOGIC;
        clk    : IN  STD_LOGIC;
        PC_out : OUT STD_LOGIC_VECTOR(31 downto 0)
		  );
	end component;

    
	component PC_Decision_Module is
   port(
    PC_in      : IN  STD_LOGIC_VECTOR (31 downto 0);
    RS1        : IN  STD_LOGIC_VECTOR (31 downto 0);
    OFFSET     : IN  STD_LOGIC_VECTOR (31 downto 0);
    BRANCH     : IN  STD_LOGIC;
    JUMP       : IN  STD_LOGIC;
    PCSrc      : IN  STD_LOGIC;
    ALU_RESULT : IN  STD_LOGIC;
    PC_out     : OUT STD_LOGIC_VECTOR (31 downto 0) 
	 );
	end component;

   component Immendiate_Generator is
	port(
	IMMEDIATE_IN : IN STD_LOGIC_VECTOR(31 downto 7);
	IMMSrc : IN STD_LOGIC_VECTOR( 2 downto 0);
	IMMEDIATE_OUT : OUT STD_LOGIC_VECTOR(31 downto 0));
	end component;
	
	
   component decoder is
    port (
        instr     : in  std_logic_vector(31 downto 0);  
        opcode    : out std_logic_vector(6 downto 0);
        rs1       : out std_logic_vector(4 downto 0);
        rs2       : out std_logic_vector(4 downto 0);
        rd        : out std_logic_vector(4 downto 0);
		  immediate_in : out std_logic_vector(24 downto 0);
		  funct3		: out std_logic_vector(2 downto 0);
		  funct7_5  : out std_logic
    );
   end component;
	
	
	component MUX is
	port(
	 IN_1   : IN  STD_LOGIC_VECTOR(31 downto 0); 
    IN_2   : IN  STD_LOGIC_VECTOR(31 downto 0);
    SEL    : IN  STD_LOGIC;                      
    MUX_Out : OUT STD_LOGIC_VECTOR(31 downto 0)
	 );
	 end component;
	 
	 --INSTANTIATING COMPONENTS FOR THE SEVEN-SEGMENT DISPLAY
	 COMPONENT CLK_Div IS
	 PORT(
		CLK   : IN  STD_LOGIC;
		RESET : IN  STD_LOGIC;
		SCLK  : OUT STD_LOGIC
	 );
	 END COMPONENT;
	 
	 COMPONENT Digit_Selector IS
	 PORT(
		CLK    : IN STD_LOGIC;
		RESET  : IN STD_LOGIC;
		DIGITS : OUT STD_LOGIC_VECTOR(7 downto 0)	 
	 );
	 END COMPONENT;
	 
	 COMPONENT MUX_16X1 IS
	 PORT(
	    D0, D1, D2, D3, D4, D5, D6, D7 : IN  STD_LOGIC_VECTOR(3 downto 0);
		 SEL                            : IN  STD_LOGIC_VECTOR(7 downto 0);
		 OUTPUT                         : OUT STD_LOGIC_VECTOR(3 downto 0)
	 );
	 END COMPONENT;
	 
	 COMPONENT MUX_Decoder IS
	 PORT(
	    ANODES : OUT STD_LOGIC_VECTOR(6 downto 0);
		 INPUTS : IN STD_LOGIC_VECTOR(3 downto 0)
	 );
	 END COMPONENT;
	
end package;	
	
