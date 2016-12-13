----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:09:49 12/12/2016 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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
use work.SingleCycle_PKG.All;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUControl is
    Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (3 downto 0);
			  ALU_OP : out ALU_OPERATION);
end ALUControl;

architecture Behavioral of ALUControl is

begin
	Process(ALUOp, Funct)
	begin
		case ALUOp is
			when "0000" =>
				if (Funct = "010000") then
					ALU_op <= O_ADD;
				elsif (Funct = "010001") then
					ALU_op <= O_SUB;
				elsif (Funct = "010010") then
					ALU_op <= O_AND;
				elsif (Funct = "010011") then
					ALU_op <= O_OR;
				elsif (Funct = "010100") then
					ALU_op <= O_NOR;
				else
					ALU_op <= O_NULL;
				end if;
			when "0001" =>
				ALU_op <= O_ADD;
			when "0010" =>
				ALU_op <= O_SUB;
			when "0011" =>
				ALU_op <= O_AND;
			when "0100" =>
				ALU_op <= O_OR;
			when "0101" =>
				ALU_op <= O_SHL;
			when "0110" =>
				ALU_op <= O_SHR;
			when "0111" =>
				ALU_op <= O_ADD;
			when "1000" =>
				ALU_op <= O_ADD;
			when "1001" =>
				ALU_op <= O_BLT;
			when "1010" =>
				ALU_op <= O_BEQ;
			when "1011" =>
				ALU_op <= O_BNE;
			when others =>		-- Exception
				ALU_op <= O_NULL;
		end case;
	end process;

end Behavioral;

