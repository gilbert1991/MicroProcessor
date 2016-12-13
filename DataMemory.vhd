----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:07 12/11/2016 
-- Design Name: 
-- Module Name:    DataMem - Behavioral 
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

entity DataMemory is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (5 downto 0);		-- Address from ALUResult
           DatatoWrite : in  STD_LOGIC_VECTOR (31 downto 0);	-- Data from GPR_Rt.
           MemWrite : in  STD_LOGIC;
           MemRead : in  STD_LOGIC;
           MemData : out  STD_LOGIC_VECTOR (31 downto 0);
			  sel_Addr : in STD_LOGIC_VECTOR (5 downto 0);
			  DMem_out : out STD_LOGIC_VECTOR (31 downto 0)
			  );
end DataMemory;

architecture Behavioral of DataMemory is
	signal DataMem : DATA_MEMORY := (x"b7e15163", x"5618cb1c", x"f45044d5", x"9287be8e", x"30bf3847", x"cef6b200", x"6d2e2bb9", x"0b65a572", x"a99d1f2b", x"47d498e4", x"e60c129d", x"84438c56", x"227b060f", x"c0b27fc8", x"5ee9f981", x"fd21733a", x"9b58ecf3", x"399066ac", x"d7c7e065", x"75ff5a1e", x"1436d3d7", x"b26e4d90", x"50a5c749", x"eedd4102", x"8d14babb", x"2b4c3474", x"00000000", x"00000000", x"00000000", x"00000000", x"00000000", x"00000000", x"00000000", x"00000000", x"B7E15163", x"9E3779B9", x"00000000", x"00000000", others => x"00000000");	-- Initialization
	
begin
	DMem_out <= DataMem(conv_integer(sel_Addr));
	
	MemData <= DataMem(conv_integer(Address)) when MemRead = '1';
	
	Process(clock, clear)
	begin
		if (clear = '1') then
			DataMem <= (others => x"00000000");
		elsif (rising_edge(clock)) then
			if (MemWrite = '1') then		-- Let's hope MemWrite control Signal have longer delay.
				DataMem(conv_integer(Address)) <= DatatoWrite;
			else
				null;
			end if;
		else
			null;
		end if;
	end process;

end Behavioral;

