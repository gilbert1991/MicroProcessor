--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:35:12 12/12/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/ALUControl_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUControl
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
 
ENTITY ALUControl_TB IS
END ALUControl_TB;
 
ARCHITECTURE behavior OF ALUControl_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUControl
    PORT(
         Funct : IN  std_logic_vector(5 downto 0);
         ALUOp : IN  std_logic_vector(3 downto 0);
         ALU_OP : OUT  ALU_OPERATION
        );
    END COMPONENT;
    

   --Inputs
   signal Funct : std_logic_vector(5 downto 0) := (others => '0');
   signal ALUOp : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_OP : ALU_OPERATION;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUControl PORT MAP (
          Funct => Funct,
          ALUOp => ALUOp,
          ALU_OP => ALU_OP
        );


   -- Stimulus process
   op_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 200 ns;	
			ALUOP <= "0001";
		wait for 100 ns;	
			ALUOP <= "0010";
		wait for 100 ns;	
			ALUOP <= "0011";
		wait for 100 ns;	
			ALUOP <= "0100";
		wait for 100 ns;	
			ALUOP <= "0101";
		wait for 100 ns;	
			ALUOP <= "0110";
		wait for 100 ns;	
			ALUOP <= "0111";
		wait for 100 ns;	
			ALUOP <= "1000";
		wait for 100 ns;	
			ALUOP <= "1001";
		wait for 100 ns;	
			ALUOP <= "1010";
		wait for 100 ns;	
			ALUOP <= "1011";
		wait for 100 ns;	
			ALUOP <= "1100";
		wait for 100 ns;	
			ALUOP <= "1101";
			

      -- insert stimulus here 

      wait;
   end process;

   Funct_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			Funct <= "010000";
		wait for 20 ns;
			Funct <= "010001";
		wait for 20 ns;
			Funct <= "010010";
		wait for 20 ns;
			Funct <= "010011";
		wait for 20 ns;
			Funct <= "010100";
   end process;

END;
