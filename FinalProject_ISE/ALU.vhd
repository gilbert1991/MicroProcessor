----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:59:35 12/10/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.SingleCycle_PKG.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);	-- GPR_Rs
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);	-- GPR_Rt
			  sign_extended : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUSrc : in STD_LOGIC;
			  ALU_OP : in ALU_OPERATION;
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0);
           compResult : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
	signal A, B : STD_LOGIC_VECTOR (31 downto 0);
	signal shiftAmount : STD_LOGIC_VECTOR (4 downto 0);
			
begin

	A <= data1;
	B <= data2 when ALUSrc = '0' else	-- sel GPR[Rt]
			sign_extended;		-- sel Sign_extended imm
	
	shiftAmount <= sign_extended(4 downto 0);
				
	process(A, B, ALU_op)
	begin
		case ALU_OP is
			when O_ADD =>
				ALUResult <= A + B;
				compResult <='0';
			when O_SUB =>
				ALUResult <= A - B;
				compResult <='0';				
			when O_AND =>
				ALUResult <= A and B;
				compResult <='0';
			when O_OR =>
				ALUResult <= A or B;
				compResult <='0';
			when O_NOR =>
				ALUResult <= Not(A or B);
				compResult <='0';
			when O_SHL =>
				ALUResult <= std_logic_vector(unsigned(data1) sll conv_integer(shiftAmount));
--				ALUResult <= data1 sll conv_integer(shiftAmount);
				compResult <='0';
			when O_SHR =>
				ALUResult <= std_logic_vector(unsigned(data1) srl conv_integer(shiftAmount));
				compResult <='0';
			when O_BLT =>
				ALUResult <= x"00000000";
				if (A < B) then
					compResult <= '1';
				else
					compResult <= '0';
				end if;
			when O_BEQ =>
				ALUResult <= x"00000000";
				if (A = B) then
					compResult <= '1';
				else
					compResult <= '0';
				end if;
			when O_BNE =>
				ALUResult <= x"00000000";
				if (A = B) then
					compResult <= '0';
				else
					compResult <= '1';
				end if;
			when others =>
				ALUResult <= x"00000000";
				compResult <= '0';
		end case;
	end process;
	
end Behavioral;

