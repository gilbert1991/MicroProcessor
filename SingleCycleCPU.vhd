----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:38 12/12/2016 
-- Design Name: 
-- Module Name:    SingleCycleCPU - Behavioral 
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

entity SingleCycleCPU is
    Port ( Clock : in  STD_LOGIC;
           Clear : in  STD_LOGIC;
			  sel_Addr : in STD_LOGIC_VECTOR (5 downto 0);
			  DMem_out : out STD_LOGIC_VECTOR (31 downto 0);
			  GPR_out : out STD_LOGIC_VECTOR (31 downto 0)
			 );
end SingleCycleCPU;

architecture Behavioral of SingleCycleCPU is

component Program_Counter is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           isJump : in  STD_LOGIC;
           isBranch : in  STD_LOGIC;
			  isHAL : in STD_LOGIC;
			  Jump_Address : in STD_LOGIC_VECTOR (25 downto 0);
           sign_extended : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : inout  STD_LOGIC_VECTOR (31 downto 0):= (others=> '0'));
end component;

signal PC : STD_LOGIC_VECTOR (31 downto 0);
signal isBranch : STD_LOGIC;

component ControlUnit is
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
end component;

--signal opcode : STD_LOGIC_VECTOR (5 downto 0);
signal RegDst, Branch, isJump, MemRead, MemWrite, ALUSrc, RegWrite :STD_LOGIC;
signal isHAL : STD_Logic := '0';

component ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  sign_extended : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUSrc : in STD_LOGIC;
			  ALU_OP : in ALU_OPERATION;
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0);
           compResult : out  STD_LOGIC);
end component;

signal ALUResult : STD_LOGIC_VECTOR (31 downto 0);
signal compResult : STD_LOGIC;

component ALUControl is
    Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (3 downto 0);
			  ALU_OP : out ALU_OPERATION);
end component;

signal ALUOp : STD_LOGIC_VECTOR (3 downto 0);
signal ALU_OP : ALU_OPERATION;

component DataMemory is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (5 downto 0);		-- Address from ALUResult
           DatatoWrite : in  STD_LOGIC_VECTOR (31 downto 0);	-- Data from GPR_Rt.
           MemWrite : in  STD_LOGIC;
           MemRead : in  STD_LOGIC;
           Memdata : out  STD_LOGIC_VECTOR (31 downto 0);
			  sel_Addr : in STD_LOGIC_VECTOR (5 downto 0);
			  DMem_out : out STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

signal MemData : STD_LOGIC_VECTOR (31 downto 0);
--signal D_Mem : DATA_MEMORY;

component GPRegisters is
    Port ( Clock : in STD_LOGIC;
			  Clear : in STD_LOGIC;
			  Rs : in  STD_LOGIC_VECTOR (4 downto 0);
           Rt : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDst : in  STD_LOGIC;		-- which is the destination of write back
           MemData : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUResult : in STD_LOGIC_VECTOR (31 downto 0);
			  MemtoReg : in STD_LOGIC;		-- which data to write into register
           RegWrite : in  STD_LOGIC;	-- write back
           GPR_Rs : out  STD_LOGIC_VECTOR (31 downto 0);
           GPR_Rt : out  STD_LOGIC_VECTOR (31 downto 0);
			  sel_Addr : in STD_LOGIC_VECTOR (4 downto 0);
			  GPR_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal GPR_Rs, GPR_Rt :STD_LOGIC_VECTOR (31 downto 0);

component InstrMemory is
    Port ( PC : in  STD_LOGIC_VECTOR (7 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0)
--			  I_Mem : out Instruction_MEMORY
			  );
end component;

--signal I_Mem : Instruction_MEMORY;

signal Instruction : STD_LOGIC_VECTOR (31 downto 0);

component Sign_Extension is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal sign_extended : STD_LOGIC_VECTOR (31 downto 0);

begin


InstructionFetch : InstrMemory port map (PC(7 downto 0), Instruction);

SignExtension : Sign_Extension port map (Instruction(15 downto 0),sign_extended);

isBranch <= Branch and compResult;
PC_Update : Program_Counter port map (clock, clear, isJump, isBranch, isHAL, Instruction(25 downto 0) ,sign_extended, PC);

Data_Mem : DataMemory port map (clock, clear, ALUResult(5 downto 0), GPR_Rt, MemWrite, MemRead, MemData, sel_Addr, DMem_out);

RegisterOp : GPRegisters port map (Clock, Clear, Instruction(25 downto 21), Instruction(20 downto 16), Instruction(15 downto 11), RegDst, MemData, ALUResult, MemRead, RegWrite, GPR_Rs, GPR_Rt, sel_Addr(4 downto 0), GPR_out);

CtrlUnit : ControlUnit port map (Instruction(31 downto 26), RegDst, Branch, isJump, MemRead, MemWrite, ALUOp, ALUSrc, RegWrite, isHAL);

ArithLogicUnit : ALU port map (GPR_Rs, GPR_Rt, sign_extended, ALUSrc, ALU_OP, ALUResult, compResult);

ALUCtrl : ALUControl port map (Instruction(5 downto 0), ALUOp, ALU_OP);

end Behavioral;

