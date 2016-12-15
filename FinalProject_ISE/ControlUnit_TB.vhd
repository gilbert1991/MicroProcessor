--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:24:33 12/15/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/FinalProject_ISE/ControlUnit_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit
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
 
ENTITY ControlUnit_TB IS
END ControlUnit_TB;
 
ARCHITECTURE behavior OF ControlUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         opcode : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         Branch : OUT  std_logic;
         isJump : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(3 downto 0);
         ALUSrc : OUT  std_logic;
         RegWrite : OUT  std_logic;
         isHAL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal Branch : std_logic;
   signal isJump : std_logic;
   signal MemRead : std_logic;
   signal MemWrite : std_logic;
   signal ALUOp : std_logic_vector(3 downto 0);
   signal ALUSrc : std_logic;
   signal RegWrite : std_logic;
   signal isHAL : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          opcode => opcode,
          RegDst => RegDst,
          Branch => Branch,
          isJump => isJump,
          MemRead => MemRead,
          MemWrite => MemWrite,
          ALUOp => ALUOp,
          ALUSrc => ALUSrc,
          RegWrite => RegWrite,
          isHAL => isHAL
        );

   -- Clock process definitions
 

   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	
			opcode <= "000000";
		wait for 50 ns;	
			opcode <= "000001";
		wait for 50 ns;	
			opcode <= "000010";
		wait for 50 ns;	
			opcode <= "000011";
		wait for 50 ns;	
			opcode <= "000100";
		wait for 50 ns;	
			opcode <= "000101";
		wait for 50 ns;	
			opcode <= "000110";
		wait for 50 ns;	
			opcode <= "000111";
		wait for 50 ns;	
			opcode <= "001000";
		wait for 50 ns;	
			opcode <= "001001";
		wait for 50 ns;	
			opcode <= "001010";
		wait for 50 ns;	
			opcode <= "001011";
		wait for 50 ns;	
			opcode <= "001100";
		wait for 50 ns;	
			opcode <= "111111";

      -- insert stimulus here 

      wait;
   end process;

END;
