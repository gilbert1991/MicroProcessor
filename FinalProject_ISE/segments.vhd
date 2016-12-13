----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:00 10/23/2016 
-- Design Name: 
-- Module Name:    segments - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segments is
    Port ( value : in  STD_LOGIC_VECTOR (3 downto 0);
           segs : out  STD_LOGIC_VECTOR (6 downto 0));
end segments;

architecture Behavioral of segments is

begin
with value(3 downto 0) select
	segs <=  "1000000" when "0000",
				"1111001" when "0001",
				"0100100" when "0010",
				"0110000" when "0011",
				"0011001" when "0100",
				"0010010" when "0101",
				"0000010" when "0110",
				"1111000" when "0111",
				"0000000" when "1000",
				"0010000" when "1001",
				"0001000" when "1010",
				"0000011" when "1011",
				"1000110" when "1100",
				"0100001" when "1101",
				"0000110" when "1110",
				"0001110" when "1111",
				"1111111" when others;
end Behavioral;

