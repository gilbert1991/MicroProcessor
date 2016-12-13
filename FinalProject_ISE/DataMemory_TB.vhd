--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:05:55 12/11/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/DataMemory_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
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
use work.SingleCycle_PKG.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DataMemory_TB IS
END DataMemory_TB;
 
ARCHITECTURE behavior OF DataMemory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         clock : IN  std_logic;
         clear : IN  std_logic;
         Address : IN  std_logic_vector(31 downto 0);
         DatatoWrite : IN  std_logic_vector(31 downto 0);
         MemWrite : IN  std_logic;
         MemRead : IN  std_logic;
         dout : OUT  std_logic_vector(31 downto 0);
			D_Mem : DATA_MEMORY
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '1';
   signal clear : std_logic := '0';
   signal Address : std_logic_vector(31 downto 0) := x"0000001d";
   signal DatatoWrite : std_logic_vector(31 downto 0) := x"fafafafa";
   signal MemWrite : std_logic := '0';
   signal MemRead : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          clock => clock,
          clear => clear,
          Address => Address,
          DatatoWrite => DatatoWrite,
          MemWrite => MemWrite,
          MemRead => MemRead,
          dout => dout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 31 ns;	-- let's hope MemWrite control Signal have longer delay!
			MemWrite <= not MemWrite;
      wait for clock_period;
			MemWrite <= not MemWrite;
			MemRead <= not MemRead;
		wait for clock_period;
			MemRead <= not MemRead;

      -- insert stimulus here 

      wait;
   end process;

END;
