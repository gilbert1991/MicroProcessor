----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:38 12/10/2016 
-- Design Name: 
-- Module Name:    InstrMem - Behavioral 
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

entity InstrMemory is
    Port ( PC : in  STD_LOGIC_VECTOR (7 downto 0);	-- Instruction address
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0)
			);
end InstrMemory;

architecture Behavioral of InstrMemory is

--
--signal InstrMem : Instruction_MEMORY := (x"04010007",x"04020008",x"00411810", x"FC000000", OTHERS => x"00000000");

signal InstrMem : Instruction_MEMORY := (x"04010002", x"0403000A",x"0404000E", x"04050002", x"20640002", x"20630001", x"00642011", x"08040001", x"00622012", x"0C44000A", X"00622013", X"1C620001", X"1044000A",X"00622014",X"1444000A",X"1844000A",X"2805FFFE",X"24850000",X"2C850000",X"30000014",X"FC000000", others => x"FFFFFFFF");

--signal InstrMem : Instruction_MEMORY := ();

begin
	
	Instruction <= InstrMem(conv_integer(PC));
--	I_Mem <= InstrMem;
	
end Behavioral;

