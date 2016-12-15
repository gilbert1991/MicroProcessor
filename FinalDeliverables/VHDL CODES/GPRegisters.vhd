----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:55:39 12/11/2016 
-- Design Name: 
-- Module Name:    GPRegisters - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.SingleCycle_PKG.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GPRegisters is
    Port ( Clock : in STD_LOGIC;
			  Clear : in STD_LOGIC;
			  Rs : in  STD_LOGIC_VECTOR (4 downto 0);
           Rt : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in  STD_LOGIC;		-- which is the destination of write back
           MemData : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUResult : in STD_LOGIC_VECTOR (31 downto 0);
			  MemtoReg : in STD_LOGIC;		-- which data to write into register
           RegWrite : in  STD_LOGIC;	-- write back
           GPR_Rs : out  STD_LOGIC_VECTOR (31 downto 0);
           GPR_Rt : out  STD_LOGIC_VECTOR (31 downto 0);
			  sel_Addr : in STD_LOGIC_VECTOR (4 downto 0);
			  GPR_out : out STD_LOGIC_VECTOR (31 downto 0));	-- Just for drive the project
end GPRegisters;

architecture Behavioral of GPRegisters is
	
	signal WriteDestination : STD_LOGIC_VECTOR (4 downto 0);
	signal DatatoWrite : STD_LOGIC_VECTOR (31 downto 0);
	signal GPR : GENERAL_PURPOSE_REGISTER := (others => x"00000000");
	
begin
	GPR_out <= GPR(conv_integer(sel_Addr));
	
	WITH RegDst SELECT
		WriteDestination <= Rt when '0',
									Rd when others;
									
	WITH MemtoReg SELECT
		DatatoWrite <= MemData when '1',
							ALUResult when others;
							
	GPR_Rs <= GPR(conv_integer(Rs));
	GPR_Rt <= GPR(conv_integer(Rt));
	
	Process(CLEAR, Clock)
	begin
		if (CLEAR = '1') then
			GPR <= (others => x"00000000");
		elsif (rising_edge(clock)) then
			if (RegWrite = '1') then
				GPR(conv_integer(WriteDestination)) <= DatatoWrite;
			end if;
		end if;
	end process;
	
end Behavioral;

