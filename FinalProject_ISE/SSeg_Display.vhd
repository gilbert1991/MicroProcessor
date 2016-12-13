----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:58 10/23/2016 
-- Design Name: 
-- Module Name:    SSeg_Display - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSeg_Display is
    Port ( clkin : in std_logic;
			  btnd_clr : in std_logic;
			  Disp_bits : in std_logic_vector(31 downto 0);	-- 32 bits to be displayed on 8 7-segments.
           an : inout  STD_LOGIC_VECTOR (7 downto 0);
			  sseg : out STD_LOGIC_VECTOR (6 downto 0));
end SSeg_Display;

architecture Behavioral of SSeg_Display is

component segments is
    Port ( value : in  STD_LOGIC_VECTOR (3 downto 0);
           segs : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal counterforDisplay: STD_LOGIC_VECTOR(11 downto 0);

signal segs : STD_LOGIC_VECTOR(6 downto 0);
signal value : STD_LOGIC_VECTOR (3 downto 0);

begin
segmentStr: segments port map(value, segs);

	process(btnd_clr, clkin, Disp_bits)
	begin
		if (btnd_clr = '1') then
			counterforDisplay <= x"000";
		elsif (CLKIN'event and clkin = '1') then
			if (counterforDisplay = x"000") then
				
				if (an(0) = '0') then
					an(0) <= '1';
					value <= Disp_bits(11 downto 8);
					sseg <= segs;
					an(1) <= '0';
				elsif (an(1) = '0') then
					an(1) <= '1';
					value <= Disp_bits(15 downto 12);
					sseg <= segs;
					an(2) <= '0';
				elsif (an(2) = '0') then
					an(2) <= '1';
					value <= Disp_bits(19 downto 16);
					sseg <= segs;
					an(3) <= '0';
				elsif (an(3) = '0') then
					an(3) <= '1';
					value <= Disp_bits(23 downto 20);
					sseg <= segs;
					an(4) <= '0';
				elsif (an(4) = '0') then
					an(4) <= '1';
					value <= Disp_bits(27 downto 24);
					sseg <= segs;
					an(5) <= '0';
				elsif (an(5) = '0') then
					an(5) <= '1';
					value <= Disp_bits(31 downto 28);
					sseg <= segs;
					an(6) <= '0';
				elsif (an(6) = '0') then
					an(6) <= '1';
					value <= Disp_bits(3 downto 0);
					sseg <= segs;
					an(7) <= '0';
				elsif (an(7) = '0') then
					an(7) <= '1';
					value <= Disp_bits(7 downto 4);
					sseg <= segs;
					an(0) <= '0';
				end if;
			end if;
			counterforDisplay <= counterforDisplay + 1;
			if (counterforDisplay = x"fff") then
				counterforDisplay <= x"000";
			end if;
		end if;
	end process;

end Behavioral;

