--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:45:59 12/11/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/Program_Counter_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Program_Counter
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
 
ENTITY Program_Counter_TB IS
END Program_Counter_TB;
 
ARCHITECTURE behavior OF Program_Counter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_Counter
    PORT(
         clock : IN  std_logic;
         clear : IN  std_logic;
         isJump : IN  std_logic;
         isBranch : IN  std_logic;
         Jump_Address : IN  std_logic_vector(25 downto 0);
         sign_extended : IN  std_logic_vector(31 downto 0);
         PC : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '1';
   signal clear : std_logic := '0';
   signal isJump : std_logic := '0';
   signal isBranch : std_logic := '0';
   signal Jump_Address : std_logic_vector(25 downto 0) := "11" & x"AAAAAA";
   signal sign_extended : std_logic_vector(31 downto 0) := x"00007001";

 	--Outputs
   signal PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          clock => clock,
          clear => clear,
          isJump => isJump,
          isBranch => isBranch,
          Jump_Address => Jump_Address,
          sign_extended => sign_extended,
          PC => PC
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
--		wait for 10 ns;
--			clear <= '1';
--		wait for 10 ns;
--			clear <= '0';
      wait for 100 ns;	
			isJump <= not isJump;
		wait for clock_period;
			isJump <= not isJump;
      wait for clock_period*10;
			isBranch <= not isBranch;
		wait for clock_period;
			isBranch <= not isBranch;
			sign_extended <= x"FFFF8001";
		wait for clock_period*10;
			isBranch <= not isBranch;
		wait for clock_period;
			isBranch <= not isBranch;	
      -- insert stimulus here 
		wait for clock_period*10;
			clear <= not clear;
		wait for clock_period*5;
			clear <= not clear;
      wait;
   end process;

END;
