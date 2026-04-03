library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
    port (
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
end;

architecture rtl of control_unit is
begin

process(opcode)
begin
    -- DEFAULTS
    immsrc   <= "000";
    aluop    <= "00";

    alusrc1  <= '0';
    alusrc2  <= '0';

    memtoreg <= '0';
    luisrc   <= '0';

    pcsrc    <= '0';

    branch   <= '0';
    jump     <= '0';
    memwrite <= '0';
    regwrite <= '0';

    case opcode is

        -- LW
        when "0000011" =>
            immsrc   <= "000";
            alusrc1  <= '1';
            memtoreg <= '1';
            regwrite <= '1';

        -- SW
        when "0100011" =>
            immsrc   <= "001";
            alusrc1  <= '1';
            memwrite <= '1';

        -- R-type
        when "0110011" =>
            aluop    <= "10";
            regwrite <= '1';

        -- Branch
        when "1100011" =>
            immsrc   <= "010";
            aluop    <= "01";
            branch   <= '1';

        -- I-type ALU
        when "0010011" =>
            immsrc   <= "000";
            alusrc1  <= '1';
            aluop    <= "10";
            regwrite <= '1';

        -- JAL
        when "1101111" =>
            immsrc   <= "011";
            alusrc2  <= '1';
            jump     <= '1';
            regwrite <= '1';

        -- JALR
        when "1100111" =>
            immsrc   <= "000";
            alusrc1  <= '1';
            pcsrc    <= '1';
            jump     <= '1';
            regwrite <= '1';

        -- LUI
        when "0110111" =>
            immsrc   <= "100";
            luisrc   <= '1';
            regwrite <= '1';

        -- AUIPC
        when "0010111" =>
            immsrc   <= "100";
            alusrc1  <= '1';
            alusrc2  <= '1';
            regwrite <= '1';

        when others =>
            null;

    end case;

end process;

end rtl;
