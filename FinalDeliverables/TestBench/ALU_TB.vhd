--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:44:10 12/11/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/ALU_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         sign_extended : IN  std_logic_vector(31 downto 0);
         ALUSrc : IN  std_logic;
			ALU_OP : in ALU_OPERATION;
			ALUResult : OUT  std_logic_vector(31 downto 0);
         compResult : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := x"89ABCDEF";
   signal data2 : std_logic_vector(31 downto 0) := x"01234567";
   signal sign_extended : std_logic_vector(31 downto 0) := x"89ABCD05";
   signal ALUSrc : std_logic := '0';
   signal ALU_OP : ALU_OPERATION;

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   signal compResult : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          data1 => data1,
          data2 => data2,
          sign_extended => sign_extended,
          ALUSrc => ALUSrc,
          ALU_OP => ALU_OP,
          ALUResult => ALUResult,
          compResult => compResult
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			ALU_op <= O_ADD;
      wait for 50 ns;
			ALU_op <= O_SUB;
		wait for 50 ns;
			ALU_op <= O_OR;
		wait for 50 ns;
			ALU_op <= O_NOR;
		wait for 50 ns;
			ALU_op <= O_AND;
		wait for 50 ns;
			ALU_op <= O_SHL;
		wait for 50 ns;
			ALU_op <= O_SHR;
		wait for 50 ns;
			ALU_op <= O_BEQ;
		wait for 50 ns;
			ALU_op <= O_BNE;
		wait for 50 ns;
			ALU_op <= O_BLT;
		wait for 100 ns;
			data1 <= x"00000055";
			ALUSrc <= '1';

			

--      wait for <clock>_period*10;

      -- insert stimulus here 
   end process;

END;
