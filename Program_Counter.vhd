----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:18:52 12/11/2016 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

entity Program_Counter is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           isJump : in  STD_LOGIC;
           isBranch : in  STD_LOGIC;
			  isHAL : in STD_LOGIC;
			  Jump_Address : in STD_LOGIC_VECTOR (25 downto 0);
           sign_extended : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : inout  STD_LOGIC_VECTOR (31 downto 0):= (others=> '0'));
end Program_Counter;

architecture Behavioral of Program_Counter is

signal PC_plus1 : STD_LOGIC_VECTOR (31 downto 0);	-- regular next PC.
signal Jump_pc, Branch_PC : STD_LOGIC_VECTOR (31 downto 0);
signal BranchMuxOutput : STD_LOGIC_VECTOR (31 downto 0);
signal newPC : STD_LOGIC_VECTOR (31 downto 0);

component BinaryMUX is
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin

PC_plus1 <= PC + 1;	-- Normally, it is PC + 4

-- Jump_PC
Jump_PC <= PC_plus1(31 downto 26) & Jump_Address;

-- Branch_PC
Branch_PC <= PC_plus1 + sign_extended;

-- 
BranchMux : BinaryMux port map(PC_plus1, Branch_PC, isBranch,BranchMuxOutput);

JumpMux : BinaryMux port map(BranchMuxOutput, Jump_PC, isJump, newPC);

process(clock, clear)
begin
	if (clear = '1') then
		PC <= x"00000000";
	elsif (rising_edge(clock)) then
		if (isHAL = '0') then
			PC <= newPC;
		else
			null;
		end if;
	end if;
end process;

end Behavioral;

