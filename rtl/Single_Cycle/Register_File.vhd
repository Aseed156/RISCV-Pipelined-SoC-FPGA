library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Register_File is
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
end Register_File;

architecture Behavioral of Register_File is

--Register File is an Array
type Register_File_t is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Register_File : Register_File_t := (others => (others => '0'));

begin

  --Process for Reading the Data From the Registers
  Read_from_Register : process (read_register1, read_register2,Register_File) 
     begin 
	   read_data1<=Register_File(to_integer(unsigned(read_register1)));
	   read_data2<=Register_File(to_integer(unsigned(read_register2)));
	  end process;
	  
	  
	--Process for Write on the Register File
   Write_to_Register : process (clk)
	   begin
		 if rising_edge(clk) then
		     --All Registers Initialized to 0 on reset
			  if reset='1' then
			     for i in 0 to 31 loop
				    register_file(i) <=(others=>'0');
					end loop;
				--Write on Register Except for x0 	
				elsif register_write='1' and write_register /= "00000" then
				  Register_File(to_integer(unsigned(write_register)))<=write_data;
				end if;
		  end if;
		  
	 end process;

end Behavioral;	 
		  
				  
				
    	
	 
	

	
	  
  
  
