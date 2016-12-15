--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:27:45 12/15/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/FinalProject_ISE/DataMemory_TB.vhd
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
         Address : IN  std_logic_vector(5 downto 0);
         DatatoWrite : IN  std_logic_vector(31 downto 0);
         MemWrite : IN  std_logic;
         MemRead : IN  std_logic;
         MemData : OUT  std_logic_vector(31 downto 0);
         sel_Addr : IN  std_logic_vector(5 downto 0);
         DMem_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '1';
   signal clear : std_logic := '0';
   signal Address : std_logic_vector(5 downto 0) := "011101";
   signal DatatoWrite : std_logic_vector(31 downto 0) := x"fafafafa";
   signal MemWrite : std_logic := '0';
   signal MemRead : std_logic := '0';
   signal sel_Addr : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal MemData : std_logic_vector(31 downto 0);
   signal DMem_out : std_logic_vector(31 downto 0);

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
          MemData => MemData,
          sel_Addr => sel_Addr,
          DMem_out => DMem_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;
 

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
