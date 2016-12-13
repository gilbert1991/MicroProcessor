----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:16:19 12/11/2016 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           isJump : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
--           MemtoReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (3 downto 0);
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
			  isHAL : out STD_Logic);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

--RegDst: 0-Rt, 1-Rd
RegDst <= '1' when opcode = "000000" else	-- 00, R-Type
				'0';

With opcode(3 downto 0) select
	Branch <= '1' when "1001",	-- 09, BLT	
					'1' when "1010",	-- 0A, BEQ
					'1' when "1011",	-- 0B, BNE
					'0' when others;

isJump <= '1' when opcode = "001100" else	-- 0c, JMP
				'0';

MemRead <= '1' when opcode = "000111" else	-- 07, LW
				'0';

--MemtoReg <= '1' when opcode = "000111" else	-- 07, LW, MemRead
--				'0';

MemWrite <= '1' when opcode = "001000" else	-- 08, SW
				'0';

With opcode select
	ALUOp <= "1111" when "001100",	-- 0c, JMP
				"1111" when "111111", 	-- 3F, HAL
				opcode(3 downto 0) when others;
				
-- ALUSrc: 0-GPR_Rt, 1-sign_extended_Imm
ALUSrc <= '0' when opcode = "000000" or opcode = "001001" or opcode = "001010" or opcode = "001011" else	-- 00, R-Type
				'1';

--with opcode select
--		ALUSrc <= '0' when "000000" |"",	-- 00, R-type or Branch
--						'1' when others;

RegWrite <= '0' when opcode > "000111" else
				'1';

isHAL <= '1' when opcode = "111111" else
				'0';
				
end Behavioral;

