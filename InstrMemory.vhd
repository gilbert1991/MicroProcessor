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

--Sample 1
--signal InstrMem : Instruction_MEMORY := (x"04010007",x"04020008",x"00411810", x"FC000000", OTHERS => x"00000000");

--Sample 2
--signal InstrMem : Instruction_MEMORY := (x"04010002", x"0403000A",x"0404000E", x"04050002", x"20640002", x"20630001", x"00642011", x"08040001", x"00622012", x"0C44000A", X"00622013", X"1C620001", X"1044000A",X"00622014",X"1444000A",X"1844000A",X"2805FFFE",X"24850000",X"2C850000",X"30000014",X"FC000000", others => x"FFFFFFFF");

signal InstrMem : Instruction_MEMORY := (x"041e0020", x"041d004e", x"041c001a", x"1d610000", x"00610810", x"00810810", x"00202810", x"04060003", x"14a50001", x"08c60001", x"2c06fffd", x"04060003", x"18210001", x"04c60001", x"2fc6fffd", x"00a10813", x"21610000", x"00201810", x"1d82001a", x"00621010", x"00821010", x"00402810", x"00833010", x"0cc6001f", x"14a50001", x"08c60001", x"2c06fffd", x"00833010", x"0cc6001f", x"18420001", x"04c60001", x"2fc6fffd", x"00a21013", x"2182001a", x"00402010", x"056b0001", x"278b0001", x"016b001c", x"058c0001", x"0d8c0003", x"077b0001", x"2FBBFFD9", others => x"FFFFFFFF");

begin
	
	Instruction <= InstrMem(conv_integer(PC));
	
end Behavioral;

