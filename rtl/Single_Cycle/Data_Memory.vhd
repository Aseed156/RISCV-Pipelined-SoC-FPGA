library IEEE;
use IEEE.std_logic_1164.all;

entity Data_Memory is
port(
   clk : in std_logic;
	address : in std_logic_vector(7 downto 0);
	data_rd : out std_logic_vector(31 downto 0);
	data_wr : in std_logic_vector(31 downto 0);
	Mem_Write : in std_logic
);
end Data_Memory;

architecture behavioral of Data_Memory is
signal wren : std_logic;

begin
  wren <= '0' when Mem_Write='0' else
          '1';

u_imem : entity work.RAM
  port map (
    clock   => clk,
    address => address,
    data    => data_wr,
    wren    => wren,
    q       => data_rd      --Read=0, Write=1
  );
  
end behavioral;  
