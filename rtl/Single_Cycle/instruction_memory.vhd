library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mycomponents.all;
ENTITY instruction_memory IS
PORT
(
	addr  :	in  std_logic_vector(31 downto 0);  
	instr :	out std_logic_vector(31 downto 0)
);
end instruction_memory;

architecture struct of instruction_memory is
signal ROM : mem_array := (
	0 => X"00A00313", -- ADDI t1, zero, 10
	1 => X"00500393", -- ADDI t2, zero, 5
	2 => X"0063A023", -- SW t1, 0(t2) 
	3 => X"0003AE03", -- LW t3, 0(t2)
	4 => X"007e0eb3", -- ADD t4, t3, t2
	5 => X"0000006F", --J END
	others => x"00000013"  -- NOP (ADDI x0, x0, 0)
);
begin
	instr <= ROM(to_integer(unsigned(addr(9 downto 2))));
end struct;
