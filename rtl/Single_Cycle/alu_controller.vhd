library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_controller is
    port(
        op5        : in  std_logic;
        funct3     : in  std_logic_vector(2 downto 0);
        funct7_5   : in  std_logic;
        ALUOp      : in  std_logic_vector(1 downto 0);
        ALUControl : out std_logic_vector(3 downto 0)
    );
end alu_controller;

architecture struct of alu_controller is
begin
	process(op5, funct3, funct7_5, ALUOp)
   begin
		case ALUOp is
			when "00" =>
				ALUControl <= "0000";  -- add (lw/sw)
            when "01" =>
                ALUControl <= "0001";  -- sub (beq)
            when "10" =>
					case funct3 is
						when "000" =>
							if (op5 and funct7_5) = '1' then
								ALUControl <= "0001";  -- sub
                     else
                        ALUControl <= "0000";  -- add
                     end if;
                   when "001" =>
                        ALUControl <= "0101"; -- sll
                   when "010" =>
                        ALUControl <= "1000"; --slt
                   when "011" =>
                        ALUControl <= "1001"; --sltu
                   when "100" =>
                        ALUControl <= "0100"; --xor
                   when "101" =>
							if funct7_5 = '1' then
								ALUControl <= "0111";  -- sra
							else
                         ALUControl <= "0110";  -- srl
                     end if;
                   when "110" =>
                        ALUControl <= "0011"; -- or
                   when "111" =>
                        ALUControl <= "0010"; -- and
                    when others =>
                        ALUControl <= "0000"; 
					end case;
					when others=> ALUControl <= "0000"; 
        end case;
    end process;
end struct;
