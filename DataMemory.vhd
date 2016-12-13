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
	signal DataMem : DATA_MEMORY := (others => x"00000000");	-- Initialization
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

