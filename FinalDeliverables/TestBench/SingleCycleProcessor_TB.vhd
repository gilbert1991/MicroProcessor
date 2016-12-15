--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:37:51 12/15/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/FinalProject_ISE/SingleCycleProcessor_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SingleCycleCPU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SingleCycleProcessor_TB IS
END SingleCycleProcessor_TB;
 
ARCHITECTURE behavior OF SingleCycleProcessor_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SingleCycleCPU
    PORT(
         Clock : IN  std_logic;
         Clear : IN  std_logic;
         sel_Addr : IN  std_logic_vector(7 downto 0);
         DMem_out : OUT  std_logic_vector(31 downto 0);
         IMem_out : OUT  std_logic_vector(31 downto 0);
         GPR_out : OUT  std_logic_vector(31 downto 0);
         PC_current : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '1';
   signal Clear : std_logic := '0';
   signal sel_Addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DMem_out : std_logic_vector(31 downto 0);
   signal IMem_out : std_logic_vector(31 downto 0);
   signal GPR_out : std_logic_vector(31 downto 0);
   signal PC_current : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SingleCycleCPU PORT MAP (
          Clock => Clock,
          Clear => Clear,
          sel_Addr => sel_Addr,
          DMem_out => DMem_out,
          IMem_out => IMem_out,
          GPR_out => GPR_out,
          PC_current => PC_current
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '1';
		wait for Clock_period/2;
		Clock <= '0';
		wait for Clock_period/2;
   end process;
 

	clear_process : process
	begin
			clear <= '1';
		wait for 30 ns;
			clear <= '0';
		wait;
	end process;
   -- Stimulus process

END;
