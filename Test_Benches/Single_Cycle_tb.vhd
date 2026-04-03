library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.mycomponents.all;

entity tb_riscv is
end tb_riscv;

architecture test of tb_riscv is

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '1';
    signal PC_Debug : std_logic_vector(31 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin

    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process clk_process;

    reset_process : process
    begin
        reset <= '1';
        wait for 60 ns;   
        reset <= '0';
        wait;              
    end process reset_process;

    DUT : entity work.RISCV
        port map (
            top_clk      => clk,
            top_reset    => reset,
            PC_Out_Debug => PC_Debug
        );

    check_process : process(clk)
        -- Declarations must go HERE (before the begin)
        type Reg_File_Probe_t is array (31 downto 0) of std_logic_vector(31 downto 0);
        variable prev_PC : unsigned(31 downto 0) := (others => '0');
        variable RF      : Reg_File_Probe_t; -- Declare RF here
    begin
        if rising_edge(clk) then
            if reset = '0' then

                -- Stuck PC check
                if unsigned(PC_Debug) = prev_PC and now > 100 ns then
                    report "WARNING: PC did not advance this cycle!" severity warning;
                end if;

                -- Update previous PC
                prev_PC := unsigned(PC_Debug);

                -- Probe the register file (Assignment only, not declaration)
                RF := <<signal .tb_riscv.DUT.Register_File_inst.Register_File : Reg_File_Probe_t>>;

                -- Check key registers
                case PC_Debug is
                    when x"00000004" =>
                        assert RF(10) = x"00000000" report "CHECK x10 after LUI failed" severity error;

                    when x"00000008" =>
                        report "x11 loaded = " & to_hstring(RF(11)) severity note;

                    when x"0000000C" =>
                        report "x12 after ANDI = " & to_hstring(RF(12)) severity note;

                    when x"00000010" =>
                        report "x12 after ADDI = " & to_hstring(RF(12)) severity note;

                    when x"00000014" =>
                        report "Memory store completed, x12 = " & to_hstring(RF(12)) severity note;

                    when others =>
                        null;
                end case;

            end if;
        end if;
    end process check_process;

    end_process : process
    begin
        wait for 2000 ns;  
        report "Simulation Finished" severity failure;
    end process end_process;

end architecture test;
