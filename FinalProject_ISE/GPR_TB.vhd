--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:26:56 12/12/2016
-- Design Name:   
-- Module Name:   /home/jharvard/ahd/FinalProject/GPR_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GPRegisters
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
 
ENTITY GPR_TB IS
END GPR_TB;
 
ARCHITECTURE behavior OF GPR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GPRegisters
    PORT(
         Clock : IN  std_logic;
         Clear : IN  std_logic;
         Rs : IN  std_logic_vector(4 downto 0);
         Rt : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         RegDst : IN  std_logic;
         MemData : IN  std_logic_vector(31 downto 0);
         ALUResult : IN  std_logic_vector(31 downto 0);
         MemtoReg : IN  std_logic;
         RegWrite : IN  std_logic;
         GPR_Rs : OUT  std_logic_vector(31 downto 0);
         GPR_Rt : OUT  std_logic_vector(31 downto 0);
         sel_Addr : IN  std_logic_vector(4 downto 0);
         GPR_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
signal Clock : std_logic := '1';
   signal Clear : std_logic := '0';
   signal Rs : std_logic_vector(4 downto 0) := "01010";
   signal Rt : std_logic_vector(4 downto 0) := "01100";
   signal Rd : std_logic_vector(4 downto 0) := "01111";
   signal RegDst : std_logic := '1';		-- first R type
   signal MemData : std_logic_vector(31 downto 0) := x"88997897";
   signal ALUResult : std_logic_vector(31 downto 0) := x"22334221";
   signal MemtoReg : std_logic := '0';
   signal RegWrite : std_logic := '1';
   signal sel_Addr : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal GPR_Rs : std_logic_vector(31 downto 0);
   signal GPR_Rt : std_logic_vector(31 downto 0);
   signal GPR_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GPRegisters PORT MAP (
          Clock => Clock,
          Clear => Clear,
          Rs => Rs,
          Rt => Rt,
          Rd => Rd,
          RegDst => RegDst,
          MemData => MemData,
          ALUResult => ALUResult,
          MemtoReg => MemtoReg,
          RegWrite => RegWrite,
          GPR_Rs => GPR_Rs,
          GPR_Rt => GPR_Rt,
          sel_Addr => sel_Addr,
          GPR_out => GPR_out
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '1';
		wait for Clock_period/2;
		Clock <= '0';
		wait for Clock_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 11 ns;	-- Let's hope there is delay in control signal change.
			RegDst <= not RegDst;
      wait for Clock_period;
			RegDst <= not RegDst;
		wait for Clock_period;
			RegDst <= not RegDst;
			RegWrite <= not RegWrite;
		wait for Clock_period;
			MemtoReg <= not MemtoReg;
			RegWrite <= not RegWrite;
      -- insert stimulus here 
      wait;
   end process;

	data_proc :process
	begin
		wait for 15 ns;
			ALUresult <= x"20000000";
		wait for Clock_period;
			ALUresult <= x"30000000";
		wait for Clock_period;
			ALUresult <= x"40000000";
		wait for Clock_period;
			MemData <= x"fffff000";
		wait;
	end process;

END;
